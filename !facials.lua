---------------
-- constants --
---------------

-- eye
EYE_NORMAL = 0
EYE_HALF   = 1
EYE_CLOSED = 2
EYE_X      = 3
EYE_WINK   = 4
EYE_DEAD   = 5
EYE_SMILE  = 6
EYE_BURN   = 7
EYE_ANGRY  = 8

-- mouth
MOUTH_CLOSED  = 0
MOUTH_A       = 1
MOUTH_O       = 2
MOUTH_U       = 3
MOUTH_WIDE    = 4
MOUTH_NEUTRAL = 5
MOUTH_WIDEA   = 6
MOUTH_SMILE   = 7
MOUTH_SAD     = 8

-------------------------
-- general expressions --
-------------------------
-- this avoids repeating values many times
local EXPRESSION_LONGJUMP = {
    eyes = EYE_NORMAL,
    mouth = {
        MOUTH_WIDEA, MOUTH_O;
        last = MOUTH_CLOSED;
        freq = 12;
        stopAt = 18;
    }
}
local EXPRESSION_PUNCH = {
    eyes = EYE_NORMAL,
    mouth = {
        MOUTH_O, MOUTH_U;
        last = MOUTH_CLOSED;
        freq = 4;
        stopAt = 7;
    }
}
local EXPRESSION_JUMP = {
    eyes = EYE_NORMAL,
    mouth = {
        MOUTH_A, MOUTH_CLOSED;
        last = MOUTH_CLOSED;
        freq = 13;
        stopAt = 13;
    }
}
local EXPRESSION_SUSPENDED = { -- high places
    eyes = EYE_NORMAL,
    mouth = {
        MOUTH_O, MOUTH_U;
        last = MOUTH_CLOSED;
        freq = 27;
        stopAt = 65535;
    }
}
local EXPRESSION_DEATH = {
    eyes = EYE_X,
    mouth = {
        MOUTH_WIDE, MOUTH_O;
        last = MOUTH_NEUTRAL;
        freq = 7;
        stopAt = 36;
    }
}
local EXPRESSION_DEATH_NOANIM = {
    eyes = EYE_X,
    mouth = {
        MOUTH_O, MOUTH_O;
        last = MOUTH_O;
        freq = 1;
        stopAt = 1;
    }
}
local EXPRESSION_FORCE = {
    eyes = EYE_ANGRY,
    mouth = {
        MOUTH_O, MOUTH_U;
        last = MOUTH_NEUTRAL;
        freq = 7;
        stopAt = 13;
    }
}
local EXPRESSION_KB = {
    eyes = EYE_X,
    mouth = {
        MOUTH_O, MOUTH_U;
        last = MOUTH_U;
        freq = 4;
        stopAt = 6;
    }
}
local EXPRESSION_FALL = {
    eyes = EYE_X,
    mouth = {
        MOUTH_WIDE, MOUTH_WIDE;
        last = MOUTH_WIDE;
        freq = 1;
        stopAt = 1;
    }
}
-----------------
-- expressions --
-----------------
local UTAU_EXPRESSION_TABLE = {
    default = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_CLOSED, MOUTH_CLOSED;
            last = MOUTH_CLOSED;
            freq = 1;
            stopAt = 1;
        }
    },
    [CHAR_ANIM_RUNNING_UNUSED] = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_O, MOUTH_U;
            last = MOUTH_NEUTRAL;
            freq = 9;
            stopAt = 52;
        }
    },


    [CHAR_ANIM_FAST_LONGJUMP] = EXPRESSION_LONGJUMP,
    [CHAR_ANIM_SLOW_LONGJUMP] = EXPRESSION_LONGJUMP,

    [CHAR_ANIM_FIRST_PUNCH] = EXPRESSION_PUNCH,
    [CHAR_ANIM_SECOND_PUNCH] = EXPRESSION_PUNCH,
    [CHAR_ANIM_FIRST_PUNCH_FAST] = EXPRESSION_PUNCH,
    [CHAR_ANIM_SECOND_PUNCH_FAST] = EXPRESSION_PUNCH,

    [CHAR_ANIM_SINGLE_JUMP] = EXPRESSION_JUMP,
    [CHAR_ANIM_TRIPLE_JUMP] = EXPRESSION_JUMP,
    [CHAR_ANIM_DOUBLE_JUMP_RISE] = EXPRESSION_JUMP,
    [CHAR_ANIM_JUMP_RIDING_SHELL] = EXPRESSION_JUMP,
    [CHAR_ANIM_JUMP_WITH_LIGHT_OBJ] = EXPRESSION_JUMP,
    [CHAR_ANIM_HANDSTAND_JUMP] = EXPRESSION_JUMP,
    [CHAR_ANIM_SLIDEJUMP] = EXPRESSION_JUMP,
    [CHAR_ANIM_AIR_KICK] = EXPRESSION_JUMP,
    [CHAR_ANIM_GROUND_KICK] = EXPRESSION_JUMP,

    [CHAR_ANIM_FIRE_LAVA_BURN] = {
        eyes = EYE_BURN,
        mouth = {
            MOUTH_WIDEA, MOUTH_O;
            last = MOUTH_WIDEA;
            freq = 8;
            stopAt = 52;
        }
    },

    [CHAR_ANIM_HANG_ON_CEILING] = EXPRESSION_SUSPENDED,
    [CHAR_ANIM_HANG_ON_OWL] = EXPRESSION_SUSPENDED,

    [CHAR_ANIM_SUFFOCATING] = EXPRESSION_DEATH,
    [CHAR_ANIM_DYING_FALL_OVER] = EXPRESSION_DEATH_NOANIM,
    [CHAR_ANIM_DYING_IN_QUICKSAND] = EXPRESSION_DEATH_NOANIM,
    [CHAR_ANIM_DYING_ON_BACK] = EXPRESSION_DEATH,
    [CHAR_ANIM_WATER_DYING] = EXPRESSION_DEATH,
    [CHAR_ANIM_DYING_ON_STOMACH] = EXPRESSION_DEATH_NOANIM,

    [CHAR_ANIM_FIRST_PUNCH] = EXPRESSION_FORCE,
    [CHAR_ANIM_SECOND_PUNCH] = EXPRESSION_FORCE,
    [CHAR_ANIM_THROW_LIGHT_OBJECT] = EXPRESSION_FORCE,
    [CHAR_ANIM_HEAVY_THROW] = EXPRESSION_FORCE,
    [CHAR_ANIM_GROUND_THROW] = EXPRESSION_FORCE,
    [CHAR_ANIM_WATER_THROW_OBJ] = EXPRESSION_FORCE,
    [CHAR_ANIM_GRAB_HEAVY_OBJECT] = EXPRESSION_FORCE,
    [CHAR_ANIM_WALK_WITH_HEAVY_OBJ] = EXPRESSION_FORCE,
    [CHAR_ANIM_IDLE_HEAVY_OBJ] = {
        eyes = EYE_ANGRY,
        mouth = {
            MOUTH_NEUTRAL, MOUTH_NEUTRAL;
            last = MOUTH_NEUTRAL;
            freq = 1;
            stopAt = 1;
        }
    },

    [CHAR_ANIM_BEING_GRABBED] = {
        eyes = EYE_BURN,
        mouth = {
            MOUTH_O, MOUTH_U;
            last = MOUTH_O;
            freq = 13;
            stopAt = 49;
        }
    },
    [CHAR_ANIM_AIRBORNE_ON_STOMACH] = {
        eyes = EYE_BURN,
        mouth = {
            MOUTH_WIDEA, MOUTH_WIDEA;
            last = MOUTH_WIDEA;
            freq = 1;
            stopAt = 1;
        }
    },

    [CHAR_ANIM_PUSHING] = {
        eyes = EYE_X,
        mouth = {
            MOUTH_O, MOUTH_U;
            last = MOUTH_CLOSED;
            freq = 27;
            stopAt = 65535;
        }
    },

    [CHAR_ANIM_START_RIDING_SHELL] = {
        eyes = EYE_SMILE,
        mouth = {
            MOUTH_A, MOUTH_U;
            last = MOUTH_SMILE;
            freq = 6;
            stopAt = 10;
        }
    },
    [CHAR_ANIM_BEND_KNESS_RIDING_SHELL] = {
        eyes = EYE_SMILE,
        mouth = {
            MOUTH_SMILE, MOUTH_SMILE;
            last = MOUTH_SMILE;
            freq = 1;
            stopAt = 1;
        }
    },
     [CHAR_ANIM_RIDING_SHELL] = {
        eyes = EYE_SMILE,
        mouth = {
            MOUTH_SMILE, MOUTH_SMILE;
            last = MOUTH_SMILE;
            freq = 1;
            stopAt = 1;
        }
    },

    [CHAR_ANIM_ELECTROCUTION] = {
        eyes = EYE_BURN,
        mouth = {
            MOUTH_U, MOUTH_U;
            last = MOUTH_U;
            freq = 1;
            stopAt = 1;
        }
    },

    [CHAR_ANIM_SHOCKED] = {
        eyes = EYE_BURN,
        mouth = {
            MOUTH_WIDE, MOUTH_O;
            last = MOUTH_O;
            freq = 1;
            stopAt = 65535;
        }
    },

    [CHAR_ANIM_UNLOCK_DOOR] = {
        eyes = EYE_SMILE,
        mouth = {
            MOUTH_SMILE, MOUTH_SMILE;
            last = MOUTH_SMILE;
            freq = 1;
            stopAt = 1;
        }
    },

    [CHAR_ANIM_START_SLEEP_IDLE] = {
        eyes = EYE_HALF,
        mouth = {
            MOUTH_O, MOUTH_U;
            last = MOUTH_NEUTRAL;
            freq = 9;
            stopAt = 26;
        }
    },
    [CHAR_ANIM_START_SLEEP_SCRATCH] = {
        eyes = EYE_HALF,
        mouth = {
            MOUTH_NEUTRAL, MOUTH_NEUTRAL;
            last = MOUTH_NEUTRAL;
            freq = 1;
            stopAt = 1;
        }
    },
    [CHAR_ANIM_START_SLEEP_YAWN] = {
        eyes = EYE_X,
        mouth = {
            MOUTH_WIDE, MOUTH_WIDE;
            last = MOUTH_WIDE;
            freq = 1;
            stopAt = 1;
        }
    },
    [CHAR_ANIM_START_SLEEP_SITTING] = {
        eyes = EYE_CLOSED,
        mouth = {
            MOUTH_NEUTRAL, MOUTH_NEUTRAL;
            last = MOUTH_NEUTRAL;
            freq = 1;
            stopAt = 1;
        }
    },
    [CHAR_ANIM_SLEEP_IDLE] = {
        eyes = EYE_CLOSED,
        mouth = {
            MOUTH_NEUTRAL, MOUTH_NEUTRAL;
            last = MOUTH_NEUTRAL;
            freq = 1;
            stopAt = 1;
        }
    },
    [CHAR_ANIM_SLEEP_START_LYING] = {
        eyes = EYE_CLOSED,
        mouth = {
            MOUTH_NEUTRAL, MOUTH_NEUTRAL;
            last = MOUTH_NEUTRAL;
            freq = 1;
            stopAt = 1;
        }
    },
    [CHAR_ANIM_SLEEP_LYING] = {
        eyes = EYE_CLOSED,
        mouth = {
            MOUTH_NEUTRAL, MOUTH_NEUTRAL;
            last = MOUTH_NEUTRAL;
            freq = 1;
            stopAt = 1;
        }
    },

    [CHAR_ANIM_STAR_DANCE] = {
        eyes = EYE_WINK,
        mouth = {
            MOUTH_SMILE, MOUTH_O;
            last = MOUTH_SMILE;
            freq = 35;
            stopAt = 66;
        }
    },
    [CHAR_ANIM_WATER_STAR_DANCE] = {
        eyes = EYE_WINK,
        mouth = {
            MOUTH_SMILE, MOUTH_SMILE;
            last = MOUTH_SMILE;
            freq = 1;
            stopAt = 1;
        }
    },
    [CHAR_ANIM_SUMMON_STAR] = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_CLOSED, MOUTH_O;
            last = MOUTH_SMILE;
            freq = 43;
            stopAt = 67;
        }
    },

    [CHAR_ANIM_TIPTOE] = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_U, MOUTH_U;
            last = MOUTH_U;
            freq = 1;
            stopAt = 1;
        }
    },

    [CHAR_ANIM_TRIPLE_JUMP_LAND] = {
        eyes = EYE_WINK,
        mouth = {
            MOUTH_A, MOUTH_CLOSED;
            last = MOUTH_A;
            freq = 6;
            stopAt = 15;
        }
    },

    [CHAR_ANIM_HOLDING_BOWSER] = {
        eyes = EYE_ANGRY,
        mouth = {
            MOUTH_O, MOUTH_U;
            last = MOUTH_O;
            freq = 60;
            stopAt = 65535;
        }
    },
    [CHAR_ANIM_SWINGING_BOWSER] = {
        eyes = EYE_ANGRY,
        mouth = {
            MOUTH_O, MOUTH_U;
            last = MOUTH_O;
            freq = 60;
            stopAt = 65535;
        }
    },
    [CHAR_ANIM_GRAB_BOWSER] = {
        eyes = EYE_X,
        mouth = {
            MOUTH_WIDE, MOUTH_WIDE;
            last = MOUTH_WIDE;
            freq = 1;
            stopAt = 1;
        }
    },
    [CHAR_ANIM_RELEASE_BOWSER] = {
        eyes = EYE_X,
        mouth = {
            MOUTH_A, MOUTH_O;
            last = MOUTH_NEUTRAL;
            freq = 6;
            stopAt = 10;
        }
    },

    [CHAR_ANIM_BREAKDANCE] = {
        eyes = EYE_SMILE,
        mouth = {
            MOUTH_SMILE, MOUTH_SMILE;
            last = MOUTH_SMILE;
            freq = 1;
            stopAt = 1;
        }
    },

    [CHAR_ANIM_SOFT_BACK_KB] = EXPRESSION_KB,
    [CHAR_ANIM_SOFT_FRONT_KB] = EXPRESSION_KB,
    [CHAR_ANIM_BACKWARD_KB] = EXPRESSION_KB,
    [CHAR_ANIM_FORWARD_KB] = EXPRESSION_KB,
    [CHAR_ANIM_AIR_FORWARD_KB] = EXPRESSION_KB,
    [CHAR_ANIM_GROUND_BONK] = EXPRESSION_KB,
    [CHAR_ANIM_BACKWARDS_WATER_KB] = EXPRESSION_KB,
    [CHAR_ANIM_WATER_FORWARD_KB] = EXPRESSION_KB,

    -- [CHAR_ANIM_GENERAL_FALL] = EXPRESSION_FALL,
    [CHAR_ANIM_FALL_FROM_SLIDE] = EXPRESSION_FALL,
    [CHAR_ANIM_FALL_FROM_SLIDE_KICK] = EXPRESSION_FALL,
    [CHAR_ANIM_FALL_FROM_SLIDING_WITH_LIGHT_OBJ] = EXPRESSION_FALL,
    [CHAR_ANIM_FALL_FROM_WATER] = EXPRESSION_FALL,
    -- [CHAR_ANIM_DOUBLE_JUMP_FALL] = EXPRESSION_FALL,

    [CHAR_ANIM_SHIVERING] = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_O, MOUTH_U;
            last = MOUTH_O;
            freq = 29;
            stopAt = 65535;
        }
    },
    [CHAR_ANIM_SHIVERING_WARMING_HAND] = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_U, MOUTH_U;
            last = MOUTH_U;
            freq = 1;
            stopAt = 1;
        }
    },

    [CHAR_ANIM_CREDITS_WAVING] = {
        eyes = EYE_WINK,
        mouth = {
            MOUTH_SMILE, MOUTH_SMILE;
            last = MOUTH_SMILE;
            freq = 1;
            stopAt = 1;
        }
    },
    [CHAR_ANIM_CREDITS_RAISE_HAND] = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_SMILE, MOUTH_U;
            last = MOUTH_O;
            freq = 71;
            stopAt = 73;
        }
    },
    [CHAR_ANIM_CREDITS_RAISE_HAND] = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_NEUTRAL, MOUTH_U;
            last = MOUTH_O;
            freq = 61;
            stopAt = 67;
        }
    },
    [CHAR_ANIM_CREDITS_PEACE_SIGN] = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_NEUTRAL, MOUTH_A;
            last = MOUTH_A;
            freq = 100;
            stopAt = 100;
        }
    },

    [CHAR_ANIM_LAND_ON_STOMACH] = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_U, MOUTH_U;
            last = MOUTH_U;
            freq = 1;
            stopAt = 1;
        }
    },

    [CHAR_ANIM_COUGHING] = {
        eyes = EYE_HALF,
        mouth = {
            MOUTH_O, MOUTH_U;
            last = MOUTH_O;
            freq = 5;
            stopAt = 65535;
        }
    },
    [CHAR_ANIM_THROW_CATCH_KEY] = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_SMILE, MOUTH_A;
            last = MOUTH_SMILE;
            freq = 67;
            stopAt = 95;
        }
    },

    [CHAR_ANIM_BOTTOM_STUCK_IN_GROUND] = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_SAD, MOUTH_O;
            last = MOUTH_U;
            freq = 128;
            stopAt = 149;
        }
    },
    [CHAR_ANIM_LEGS_STUCK_IN_GROUND] = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_SAD, MOUTH_O;
            last = MOUTH_SMILE;
            freq = 118;
            stopAt = 137;
        }
    },

    [CHAR_ANIM_MISSING_CAP] = {
        eyes = EYE_NORMAL,
        mouth = {
            MOUTH_CLOSED, MOUTH_O;
            last = MOUTH_SAD;
            freq = 63;
            stopAt = 116;
        }
    },
    [CHAR_ANIM_WALK_PANTING] = {
        eyes = EYE_HALF,
        mouth = {
            MOUTH_O, MOUTH_U;
            last = MOUTH_O;
            freq = 7;
            stopAt = 65535;
        }
    },

    [CHAR_ANIM_DROWNING_PART1] = {
        eyes = EYE_X,
        mouth = {
            MOUTH_O, MOUTH_U;
            last = MOUTH_O;
            freq = 4;
            stopAt = 65535;
        }
    },
    [CHAR_ANIM_DROWNING_PART2] = {
        eyes = EYE_BURN,
        mouth = {
            MOUTH_SAD, MOUTH_SAD;
            last = MOUTH_SAD;
            freq = 1;
            stopAt = 1;
        }
    },
}

local gFaceStates = {}
function get_state(o)
    if not gFaceStates[o] then
        gFaceStates[o] = {
            -- eye
            eyeTimer = 0,
            eyeBlink = 0,

            -- mouth
            mouthTimer = 0,
            freq = 1,
            prevAnim = nil,
        }
    end
    return gFaceStates[o]
end

function utau_eye_switch(node, matStackIndex)
    local asSwitchNode = cast_graph_node(node)
    local o = geo_get_current_object()
    local s = get_state(o)

    local anim =
        UTAU_EXPRESSION_TABLE[o.header.gfx.animInfo.animID]
        or UTAU_EXPRESSION_TABLE.default
    local eyes = anim.eyes

    s.eyeTimer = s.eyeTimer + 1

    if s.eyeTimer > 4 then -- blink duration
        s.eyeTimer = -math.random(64)
    elseif s.eyeTimer > 0 and (eyes == EYE_NORMAL or eyes == EYE_HALF) then
        eyes = EYE_CLOSED
    end

    asSwitchNode.selectedCase = eyes
end

function utau_mouth_switch(node, matStackIndex)
    local asSwitchNode = cast_graph_node(node)
    local o = geo_get_current_object()
    local s = get_state(o)
    local anim =
        UTAU_EXPRESSION_TABLE[o.header.gfx.animInfo.animID]
        or UTAU_EXPRESSION_TABLE.default

    if s.prevAnim ~= anim then
        s.mouthTimer = 0
    end

    s.mouthTimer = s.mouthTimer + 1

    asSwitchNode.selectedCase =
        s.mouthTimer > anim.mouth.stopAt
        and anim.mouth.last
        or anim.mouth[(s.mouthTimer // anim.mouth.freq) % #anim.mouth + 1]

    s.prevAnim = anim
end
