-- working variables for physbones
local physBoneMem

local function init_physbone_memory()
    physBoneMem = {}
    setmetatable(physBoneMem, {
        __call = function(t, o, i)
            t[o] = t[o] or {}
            t[o][i] = t[o][i] or {
                prevPos = gVec3fZero(),
                prevRootYaw = 0,
                prevRootPitch = 0,
                yaw = 0,
                pitch = 0,
                yawVel = 0,
                pitchVel = 0,
            }
            return t[o][i]
        end
    })
end

local function clean_physbone_memory(o)
    physBoneMem[o] = nil
end

init_physbone_memory()

hook_event(HOOK_ON_OBJECT_UNLOAD, clean_physbone_memory)
hook_event(HOOK_ON_LEVEL_INIT, init_physbone_memory)

-- configurable data for physbones, indexed by model ID & physbone index
_G.physBoneData = _G.physBoneData or {}

if not _G.physBoneInit then
    _G.physBoneEnabled = true
    hook_chat_command('physbone', " - Enable/Disable physbones", function(msg)
        _G.physBoneEnabled = not _G.physBoneEnabled
        djui_chat_message_create("Physbones " .. (_G.physBoneEnabled and "Enabled" or "Disabled"))
        return true
    end)

    _G.physBoneInit = true
end

-- initialize a physbone entry for a character model. fields left `nil` will use their default value.
---@param modelId ModelExtendedId|integer
---@param index integer
---@param pull number|nil (0.0 - 1.0, default 0.25) amount of force used to return the physbone chain to rest position.
---@param spring number|nil (0.0 - 1.0, default 0.5) how much physbones will wobble while reaching rest position.
---@param yawLimit number|nil (0 - 90, default 45) the maximum yaw angle that physbones can be from rest rotation.
---@param pitchLimit number|nil (0 - 90) the maximum pitch angle for physbones. matches yaw when `nil`.
---@param func fun(rotNode:GraphNodeTranslationRotation,j:integer)|nil a function to call per-joint on the chain.
function init_physbone_chain(modelId, index, pull, spring, yawLimit, pitchLimit, func)
    physBoneData[modelId] = physBoneData[modelId] or {}
    physBoneData[modelId][index] = {
        pull = math.clamp(pull or 0.25, 0.05, 1.0),
        spring = math.clamp(spring or 0.5, 0.0, 0.95) * 0.5 + 0.5,
        yawLimit = math.clamp(degrees_to_sm64(math.abs(yawLimit or 45)), 0x0000, 0x3FFF),
        pitchLimit = math.clamp(degrees_to_sm64(math.abs(pitchLimit or yawLimit or 45)), 0x0000, 0x3FFF),
        func = func,
    }
end

-- UTILS

local abs, atan, sin, cos, asin, acos, sqrt, sign, s16 = math.abs, math.atan, math.sin, math.cos, math.asin, math.acos,
    math.sign, math.sqrt, math.s16
local PI = math.pi

---@param mtx Mat4
---@return integer yaw
---@return integer pitch
local function yaw_pitch(mtx)
    if mtx.m01 > 0.0 then
        return radians_to_sm64(atan(mtx.m10, mtx.m12)), radians_to_sm64(asin(-mtx.m11))
    else
        return radians_to_sm64(atan(mtx.m10, mtx.m12) + PI), radians_to_sm64(asin(mtx.m11) + PI)
    end
end

-- GEO FUNCTION

---@param node GraphNode
---@param matStackIndex integer
function geo_physbone_chain(node, matStackIndex)
    local m = geo_get_mario_state()
    local o = geo_get_current_object()
    local i = cast_graph_node(node).parameter

    if not o or (m and m.marioBodyState.mirrorMario) then return end -- mirror room fix

    if not _G.physBoneEnabled then
        local child = node.next
        while child do
            if child.type == GRAPH_NODE_TYPE_DISPLAY_LIST then
                child = child.next
            end
            if child.type == GRAPH_NODE_TYPE_TRANSLATION_ROTATION then
                local rotNode = cast_graph_node(child)
                vec3s_copy(rotNode.rotation, gVec3sZero())
            end
            child = child.children
        end
        return
    end

    local data = physBoneData[obj_get_model_id_extended(o)]
    if not data or not data[i] then return end
    data = data[i]

    local mem = physBoneMem(o, i)

    local camInv = gMat4Zero()
    mtxf_inverse(camInv, geo_get_current_camera().matrixPtr)
    ---@type Mat4
    local mtx = gMat4Zero()
    mtxf_mul(mtx, gMatStack[matStackIndex], camInv) -- convert root matrix into world space

    local pos =
    { x = mtx.m30, y = mtx.m31, z = mtx.m32 }
    local posDelta =
    { x = mem.prevPos.x - pos.x, y = mem.prevPos.y - pos.y, z = mem.prevPos.z - pos.z }

    --normalization
    local length = 1.0 / vec3f_length({ x = mtx.m10, y = mtx.m11, z = mtx.m12 })
    mtxf_scale_vec3f(mtx, mtx, { x = length, y = length, z = length })

    local rootYaw, rootPitch = yaw_pitch(mtx)

    local yawDiff = s16(rootYaw - (mem.prevRootYaw or 0)) * mtx.m01
        - (vec3f_dot(posDelta, { x = mtx.m20, y = mtx.m21, z = mtx.m22 }) * 0x40)
    local pitchDiff = s16(rootPitch - (mem.prevRootPitch or 0))
        + (vec3f_dot(posDelta, { x = mtx.m00, y = mtx.m01, z = mtx.m02 }) * 0x40) + (posDelta.y * 0x10)

    local yaw = mem.yaw - yawDiff
    local pitch = mem.pitch - pitchDiff
    yaw = math.clamp(approach_s16_symmetric(yaw, 0, abs(yaw) * data.pull), -data.yawLimit,
        data.yawLimit)
    pitch = math.clamp(approach_s16_symmetric(pitch, 0, abs(pitch) * data.pull), -data.pitchLimit,
        data.pitchLimit)

    mem.yaw = yaw
    mem.pitch = pitch

    local j = 1
    local child = node.next

    while child do
        -- skip ahead for connected DL vertices
        if child.type == GRAPH_NODE_TYPE_DISPLAY_LIST then
            child = child.next
        end
        if child.type == GRAPH_NODE_TYPE_TRANSLATION_ROTATION then
            local rotNode = cast_graph_node(child)
            local rot = rotNode.rotation

            local fac = 1.0 / j
            rot.x = yaw * fac
            rot.z = pitch * fac

            if data.func then
                data.func(rotNode, j)
            end

            j = j + 1
        end
        child = child.children
    end

    mem.prevRootYaw = rootYaw
    mem.prevRootPitch = rootPitch
    vec3f_copy(mem.prevPos, pos)
end

---@param node GraphNode
---@param matStackIndex integer
function geo_physbone_chain_spring(node, matStackIndex)
    local m = geo_get_mario_state()
    local o = geo_get_current_object()
    local i = cast_graph_node(node).parameter

    if not o or (m and m.marioBodyState.mirrorMario) then return end -- mirror room fix

    if not _G.physBoneEnabled then
        local child = node.next
        while child do
            if child.type == GRAPH_NODE_TYPE_DISPLAY_LIST then
                child = child.next
            end
            if child.type == GRAPH_NODE_TYPE_TRANSLATION_ROTATION then
                local rotNode = cast_graph_node(child)
                vec3s_copy(rotNode.rotation, gVec3sZero())
            end
            child = child.children
        end
        return
    end

    local data = physBoneData[obj_get_model_id_extended(o)]
    if not data or not data[i] then return end
    data = data[i]

    local mem = physBoneMem(o, i)

    local camInv = gMat4Zero()
    mtxf_inverse(camInv, geo_get_current_camera().matrixPtr)
    ---@type Mat4
    local mtx = gMat4Zero()
    mtxf_mul(mtx, gMatStack[matStackIndex], camInv) -- convert root matrix into world space

    local pos =
    { x = mtx.m30, y = mtx.m31, z = mtx.m32 }
    local posDelta =
    { x = mem.prevPos.x - pos.x, y = mem.prevPos.y - pos.y, z = mem.prevPos.z - pos.z }

    --normalization
    local length = 1.0 / vec3f_length({ x = mtx.m10, y = mtx.m11, z = mtx.m12 })
    mtxf_scale_vec3f(mtx, mtx, { x = length, y = length, z = length })

    local rootYaw, rootPitch = yaw_pitch(mtx)

    local yawDiff = s16(rootYaw - mem.prevRootYaw) * mtx.m01
        - (vec3f_dot(posDelta, { x = mtx.m20, y = mtx.m21, z = mtx.m22 }) * 0x40)
    local pitchDiff = s16(rootPitch - mem.prevRootPitch)
        + (vec3f_dot(posDelta, { x = mtx.m00, y = mtx.m01, z = mtx.m02 }) * 0x40) + (posDelta.y * 0x10)

    do
        local yaw = mem.yaw - yawDiff
        local pitch = mem.pitch - pitchDiff

        mem.yawVel = mem.yawVel + (-yaw * data.pull)
        if sign(mem.yawVel) == sign(yaw) then
            mem.yawVel = mem.yawVel * data.spring
        else
            mem.yawVel = mem.yawVel * 0.9
        end

        mem.pitchVel = mem.pitchVel + (-pitch * data.pull)
        if sign(mem.pitchVel) == sign(pitch) then
            mem.pitchVel = mem.pitchVel * data.spring
        else
            mem.pitchVel = mem.pitchVel * 0.9
        end

        yaw = math.clamp(yaw + mem.yawVel, -data.yawLimit, data.yawLimit)
        pitch = math.clamp(pitch + mem.pitchVel, -data.pitchLimit, data.pitchLimit)

        mem.yaw = yaw
        mem.pitch = pitch
    end

    local j = 1
    local child = node.next

    while child do
        -- skip ahead for connected DL vertices
        if child.type == GRAPH_NODE_TYPE_DISPLAY_LIST then
            child = child.next
        end
        if child.type == GRAPH_NODE_TYPE_TRANSLATION_ROTATION then
            local rotNode = cast_graph_node(child)
            local rot = rotNode.rotation

            local fac = 1.0 / j
            rot.z = mem.yaw * fac
            rot.x = mem.pitch * fac

            if data.func then
                data.func(rotNode, j)
            end

            j = j + 1
        end
        child = child.children
    end

    mem.prevRootYaw = rootYaw
    mem.prevRootPitch = rootPitch
    vec3f_copy(mem.prevPos, pos)
end
