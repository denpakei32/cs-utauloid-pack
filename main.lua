-- name: [CS] \\#CCCCFF\\UTAU\\#D9BFFF\\lo\\#E6B2FF\\id \\#F2A5FF\\Pa\\#FF99FF\\ck
-- description: come back to the desc. later...

local TEXT_MOD_NAME = get_active_mod().name

if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

-----------------
-- MAIN MODELS --
-----------------
local E_MODEL_DEFOKO = smlua_model_util_get_id("defoko_main_geo")
local E_MODEL_REI = smlua_model_util_get_id("rei_main_geo")
local E_MODEL_MOMO = smlua_model_util_get_id("momo_main_geo")

-----------------
-- ALT. MODELS --
-----------------
local E_MODEL_DEFOKO_SPOKENFOR = smlua_model_util_get_id("defoko_spokenfor_geo")
local E_MODEL_REI_QUEENOFVENUS = smlua_model_util_get_id("rei_queenofvenus_geo")
local E_MODEL_MOMO_SPOKENFOR = smlua_model_util_get_id("momo_spokenfor_geo")

local E_MODEL_DEFOKO_LONGSLEEVES = smlua_model_util_get_id("defoko_longsleeves_geo")
local E_MODEL_REI_THEHOLE = smlua_model_util_get_id("rei_thehole_geo")

-----------------
-- STAR MODELS --
-----------------
local E_MODEL_RICE = smlua_model_util_get_id("defoko_star_rice_geo")
local E_MODEL_PEACH = smlua_model_util_get_id("momo_star_peach_geo")
local E_MODEL_KARAAGE = smlua_model_util_get_id("rei_star_karaage_geo")

----------
-- CAPS --
----------
local CAPTABLE_DEFOKO = {
    normal = smlua_model_util_get_id("defoko_main_cap_geo"),
    wing = smlua_model_util_get_id("defoko_main_wingcap_geo"),
    metal = smlua_model_util_get_id("defoko_main_metalcap_geo"),
}
local CAPTABLE_REI = {
    normal = smlua_model_util_get_id("rei_main_cap_geo"),
    wing = smlua_model_util_get_id("rei_main_wingcap_geo"),
    metal = smlua_model_util_get_id("rei_main_metalcap_geo"),
}
local CAPTABLE_MOMO = {
    normal = smlua_model_util_get_id("momo_main_cap_geo"),
    wing = smlua_model_util_get_id("momo_main_wingcap_geo"),
    metal = smlua_model_util_get_id("momo_main_metalcap_geo"),
}

local CAPTABLE_DEFOKO_SPOKENFOR = {
    normal = smlua_model_util_get_id("defoko_spokenfor_cap_geo"),
    wing = smlua_model_util_get_id("defoko_spokenfor_wingcap_geo"),
    metal = smlua_model_util_get_id("defoko_spokenfor_metalcap_geo"),
}

local CAPTABLE_REI_THEHOLE = {
    normal = smlua_model_util_get_id("rei_thehole_cap_geo"),
    wing = smlua_model_util_get_id("rei_thehole_wingcap_geo"),
    metal = smlua_model_util_get_id("rei_thehole_metalcap_geo"),
}

local CAPTABLE_REI_QUEENOFVENUS = {
    normal = smlua_model_util_get_id("rei_queenofvenus_cap_geo"),
    wing = smlua_model_util_get_id("rei_queenofvenus_wingcap_geo"),
    metal = smlua_model_util_get_id("rei_queenofvenus_metalcap_geo"),
}

----------------
-- LIFE ICONS --
----------------
local TEX_DEFOKO_LIFE_ICON = get_texture_info("defoko_icon")
local TEX_REI_LIFE_ICON = get_texture_info("rei_icon")
local TEX_MOMO_LIFE_ICON = get_texture_info("momo_icon")

--------------
-- GRAFITTI --
--------------
local TEX_DEFOKO_GRAFITTI = get_texture_info("defoko_grafitti")
local TEX_REI_GRAFITTI = get_texture_info("rei_grafitti")
local TEX_MOMO_GRAFITTI = get_texture_info("momo_grafitti")

-------------------
-- CS MENU MUSIC --
-------------------
local E_DEFOKO_CSMENU = audio_stream_load("DefokoCS.ogg")
local E_REI_CSMENU = audio_stream_load("ReiCS.ogg")
local E_MOMO_CSMENU = audio_stream_load("MomoCS.ogg")

-----------
-- ANIMS --
-----------
local ANIMTABLE_DEFOKO = {
	[CHAR_ANIM_A_POSE] = "UTAU_A_POSE",

	[CHAR_ANIM_IDLE_HEAD_LEFT] = "DEFOKO_IDLE",
	[CHAR_ANIM_IDLE_HEAD_RIGHT] = "DEFOKO_IDLE",
	[CHAR_ANIM_IDLE_HEAD_CENTER] = "DEFOKO_IDLE",

	[CHAR_ANIM_RUNNING] = "UTAU_RUN",
	[CHAR_ANIM_RUNNING_UNUSED] = "UTAU_RUN",

	[charSelect.CS_ANIM_MENU] = "DEFOKO_CS",

	[CHAR_ANIM_TURNING_PART1] = "UTAU_RUN_TURN_FROZEN",
	[CHAR_ANIM_TURNING_PART2] = "UTAU_RUN_TURN",

    [CHAR_ANIM_FALL_OVER_BACKWARDS] = "utau_anim_01",
    [CHAR_ANIM_GROUND_POUND_LANDING] = "utau_anim_3A",
    [CHAR_ANIM_LEGS_STUCK_IN_GROUND] = "utau_anim_55",
    [CHAR_ANIM_SLOW_LAND_FROM_DIVE] = "utau_anim_5A",
    [CHAR_ANIM_FORWARD_KB] = "utau_anim_7C",
    [CHAR_ANIM_RELEASE_BOWSER] = "utau_anim_B7",
    [CHAR_ANIM_WAKE_FROM_SLEEP] = "utau_anim_C8",
    [CHAR_ANIM_WAKE_FROM_LYING] = "utau_anim_C9",
    [CHAR_ANIM_DYING_ON_BACK] = "utau_anim_03",
    [CHAR_ANIM_CLIMB_DOWN_LEDGE] = "utau_anim_1C",
    [CHAR_ANIM_HANG_ON_OWL] = "utau_anim_2B",
    [CHAR_ANIM_HANG_ON_CEILING] = "utau_anim_35",
    [CHAR_ANIM_DYING_ON_STOMACH] = "utau_anim_2E",
    [CHAR_ANIM_BOTTOM_STUCK_IN_GROUND] = "utau_anim_3E",
    [CHAR_ANIM_SLIDING_ON_BOTTOM_WITH_LIGHT_OBJ] = "utau_anim_45",
    [CHAR_ANIM_FALL_FROM_SLIDE_KICK] = "utau_anim_53",
    [CHAR_ANIM_SLIDE_KICK] = "utau_anim_8C",
    [CHAR_ANIM_CROUCH_FROM_SLIDE_KICK] = "utau_anim_8D",
    [CHAR_ANIM_MOVE_ON_WIRE_NET_RIGHT] = "utau_anim_5C",
    [CHAR_ANIM_MOVE_ON_WIRE_NET_LEFT] = "utau_anim_5D",
    [CHAR_ANIM_HANDSTAND_RIGHT] = "utau_anim_C7",
    [CHAR_ANIM_HANDSTAND_LEFT] = "utau_anim_C6",
    [CHAR_ANIM_START_SLEEP_SITTING] = "utau_anim_84",
    [CHAR_ANIM_SLEEP_IDLE] = "utau_anim_85",
    [CHAR_ANIM_SLEEP_START_LYING] = "utau_anim_86",
    [CHAR_ANIM_SLEEP_LYING] = "utau_anim_87",
    [CHAR_ANIM_DIVE] = "utau_anim_88",
    [CHAR_ANIM_SLIDE_DIVE] = "utau_anim_89",
    [CHAR_ANIM_STOP_SLIDE_LIGHT_OBJ] = "utau_anim_8B",
    [CHAR_ANIM_SLIDE_MOTIONLESS] = "utau_anim_8E",
    [CHAR_ANIM_SLIDE] = "utau_anim_91",
    [CHAR_ANIM_STOP_SLIDE] = "utau_anim_8F",
    [CHAR_ANIM_FALL_FROM_SLIDE] = "utau_anim_90",
    [CHAR_ANIM_CRAWLING] = "utau_anim_99",
    [CHAR_ANIM_LAND_ON_STOMACH] = "utau_anim_2C",
    [CHAR_ANIM_SUFFOCATING] = "utau_anim_2F",
    [CHAR_ANIM_DYING_FALL_OVER] = "utau_anim_32",
    [CHAR_ANIM_BREAKDANCE] = "utau_anim_71",
    [CHAR_ANIM_GROUND_BONK] = "utau_anim_8A",
    [CHAR_ANIM_STOP_CRAWLING] = "utau_anim_9A",
    [CHAR_ANIM_START_CRAWLING] = "utau_anim_9B",
}
local ANIMTABLE_MOMO = {
	[CHAR_ANIM_A_POSE] = "UTAU_A_POSE",

	[CHAR_ANIM_IDLE_HEAD_LEFT] = "MOMO_IDLE",
	[CHAR_ANIM_IDLE_HEAD_RIGHT] = "MOMO_IDLE",
	[CHAR_ANIM_IDLE_HEAD_CENTER] = "MOMO_IDLE",

	[CHAR_ANIM_RUNNING] = "UTAU_RUN",
	[CHAR_ANIM_RUNNING_UNUSED] = "UTAU_RUN",

	[charSelect.CS_ANIM_MENU] = "MOMO_CS",

	[CHAR_ANIM_TURNING_PART1] = "UTAU_RUN_TURN_FROZEN",
	[CHAR_ANIM_TURNING_PART2] = "UTAU_RUN_TURN",

    [CHAR_ANIM_FALL_OVER_BACKWARDS] = "utau_anim_01",
    [CHAR_ANIM_GROUND_POUND_LANDING] = "utau_anim_3A",
    [CHAR_ANIM_LEGS_STUCK_IN_GROUND] = "utau_anim_55",
    [CHAR_ANIM_SLOW_LAND_FROM_DIVE] = "utau_anim_5A",
    [CHAR_ANIM_FORWARD_KB] = "utau_anim_7C",
    [CHAR_ANIM_RELEASE_BOWSER] = "utau_anim_B7",
    [CHAR_ANIM_WAKE_FROM_SLEEP] = "utau_anim_C8",
    [CHAR_ANIM_WAKE_FROM_LYING] = "utau_anim_C9",
    [CHAR_ANIM_DYING_ON_BACK] = "utau_anim_03",
    [CHAR_ANIM_CLIMB_DOWN_LEDGE] = "utau_anim_1C",
    [CHAR_ANIM_HANG_ON_OWL] = "utau_anim_2B",
    [CHAR_ANIM_HANG_ON_CEILING] = "utau_anim_35",
    [CHAR_ANIM_DYING_ON_STOMACH] = "utau_anim_2E",
    [CHAR_ANIM_BOTTOM_STUCK_IN_GROUND] = "utau_anim_3E",
    [CHAR_ANIM_SLIDING_ON_BOTTOM_WITH_LIGHT_OBJ] = "utau_anim_45",
    [CHAR_ANIM_FALL_FROM_SLIDE_KICK] = "utau_anim_53",
    [CHAR_ANIM_SLIDE_KICK] = "utau_anim_8C",
    [CHAR_ANIM_CROUCH_FROM_SLIDE_KICK] = "utau_anim_8D",
    [CHAR_ANIM_MOVE_ON_WIRE_NET_RIGHT] = "utau_anim_5C",
    [CHAR_ANIM_MOVE_ON_WIRE_NET_LEFT] = "utau_anim_5D",
    [CHAR_ANIM_HANDSTAND_RIGHT] = "utau_anim_C7",
    [CHAR_ANIM_HANDSTAND_LEFT] = "utau_anim_C6",
    [CHAR_ANIM_START_SLEEP_SITTING] = "utau_anim_84",
    [CHAR_ANIM_SLEEP_IDLE] = "utau_anim_85",
    [CHAR_ANIM_SLEEP_START_LYING] = "utau_anim_86",
    [CHAR_ANIM_SLEEP_LYING] = "utau_anim_87",
    [CHAR_ANIM_DIVE] = "utau_anim_88",
    [CHAR_ANIM_SLIDE_DIVE] = "utau_anim_89",
    [CHAR_ANIM_STOP_SLIDE_LIGHT_OBJ] = "utau_anim_8B",
    [CHAR_ANIM_SLIDE_MOTIONLESS] = "utau_anim_8E",
    [CHAR_ANIM_SLIDE] = "utau_anim_91",
    [CHAR_ANIM_STOP_SLIDE] = "utau_anim_8F",
    [CHAR_ANIM_FALL_FROM_SLIDE] = "utau_anim_90",
    [CHAR_ANIM_CRAWLING] = "utau_anim_99",
    [CHAR_ANIM_LAND_ON_STOMACH] = "utau_anim_2C",
    [CHAR_ANIM_SUFFOCATING] = "utau_anim_2F",
    [CHAR_ANIM_DYING_FALL_OVER] = "utau_anim_32",
    [CHAR_ANIM_BREAKDANCE] = "utau_anim_71",
    [CHAR_ANIM_GROUND_BONK] = "utau_anim_8A",
    [CHAR_ANIM_STOP_CRAWLING] = "utau_anim_9A",
    [CHAR_ANIM_START_CRAWLING] = "utau_anim_9B",
}
local ANIMTABLE_REI = {
	[CHAR_ANIM_A_POSE] = "UTAU_A_POSE",

	[CHAR_ANIM_IDLE_HEAD_LEFT] = "REI_IDLE",
	[CHAR_ANIM_IDLE_HEAD_RIGHT] = "REI_IDLE",
	[CHAR_ANIM_IDLE_HEAD_CENTER] = "REI_IDLE",

	[CHAR_ANIM_RUNNING] = "UTAU_RUN",
	[CHAR_ANIM_RUNNING_UNUSED] = "UTAU_RUN",

	[charSelect.CS_ANIM_MENU] = "REI_CS",

	[CHAR_ANIM_TURNING_PART1] = "UTAU_RUN_TURN_FROZEN",
	[CHAR_ANIM_TURNING_PART2] = "UTAU_RUN_TURN",

    [CHAR_ANIM_FALL_OVER_BACKWARDS] = "utau_anim_01",
    [CHAR_ANIM_GROUND_POUND_LANDING] = "utau_anim_3A",
    [CHAR_ANIM_LEGS_STUCK_IN_GROUND] = "utau_anim_55",
    [CHAR_ANIM_SLOW_LAND_FROM_DIVE] = "utau_anim_5A",
    [CHAR_ANIM_FORWARD_KB] = "utau_anim_7C",
    [CHAR_ANIM_RELEASE_BOWSER] = "utau_anim_B7",
    [CHAR_ANIM_WAKE_FROM_SLEEP] = "utau_anim_C8",
    [CHAR_ANIM_WAKE_FROM_LYING] = "utau_anim_C9",
    [CHAR_ANIM_DYING_ON_BACK] = "utau_anim_03",
    [CHAR_ANIM_CLIMB_DOWN_LEDGE] = "utau_anim_1C",
    [CHAR_ANIM_HANG_ON_OWL] = "utau_anim_2B",
    [CHAR_ANIM_HANG_ON_CEILING] = "utau_anim_35",
    [CHAR_ANIM_DYING_ON_STOMACH] = "utau_anim_2E",
    [CHAR_ANIM_BOTTOM_STUCK_IN_GROUND] = "utau_anim_3E",
    [CHAR_ANIM_SLIDING_ON_BOTTOM_WITH_LIGHT_OBJ] = "utau_anim_45",
    [CHAR_ANIM_FALL_FROM_SLIDE_KICK] = "utau_anim_53",
    [CHAR_ANIM_SLIDE_KICK] = "utau_anim_8C",
    [CHAR_ANIM_CROUCH_FROM_SLIDE_KICK] = "utau_anim_8D",
    [CHAR_ANIM_MOVE_ON_WIRE_NET_RIGHT] = "utau_anim_5C",
    [CHAR_ANIM_MOVE_ON_WIRE_NET_LEFT] = "utau_anim_5D",
    [CHAR_ANIM_HANDSTAND_RIGHT] = "utau_anim_C7",
    [CHAR_ANIM_HANDSTAND_LEFT] = "utau_anim_C6",
    [CHAR_ANIM_START_SLEEP_SITTING] = "utau_anim_84",
    [CHAR_ANIM_SLEEP_IDLE] = "utau_anim_85",
    [CHAR_ANIM_SLEEP_START_LYING] = "utau_anim_86",
    [CHAR_ANIM_SLEEP_LYING] = "utau_anim_87",
    [CHAR_ANIM_DIVE] = "utau_anim_88",
    [CHAR_ANIM_SLIDE_DIVE] = "utau_anim_89",
    [CHAR_ANIM_STOP_SLIDE_LIGHT_OBJ] = "utau_anim_8B",
    [CHAR_ANIM_SLIDE_MOTIONLESS] = "utau_anim_8E",
    [CHAR_ANIM_SLIDE] = "utau_anim_91",
    [CHAR_ANIM_STOP_SLIDE] = "utau_anim_8F",
    [CHAR_ANIM_FALL_FROM_SLIDE] = "utau_anim_90",
    [CHAR_ANIM_CRAWLING] = "utau_anim_99",
    [CHAR_ANIM_LAND_ON_STOMACH] = "utau_anim_2C",
    [CHAR_ANIM_SUFFOCATING] = "utau_anim_2F",
    [CHAR_ANIM_DYING_FALL_OVER] = "utau_anim_32",
    [CHAR_ANIM_BREAKDANCE] = "utau_anim_71",
    [CHAR_ANIM_GROUND_BONK] = "utau_anim_8A",
    [CHAR_ANIM_STOP_CRAWLING] = "utau_anim_9A",
    [CHAR_ANIM_START_CRAWLING] = "utau_anim_9B",
}

------------
-- VOICES --
------------
local VOICETABLE_DEFOKO = {
    [CHAR_SOUND_OKEY_DOKEY] = 'DefokoOkieDokie.ogg', -- Starting game
    [CHAR_SOUND_LETS_A_GO] = 'DefokoLetsDoThis.ogg', -- Starting level
    [CHAR_SOUND_GAME_OVER] = 'DefokoGameOver.ogg', -- Game Overed
    [CHAR_SOUND_PUNCH_YAH] = 'DefokoYah.ogg', -- Punch 1
    [CHAR_SOUND_PUNCH_WAH] = 'DefokoWah.ogg', -- Punch 2
    [CHAR_SOUND_PUNCH_HOO] = 'DefokoHoo.ogg', -- Punch 3
    [CHAR_SOUND_YAH_WAH_HOO] = {'DefokoYah.ogg', 'DefokoWah.ogg', 'DefokoHoo.ogg'}, -- First Jump Sounds
    [CHAR_SOUND_HOOHOO] = 'DefokoHooHoo.ogg', -- Second jump sound
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'DefokoYahoo.ogg', 'DefokoWaha.ogg', 'DefokoYippee.ogg'}, -- Triple jump sounds
    [CHAR_SOUND_UH] = 'DefokoUh.ogg', -- Soft wall bonk
    [CHAR_SOUND_UH2] = 'DefokoEeuh.ogg', -- Quick ledge get up
    [CHAR_SOUND_UH2_2] = 'DefokoUh.ogg', -- Landing after long jump
    [CHAR_SOUND_DOH] = 'DefokoDoh.ogg', -- Hard wall bonk
    [CHAR_SOUND_OOOF] = 'DefokoOof.ogg', -- Attacked in air
    [CHAR_SOUND_OOOF2] = 'DefokoOof.ogg', -- Land from hard bonk
    [CHAR_SOUND_HAHA] = 'DefokoHaha.ogg', -- Landing triple jump
    [CHAR_SOUND_HAHA_2] = 'DefokoHaha.ogg', -- Landing in water from big fall
    [CHAR_SOUND_YAHOO] = 'DefokoYahoo.ogg', -- Long jump
    [CHAR_SOUND_DOH] = 'DefokoDoh.ogg', -- Long jump wall bonk
    [CHAR_SOUND_WHOA] = 'DefokoWoah.ogg', -- Grabbing ledge
    [CHAR_SOUND_EEUH] = 'DefokoEeuh.ogg', -- Climbing over ledge
    [CHAR_SOUND_WAAAOOOW] = 'DefokoYell.ogg', -- Falling a long distance
    [CHAR_SOUND_TWIRL_BOUNCE] = 'DefokoBoing.ogg', -- Bouncing off of a flower spring
    [CHAR_SOUND_GROUND_POUND_WAH] = 'DefokoWah.ogg', -- Ground Pound after startup
    [CHAR_SOUND_WAH2] = 'DefokoWah.ogg', -- Throwing something
    [CHAR_SOUND_HRMM] = 'DefokoGrab.ogg', -- Lifting something
    [CHAR_SOUND_HERE_WE_GO] = 'DefokoHereWeGo.ogg', -- Star get
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'DefokoBowser.ogg', -- Throwing Bowser
    [CHAR_SOUND_ATTACKED] = 'DefokoAttacked.ogg', -- Damaged
    [CHAR_SOUND_PANTING] = 'DefokoPanting.ogg', -- Low health
    [CHAR_SOUND_PANTING_COLD] = 'DefokoPanting.ogg', -- Getting cold
    [CHAR_SOUND_ON_FIRE] = 'DefokoBurning.ogg', -- Burned
    [CHAR_SOUND_IMA_TIRED] = 'DefokoTired.ogg', -- Mario feeling tired
    [CHAR_SOUND_YAWNING] = 'DefokoYawn.ogg', -- Mario yawning before he sits down to sleep
    [CHAR_SOUND_SNORING1] = 'DefokoSnore1.ogg', -- Snore Inhale
    [CHAR_SOUND_SNORING2] = 'DefokoSnore2.ogg', -- Exhale
    [CHAR_SOUND_SNORING3] = 'DefokoSnore3.ogg', -- Sleep talking / mumbling
    [CHAR_SOUND_COUGHING1] = 'DefokoCough.ogg', -- Cough take 1
    [CHAR_SOUND_COUGHING2] = 'DefokoCough.ogg', -- Cough take 2
    [CHAR_SOUND_COUGHING3] = 'DefokoCough.ogg', -- Cough take 3
    [CHAR_SOUND_DYING] = 'DefokoDead.ogg', -- Dying from damage
    [CHAR_SOUND_DROWNING] = 'DefokoDrown.ogg', -- Running out of air underwater
    [CHAR_SOUND_MAMA_MIA] = 'DefokoMamaMia.ogg' -- Booted out of level

}

local VOICETABLE_REI = {
    [CHAR_SOUND_OKEY_DOKEY] = 'ReiOkieDokie.ogg', -- Starting game
    [CHAR_SOUND_LETS_A_GO] = 'ReiLetsDoThis.ogg', -- Starting level
    [CHAR_SOUND_GAME_OVER] = 'ReiGameOver.ogg', -- Game Overed
    [CHAR_SOUND_PUNCH_YAH] = 'ReiYah.ogg', -- Punch 1
    [CHAR_SOUND_PUNCH_WAH] = 'ReiWah.ogg', -- Punch 2
    [CHAR_SOUND_PUNCH_HOO] = 'ReiHoo.ogg', -- Punch 3
    [CHAR_SOUND_YAH_WAH_HOO] = {'ReiYah.ogg', 'ReiWah.ogg', 'ReiHoo.ogg'}, -- First Jump Sounds
    [CHAR_SOUND_HOOHOO] = 'ReiHooHoo.ogg', -- Second jump sound
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'ReiYahoo.ogg', 'ReiWaha.ogg', 'ReiYippee.ogg'}, -- Triple jump sounds
    [CHAR_SOUND_UH] = 'ReiUh.ogg', -- Soft wall bonk
    [CHAR_SOUND_UH2] = 'ReiEeuh.ogg', -- Quick ledge get up
    [CHAR_SOUND_UH2_2] = 'ReiUh.ogg', -- Landing after long jump
    [CHAR_SOUND_DOH] = 'ReiDoh.ogg', -- Hard wall bonk
    [CHAR_SOUND_OOOF] = 'ReiOof.ogg', -- Attacked in air
    [CHAR_SOUND_OOOF2] = 'ReiOof.ogg', -- Land from hard bonk
    [CHAR_SOUND_HAHA] = 'ReiHaha.ogg', -- Landing triple jump
    [CHAR_SOUND_HAHA_2] = 'ReiHaha.ogg', -- Landing in water from big fall
    [CHAR_SOUND_YAHOO] = 'ReiYahoo.ogg', -- Long jump
    [CHAR_SOUND_DOH] = 'ReiDoh.ogg', -- Long jump wall bonk
    [CHAR_SOUND_WHOA] = 'ReiWoah.ogg', -- Grabbing ledge
    [CHAR_SOUND_EEUH] = 'ReiEeuh.ogg', -- Climbing over ledge
    [CHAR_SOUND_WAAAOOOW] = 'ReiYell.ogg', -- Falling a long distance
    [CHAR_SOUND_TWIRL_BOUNCE] = 'ReiBoing.ogg', -- Bouncing off of a flower spring
    [CHAR_SOUND_GROUND_POUND_WAH] = 'ReiWah.ogg', -- Ground Pound after startup
    [CHAR_SOUND_WAH2] = 'ReiWah.ogg', -- Throwing something
    [CHAR_SOUND_HRMM] = 'ReiGrab.ogg', -- Lifting something
    [CHAR_SOUND_HERE_WE_GO] = 'ReiHereWeGo.ogg', -- Star get
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'ReiBowser.ogg', -- Throwing Bowser
    [CHAR_SOUND_ATTACKED] = 'ReiAttacked.ogg', -- Damaged
    [CHAR_SOUND_PANTING] = 'ReiPanting.ogg', -- Low health
    [CHAR_SOUND_PANTING_COLD] = 'ReiPanting.ogg', -- Getting cold
    [CHAR_SOUND_ON_FIRE] = 'ReiBurning.ogg', -- Burned
    [CHAR_SOUND_IMA_TIRED] = 'ReiTired.ogg', -- Mario feeling tired
    [CHAR_SOUND_YAWNING] = 'ReiYawn.ogg', -- Mario yawning before he sits down to sleep
    [CHAR_SOUND_SNORING1] = 'ReiSnore1.ogg', -- Snore Inhale
    [CHAR_SOUND_SNORING2] = 'ReiSnore2.ogg', -- Exhale
    [CHAR_SOUND_SNORING3] = 'ReiSnore3.ogg', -- Sleep talking / mumbling
    [CHAR_SOUND_COUGHING1] = 'ReiCough.ogg', -- Cough take 1
    [CHAR_SOUND_COUGHING2] = 'ReiCough.ogg', -- Cough take 2
    [CHAR_SOUND_COUGHING3] = 'ReiCough.ogg', -- Cough take 3
    [CHAR_SOUND_DYING] = 'ReiDead.ogg', -- Dying from damage
    [CHAR_SOUND_DROWNING] = 'ReiDrown.ogg', -- Running out of air underwater
    [CHAR_SOUND_MAMA_MIA] = 'ReiMamaMia.ogg' -- Booted out of level

}

local VOICETABLE_MOMO = {
    [CHAR_SOUND_OKEY_DOKEY] = 'MomoOkieDokie.ogg', -- Starting game
    [CHAR_SOUND_LETS_A_GO] = 'MomoLetsDoThis.ogg', -- Starting level
    [CHAR_SOUND_GAME_OVER] = 'MomoGameOver.ogg', -- Game Overed
    [CHAR_SOUND_PUNCH_YAH] = 'MomoYah.ogg', -- Punch 1
    [CHAR_SOUND_PUNCH_WAH] = 'MomoWah.ogg', -- Punch 2
    [CHAR_SOUND_PUNCH_HOO] = 'MomoHoo.ogg', -- Punch 3
    [CHAR_SOUND_YAH_WAH_HOO] = {'MomoYah.ogg', 'MomoWah.ogg', 'MomoHoo.ogg'}, -- First Jump Sounds
    [CHAR_SOUND_HOOHOO] = 'MomoHooHoo.ogg', -- Second jump sound
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'MomoYahoo.ogg', 'MomoWaha.ogg', 'MomoYippee.ogg'}, -- Triple jump sounds
    [CHAR_SOUND_UH] = 'MomoUh.ogg', -- Soft wall bonk
    [CHAR_SOUND_UH2] = 'MomoEeuh.ogg', -- Quick ledge get up
    [CHAR_SOUND_UH2_2] = 'MomoUh.ogg', -- Landing after long jump
    [CHAR_SOUND_DOH] = 'MomoDoh.ogg', -- Hard wall bonk
    [CHAR_SOUND_OOOF] = 'MomoOof.ogg', -- Attacked in air
    [CHAR_SOUND_OOOF2] = 'MomoOof.ogg', -- Land from hard bonk
    [CHAR_SOUND_HAHA] = 'MomoHaha.ogg', -- Landing triple jump
    [CHAR_SOUND_HAHA_2] = 'MomoHaha.ogg', -- Landing in water from big fall
    [CHAR_SOUND_YAHOO] = 'MomoYahoo.ogg', -- Long jump
    [CHAR_SOUND_DOH] = 'MomoDoh.ogg', -- Long jump wall bonk
    [CHAR_SOUND_WHOA] = 'MomoWoah.ogg', -- Grabbing ledge
    [CHAR_SOUND_EEUH] = 'MomoEeuh.ogg', -- Climbing over ledge
    [CHAR_SOUND_WAAAOOOW] = 'MomoYell.ogg', -- Falling a long distance
    [CHAR_SOUND_TWIRL_BOUNCE] = 'MomoBoing.ogg', -- Bouncing off of a flower spring
    [CHAR_SOUND_GROUND_POUND_WAH] = 'MomoWah.ogg', -- Ground Pound after startup
    [CHAR_SOUND_WAH2] = 'MomoWah.ogg', -- Throwing something
    [CHAR_SOUND_HRMM] = 'MomoGrab.ogg', -- Lifting something
    [CHAR_SOUND_HERE_WE_GO] = 'MomoHereWeGo.ogg', -- Star get
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'MomoBowser.ogg', -- Throwing Bowser
    [CHAR_SOUND_ATTACKED] = 'MomoAttacked.ogg', -- Damaged
    [CHAR_SOUND_PANTING] = 'MomoPanting.ogg', -- Low health
    [CHAR_SOUND_PANTING_COLD] = 'MomoPanting.ogg', -- Getting cold
    [CHAR_SOUND_ON_FIRE] = 'MomoBurning.ogg', -- Burned
    [CHAR_SOUND_IMA_TIRED] = 'MomoTired.ogg', -- Mario feeling tired
    [CHAR_SOUND_YAWNING] = 'MomoYawn.ogg', -- Mario yawning before he sits down to sleep
    [CHAR_SOUND_SNORING1] = 'MomoSnore1.ogg', -- Snore Inhale
    [CHAR_SOUND_SNORING2] = 'MomoSnore2.ogg', -- Exhale
    [CHAR_SOUND_SNORING3] = 'MomoSnore3.ogg', -- Sleep talking / mumbling
    [CHAR_SOUND_COUGHING1] = 'MomoCough.ogg', -- Cough take 1
    [CHAR_SOUND_COUGHING2] = 'MomoCough.ogg', -- Cough take 2
    [CHAR_SOUND_COUGHING3] = 'MomoCough.ogg', -- Cough take 3
    [CHAR_SOUND_DYING] = 'MomoDead.ogg', -- Dying from damage
    [CHAR_SOUND_DROWNING] = 'MomoDrown.ogg', -- Running out of air underwater
    [CHAR_SOUND_MAMA_MIA] = 'MomoMamaMia.ogg' -- Booted out of level

}

--------------
-- PALETTES --
--------------
local PALETTE_DEFOKO = {
    {
        name     = "Uta Utane",
        [PANTS]  = "1A1A1A", -- skirt n sleeves 
        [SHIRT]  = "FFFFFF", -- shirt
        [GLOVES] = "307AFF", -- headset (inside part)
        [SHOES]  = "1A1A1A", -- shoes
        [HAIR]   = "6F3E7F", -- hair
        [SKIN]   = "F7CCAA", -- skin
        [CAP]    = "1A1A1A", -- hat
        [EMBLEM] = "FFFFFF"  -- headset n gear
    },
    {
        name     = "Kikyuune Aiko",
        [PANTS]  = "424D61", -- skirt n sleeves 
        [SHIRT]  = "424D61", -- shirt
        [GLOVES] = "B2F8E9", -- headset (inside part)
        [SHOES]  = "424D61", -- shoes
        [HAIR]   = "3EC7FD", -- hair
        [SKIN]   = "F9E0E2", -- skin
        [CAP]    = "1A1A1A", -- hat
        [EMBLEM] = "DDDFE5"  -- headset n gear
    },
	    {
        name     = "Sekka Yufu",
        [PANTS]  = "F5F5F3", -- skirt n sleeves 
        [SHIRT]  = "F5F5F3", -- shirt
        [GLOVES] = "D2D2CF", -- headset (inside part)
        [SHOES]  = "5B5B5B", -- shoes
        [HAIR]   = "D2D2CF", -- hair
        [SKIN]   = "FDF2DA", -- skin
        [CAP]    = "0A0A0A", -- hat
        [EMBLEM] = "0A0A0A"  -- headset n gear
    },
	    {
        name     = "Otone Peke",
        [PANTS]  = "1A1A1A", -- skirt n sleeves 
        [SHIRT]  = "A9A7A8", -- shirt
        [GLOVES] = "7F213A", -- headset (inside part)
        [SHOES]  = "1A1A1A", -- shoes
        [HAIR]   = "B53052", -- hair
        [SKIN]   = "FFEFE0", -- skin
        [CAP]    = "1A1A1A", -- hat
        [EMBLEM] = "4E4A4C"  -- headset n gear
    },
}
local PALETTE_REI = {
    {
        name     = "Adachi Rei",
        [PANTS]  = "696765", -- skirt n pants
        [SHIRT]  = "EAEAEA", -- jacket
        [GLOVES] = "FFFFFF", -- gloves
        [SHOES]  = "FFFFFF", -- top (white by default) part of shoes
        [HAIR]   = "F05B11", -- hair
        [SKIN]   = "FAE5B7", -- skin
        [CAP]    = "101010", -- headset (black part)
        [EMBLEM] = "FFFFFF"  -- hair tasel
    },
    {
        name     = "Tsukumo Shion",
        [PANTS]  = "101010", -- skirt n pants
        [SHIRT]  = "101010", -- jacket
        [GLOVES] = "FFFFFF", -- gloves
        [SHOES]  = "FFFFFF", -- top (white by default) part of shoes
        [HAIR]   = "BF6FE3", -- hair
        [SKIN]   = "FAE5B7", -- skin
        [CAP]    = "101010", -- headset (black part)
        [EMBLEM] = "FFFFFF"  -- hair tasel
    },
	    {
        name     = "Chahakobi Meguri",
        [PANTS]  = "1F2531", -- skirt n pants
        [SHIRT]  = "FEFEFC", -- jacket
        [GLOVES] = "FFFBCC", -- gloves
        [SHOES]  = "FFFFFF", -- top (white by default) part of shoes
        [HAIR]   = "ACE21A", -- hair
        [SKIN]   = "FFFBCC", -- skin
        [CAP]    = "101010", -- headset (black part)
        [EMBLEM] = "EC2728"  -- hair tasel
    },
	    {
        name     = "Yokune Ruko",
        [PANTS]  = "2B2429", -- skirt n pants
        [SHIRT]  = "28335B", -- jacket
        [GLOVES] = "FFFFFF", -- gloves
        [SHOES]  = "E2E2E2", -- top (white by default) part of shoes
        [HAIR]   = "101010", -- hair
        [SKIN]   = "FBF4DD", -- skin
        [CAP]    = "311638", -- headset (black part)
        [EMBLEM] = "72AEFF"  -- hair tasel
    },
	    {
        name     = "Miko Ooka",
        [PANTS]  = "66453E", -- skirt n pants
        [SHIRT]  = "F8C6D0", -- jacket
        [GLOVES] = "D7A38C", -- gloves
        [SHOES]  = "F5DD9F", -- top (white by default) part of shoes
        [HAIR]   = "C9947F", -- hair
        [SKIN]   = "FFE5DE", -- skin
        [CAP]    = "101010", -- headset (black part)
        [EMBLEM] = "D63B4D"  -- hair tasel
    },
}
local PALETTE_REI_THEHOLE = { -- default palette for the hole rei
    {
        name     = "Adachi Rei",
        [PANTS]  = "121212", -- skirt n pants
        [SHIRT]  = "1A1A1A", -- jacket
        [GLOVES] = "FFFFFF", -- gloves
        [SHOES]  = "FFFFFF", -- top (white by default) part of shoes
        [HAIR]   = "F05B11", -- hair
        [SKIN]   = "FAE5B7", -- skin
        [CAP]    = "101010", -- headset (black part)
        [EMBLEM] = "FFFFFF"  -- hair tasel
    },
}
local PALETTE_MOMO = {
    {
        name     = "Momo Momone",
        [PANTS]  = "FFFFFF", -- edges of sleeves, n the front part of skirt
        [SHIRT]  = "FFFFFF", -- shirt
        [GLOVES] = "90201B", -- bows
        [SHOES]  = "4D2F1A", -- shoes
        [HAIR]   = "FB757B", -- hair
        [SKIN]   = "FCD4B5", -- skin
        [CAP]    = "3D5A23", -- hat n sleeves
        [EMBLEM] = "FFFFFF" -- gear
    },
    {
        name     = "Sukone Tei",
        [PANTS]  = "962E2D", -- edges of sleeves, n the front part of skirt
        [SHIRT]  = "FFFFFF", -- shirt
        [GLOVES] = "962E2D", -- bows
        [SHOES]  = "4F4C4D", -- shoes
        [HAIR]   = "BEADB5", -- hair
        [SKIN]   = "FEFEEB", -- skin
        [CAP]    = "4F4C4D", -- hat n sleeves
        [EMBLEM] = "FFFFFF" -- gear
    },
	    {
        name     = "Namine Ritsu",
        [PANTS]  = "FFFFFF", -- edges of sleeves, n the front part of skirt
        [SHIRT]  = "FFFFFF", -- shirt
        [GLOVES] = "E8C069", -- bows
        [SHOES]  = "532F65", -- shoes
        [HAIR]   = "FF8062", -- hair
        [SKIN]   = "FCD4B5", -- skin
        [CAP]    = "683855", -- hat n sleeves
        [EMBLEM] = "FFFFFF" -- gear
    },
	    {
        name     = "Momotaro Momone",
        [PANTS]  = "FFFFFF", -- edges of sleeves, n the front part of skirt
        [SHIRT]  = "FFFFFF", -- shirt
        [GLOVES] = "6ACC59", -- bows
        [SHOES]  = "4B3135", -- shoes
        [HAIR]   = "FB757B", -- hair
        [SKIN]   = "FCD4B5", -- skin
        [CAP]    = "4B3135", -- hat n sleeves
        [EMBLEM] = "FFFFFF" -- gear
    },
	    {
        name     = "Macne Nana",
        [PANTS]  = "FFFFFF", -- edges of sleeves, n the front part of skirt
        [SHIRT]  = "FFFFFF", -- shirt
        [GLOVES] = "1E1F1F", -- bows
        [SHOES]  = "FFFFFF", -- shoes
        [HAIR]   = "C2FF7D", -- hair
        [SKIN]   = "FCD4B5", -- skin
        [CAP]    = "FFFFFF", -- hat n sleeves
        [EMBLEM] = "FFFFFF" -- gear
    },
}
local PALETTE_REI_QUEENOFVENUS = {
    {
        name     = "Adachi Rei",
        [PANTS]  = "696765", -- skirt n pants
        [SHIRT]  = "EAEAEA", -- jacket
        [GLOVES] = "FFFFFF", -- gloves
        [SHOES]  = "FFFFFF", -- top (white by default) part of shoes
        [HAIR]   = "F05B11", -- hair
        [SKIN]   = "FAE5B7", -- skin
        [CAP]    = "0000FF", -- headset (black part)
        [EMBLEM] = "FFFFFF"  -- hair tasel
    },
    {
        name     = "Tsukumo Shion",
        [PANTS]  = "101010", -- skirt n pants
        [SHIRT]  = "101010", -- jacket
        [GLOVES] = "FFFFFF", -- gloves
        [SHOES]  = "FFFFFF", -- top (white by default) part of shoes
        [HAIR]   = "BF6FE3", -- hair
        [SKIN]   = "FAE5B7", -- skin
        [CAP]    = "0000FF", -- headset (black part)
        [EMBLEM] = "FFFFFF"  -- hair tasel
    },
	    {
        name     = "Chahakobi Meguri",
        [PANTS]  = "1F2531", -- skirt n pants
        [SHIRT]  = "FEFEFC", -- jacket
        [GLOVES] = "FFFBCC", -- gloves
        [SHOES]  = "FFFFFF", -- top (white by default) part of shoes
        [HAIR]   = "ACE21A", -- hair
        [SKIN]   = "FFFBCC", -- skin
        [CAP]    = "0000FF", -- headset (black part)
        [EMBLEM] = "EC2728"  -- hair tasel
    },
	    {
        name     = "Yokune Ruko",
        [PANTS]  = "2B2429", -- skirt n pants
        [SHIRT]  = "28335B", -- jacket
        [GLOVES] = "FFFFFF", -- gloves
        [SHOES]  = "E2E2E2", -- top (white by default) part of shoes
        [HAIR]   = "101010", -- hair
        [SKIN]   = "FBF4DD", -- skin
        [CAP]    = "0000FF", -- headset (black part)
        [EMBLEM] = "72AEFF"  -- hair tasel
    },
	    {
        name     = "Miko Ooka",
        [PANTS]  = "66453E", -- skirt n pants
        [SHIRT]  = "F8C6D0", -- jacket
        [GLOVES] = "D7A38C", -- gloves
        [SHOES]  = "F5DD9F", -- top (white by default) part of shoes
        [HAIR]   = "C9947F", -- hair
        [SKIN]   = "FFE5DE", -- skin
        [CAP]    = "0000FF", -- headset (black part)
        [EMBLEM] = "D63B4D"  -- hair tasel
    },
}

-------------------
-- HEALTH METERS --
-------------------
local HEALTH_METER_DEFOKO = {
    label = {
        left = get_texture_info("defoko_hb_l"),
        right = get_texture_info("defoko_hb_r"),
    },
    pie = {
        [1] = get_texture_info("defoko_hb_1"),
        [2] = get_texture_info("defoko_hb_2"),
        [3] = get_texture_info("defoko_hb_3"),
        [4] = get_texture_info("defoko_hb_4"),
        [5] = get_texture_info("defoko_hb_5"),
        [6] = get_texture_info("defoko_hb_6"),
        [7] = get_texture_info("defoko_hb_7"),
        [8] = get_texture_info("defoko_hb_8"),
    }
}
local HEALTH_METER_REI = {
    label = {
        left = get_texture_info("rei_hb_l"),
        right = get_texture_info("rei_hb_r"),
    },
    pie = {
        [1] = get_texture_info("rei_hb_1"),
        [2] = get_texture_info("rei_hb_2"),
        [3] = get_texture_info("rei_hb_3"),
        [4] = get_texture_info("rei_hb_4"),
        [5] = get_texture_info("rei_hb_5"),
        [6] = get_texture_info("rei_hb_6"),
        [7] = get_texture_info("rei_hb_7"),
        [8] = get_texture_info("rei_hb_8"),
    }
}
local HEALTH_METER_MOMO = {
    label = {
        left = get_texture_info("momo_hb_l"),
        right = get_texture_info("momo_hb_r"),
    },
    pie = {
        [1] = get_texture_info("momo_hb_1"),
        [2] = get_texture_info("momo_hb_2"),
        [3] = get_texture_info("momo_hb_3"),
        [4] = get_texture_info("momo_hb_4"),
        [5] = get_texture_info("momo_hb_5"),
        [6] = get_texture_info("momo_hb_6"),
        [7] = get_texture_info("momo_hb_7"),
        [8] = get_texture_info("momo_hb_8"),
    }
}

----------
-- LOAD --
----------
local function on_character_select_load()
	--------------
	--- defoko ---
	-------------- default
	init_physbone_chain(E_MODEL_DEFOKO, 0, 0.004, 1, 90, 90) -- cable
	init_physbone_chain(E_MODEL_DEFOKO, 1, 0.05, 0.9, 90, 90) -- ahoge
	init_physbone_chain(E_MODEL_DEFOKO, 2, 0.05, 0.9, 0, 90) -- necktie

    CT_DEFOKO = charSelect.character_add(
        "Defoko", -- Character Name
        "Also known as Uta Utane, she's a voicebank that comes preinstalled with UTAU, and is based on the AquesTalk TTS engine!",
        "denpakei32, chalz276", -- Credits
        "6F3E7F",           -- Menu Color
        E_MODEL_DEFOKO,       -- Character Model
        CT_MARIO,           -- Override Character
        TEX_DEFOKO_LIFE_ICON, -- Life Icon
        1.2                   -- Camera Scale
    )
	charSelect.character_add_voice(E_MODEL_DEFOKO, VOICETABLE_DEFOKO)
    if charSelect.version_get_full().major >= 17 then
	    charSelect.character_add_celebration_star(E_MODEL_DEFOKO, E_MODEL_RICE, nil)
    end
    if PALETTE_DEFOKO then
        for i = 1, #PALETTE_DEFOKO do
            charSelect.character_add_palette_preset(E_MODEL_DEFOKO, PALETTE_DEFOKO[i], PALETTE_DEFOKO[i].name)
        end
    end
	charSelect.character_add_health_meter(CT_DEFOKO, HEALTH_METER_DEFOKO)
	charSelect.character_set_category(CT_DEFOKO, TEXT_MOD_NAME)
	charSelect.character_add_animations(E_MODEL_DEFOKO, ANIMTABLE_DEFOKO)
    charSelect.character_add_menu_instrumental(CT_DEFOKO, E_DEFOKO_CSMENU)
    charSelect.character_add_graffiti(CT_DEFOKO, TEX_DEFOKO_GRAFITTI)
    charSelect.character_set_nickname(CT_DEFOKO, "Defoko")
    charSelect.character_add_caps(E_MODEL_DEFOKO, CAPTABLE_DEFOKO)

    --------------
	--- defoko ---
	-------------- long sleeves
    init_physbone_chain(E_MODEL_DEFOKO_LONGSLEEVES, 0, 0.004, 1, 90, 90) -- cable
	init_physbone_chain(E_MODEL_DEFOKO_LONGSLEEVES, 1, 0.05, 0.9, 90, 90) -- ahoge
	init_physbone_chain(E_MODEL_DEFOKO_LONGSLEEVES, 2, 0.05, 0.9, 0, 90) -- necktie

    charSelect.character_add_costume(CT_DEFOKO,
        "Defoko (Long Sleeves)",
        "Also known as Uta Utane, she's a voicebank that comes preinstalled with UTAU, and is based on the AquesTalk TTS engine!",
        "denpakei32, chalz276",
        "6F3E7F",
        E_MODEL_DEFOKO_LONGSLEEVES,
        CT_MARIO,
        TEX_DEFOKO_LIFE_ICON,
        1.2
    )
    charSelect.character_add_voice(E_MODEL_DEFOKO_LONGSLEEVES, VOICETABLE_DEFOKO)
    if charSelect.version_get_full().major >= 17 then
	    charSelect.character_add_celebration_star(E_MODEL_DEFOKO_LONGSLEEVES, E_MODEL_RICE, nil)
    end
    if PALETTE_DEFOKO then
        for i = 1, #PALETTE_DEFOKO do
            charSelect.character_add_palette_preset(E_MODEL_DEFOKO_LONGSLEEVES, PALETTE_DEFOKO[i], PALETTE_DEFOKO[i].name)
        end
    end
    charSelect.character_add_health_meter(CT_DEFOKO, HEALTH_METER_DEFOKO)
	charSelect.character_set_category(CT_DEFOKO, TEXT_MOD_NAME)
	charSelect.character_add_animations(E_MODEL_DEFOKO_LONGSLEEVES, ANIMTABLE_DEFOKO)
    charSelect.character_add_menu_instrumental(CT_DEFOKO, E_DEFOKO_CSMENU)
    charSelect.character_add_graffiti(CT_DEFOKO, TEX_DEFOKO_GRAFITTI)
    charSelect.character_set_nickname(CT_DEFOKO, "Defoko")
    charSelect.character_add_caps(E_MODEL_DEFOKO_LONGSLEEVES, CAPTABLE_DEFOKO)

    --------------
	--- defoko ---
	-------------- spoken for
    init_physbone_chain(E_MODEL_DEFOKO_SPOKENFOR, 0, 0.004, 1, 90, 90) -- cable
	init_physbone_chain(E_MODEL_DEFOKO_SPOKENFOR, 1, 0.05, 0.9, 90, 90) -- ahoge
	init_physbone_chain(E_MODEL_DEFOKO_SPOKENFOR, 2, 0.05, 0.9, 0, 90) -- necktie

    charSelect.character_add_costume(CT_DEFOKO,
        "Defoko (Spoken For)",
        "Also known as Uta Utane, she's a voicebank that comes preinstalled with UTAU, and is based on the AquesTalk TTS engine!",
        "denpakei32, chalz276",
        "6F3E7F",
        E_MODEL_DEFOKO_SPOKENFOR,
        CT_MARIO,
        TEX_DEFOKO_LIFE_ICON,
        1.2
    )
    charSelect.character_add_voice(E_MODEL_DEFOKO_SPOKENFOR, VOICETABLE_DEFOKO)
    if charSelect.version_get_full().major >= 17 then
	    charSelect.character_add_celebration_star(E_MODEL_DEFOKO_SPOKENFOR, E_MODEL_RICE, nil)
    end
    if PALETTE_DEFOKO then
        for i = 1, #PALETTE_DEFOKO do
            charSelect.character_add_palette_preset(E_MODEL_DEFOKO_SPOKENFOR, PALETTE_DEFOKO[i], PALETTE_DEFOKO[i].name)
        end
    end
    charSelect.character_add_health_meter(CT_DEFOKO, HEALTH_METER_DEFOKO)
	charSelect.character_set_category(CT_DEFOKO, TEXT_MOD_NAME)
	charSelect.character_add_animations(E_MODEL_DEFOKO_SPOKENFOR, ANIMTABLE_DEFOKO)
    charSelect.character_add_menu_instrumental(CT_DEFOKO, E_DEFOKO_CSMENU)
    charSelect.character_add_graffiti(CT_DEFOKO, TEX_DEFOKO_GRAFITTI)
    charSelect.character_set_nickname(CT_DEFOKO, "Defoko")
    charSelect.character_add_caps(E_MODEL_DEFOKO_SPOKENFOR, CAPTABLE_DEFOKO_SPOKENFOR)

	-----------
	--- rei ---
	-----------
	init_physbone_chain(E_MODEL_REI, 0, 0.05, 0.9, 90, 90) -- hair
    init_physbone_chain(E_MODEL_REI, 1, 0.2, 0.567, 90, 90) -- tie

	CT_REI = charSelect.character_add(
        "Adachi Rei", -- Character Name
        "She was projected to be both a voicebank and a humanoid robot, and her voice was completly created in Audacity!",
        "denpakei32, chalz276", -- Credits
        "F05B11",           -- Menu Color
        E_MODEL_REI,       -- Character Model
        CT_MARIO,           -- Override Character
        TEX_REI_LIFE_ICON, -- Life Icon
        1.2                   -- Camera Scale
    )
	charSelect.character_add_voice(E_MODEL_REI, VOICETABLE_REI)
    if charSelect.version_get_full().major >= 17 then
	    charSelect.character_add_celebration_star(E_MODEL_REI, E_MODEL_KARAAGE, nil)
    end
    if PALETTE_REI then
        for i = 1, #PALETTE_REI do
            charSelect.character_add_palette_preset(E_MODEL_REI, PALETTE_REI[i], PALETTE_REI[i].name)
        end
    end
	charSelect.character_add_health_meter(CT_REI, HEALTH_METER_REI)
	charSelect.character_set_category(CT_REI, TEXT_MOD_NAME)
	charSelect.character_add_animations(E_MODEL_REI, ANIMTABLE_REI)
    charSelect.character_add_menu_instrumental(CT_REI, E_REI_CSMENU)
    charSelect.character_add_graffiti(CT_REI, TEX_REI_GRAFITTI)
    charSelect.character_set_nickname(CT_REI, "Rei")
    charSelect.character_add_caps(E_MODEL_REI, CAPTABLE_REI)

    -----------
	--- rei ---
	----------- queen of venus
	init_physbone_chain(E_MODEL_REI_QUEENOFVENUS, 0, 0.05, 0.9, 90, 90) -- hair
    init_physbone_chain(E_MODEL_REI_QUEENOFVENUS, 1, 0.2, 0.567, 90, 90) -- tie

    charSelect.character_add_costume(CT_REI,
        "Rei (Queen of Venus)",
        "She was projected to be both a voicebank and a humanoid robot, and her voice was completly created in Audacity!",
        "denpakei32, chalz276",
        "F05B11",
        E_MODEL_REI_QUEENOFVENUS,
        CT_MARIO,
        TEX_REI_LIFE_ICON,
        1.2
    )
    charSelect.character_add_voice(E_MODEL_REI_QUEENOFVENUS, VOICETABLE_REI)
    if charSelect.version_get_full().major >= 17 then
	    charSelect.character_add_celebration_star(E_MODEL_REI_QUEENOFVENUS, E_MODEL_RICE, nil)
    end
    if PALETTE_REI_QUEENOFVENUS then
        for i = 1, #PALETTE_REI_QUEENOFVENUS do
            charSelect.character_add_palette_preset(E_MODEL_REI_QUEENOFVENUS, PALETTE_REI_QUEENOFVENUS[i], PALETTE_REI_QUEENOFVENUS[i].name)
        end
    end
    charSelect.character_add_health_meter(CT_REI, HEALTH_METER_REI)
	charSelect.character_set_category(CT_REI, TEXT_MOD_NAME)
	charSelect.character_add_animations(E_MODEL_REI_QUEENOFVENUS, ANIMTABLE_REI)
    charSelect.character_add_menu_instrumental(CT_REI, E_REI_CSMENU)
    charSelect.character_add_graffiti(CT_REI, TEX_REI_GRAFITTI)
    charSelect.character_set_nickname(CT_REI, "Rei")
    charSelect.character_add_caps(E_MODEL_REI_QUEENOFVENUS, CAPTABLE_REI_QUEENOFVENUS)

    -----------
	--- rei ---
	----------- the hole
	init_physbone_chain(E_MODEL_REI_THEHOLE, 0, 0.05, 0.9, 90, 90) -- hair

    charSelect.character_add_costume(CT_REI,
        "Rei (The Hole)",
        "She was projected to be both a voicebank and a humanoid robot, and her voice was completly created in Audacity!",
        "denpakei32, chalz276",
        "F05B11",
        E_MODEL_REI_THEHOLE,
        CT_MARIO,
        TEX_REI_LIFE_ICON,
        1.2
    )
    charSelect.character_add_voice(E_MODEL_REI_THEHOLE, VOICETABLE_REI)
    if charSelect.version_get_full().major >= 17 then
	    charSelect.character_add_celebration_star(E_MODEL_REI_THEHOLE, E_MODEL_RICE, nil)
    end
    if PALETTE_REI_THEHOLE then
        charSelect.character_add_palette_preset(E_MODEL_REI_THEHOLE, PALETTE_REI_THEHOLE[1], PALETTE_REI_THEHOLE[1].name)
        for i = 2, #PALETTE_REI do
            charSelect.character_add_palette_preset(E_MODEL_REI_THEHOLE, PALETTE_REI[i], PALETTE_REI[i].name)
        end
    end
    charSelect.character_add_health_meter(CT_REI, HEALTH_METER_REI)
	charSelect.character_set_category(CT_REI, TEXT_MOD_NAME)
	charSelect.character_add_animations(E_MODEL_REI_THEHOLE, ANIMTABLE_REI)
    charSelect.character_add_menu_instrumental(CT_REI, E_REI_CSMENU)
    charSelect.character_add_graffiti(CT_REI, TEX_REI_GRAFITTI)
    charSelect.character_set_nickname(CT_REI, "Rei")
    charSelect.character_add_caps(E_MODEL_REI_THEHOLE, CAPTABLE_REI_THEHOLE)

    ------------
	--- momo ---
	------------
    init_physbone_chain(E_MODEL_MOMO, 0, 0.09, 0.9, 45, 31) -- bow (back)
    init_physbone_chain(E_MODEL_MOMO, 1, 0.05, 0.9, 22, 13) -- bow

	CT_MOMO = charSelect.character_add(
        "Momo Momone", -- Character Name
        "She is designed as a maid and housekeeping robot, but she can also sing and communicate with electronic devices!",
        "denpakei32, chalz276", -- Credits
        "FB757B",           -- Menu Color
        E_MODEL_MOMO,       -- Character Model
        CT_MARIO,           -- Override Character
        TEX_MOMO_LIFE_ICON, -- Life Icon
        1.2                  -- Camera Scale
    )
	charSelect.character_add_voice(E_MODEL_MOMO, VOICETABLE_MOMO)
    if charSelect.version_get_full().major >= 17 then
	    charSelect.character_add_celebration_star(E_MODEL_MOMO, E_MODEL_PEACH, nil)
    end
    if PALETTE_MOMO then
        for i = 1, #PALETTE_MOMO do
            charSelect.character_add_palette_preset(E_MODEL_MOMO, PALETTE_MOMO[i], PALETTE_MOMO[i].name)
        end
    end
    charSelect.character_add_health_meter(CT_MOMO, HEALTH_METER_MOMO)
	charSelect.character_set_category(CT_MOMO, TEXT_MOD_NAME)
	charSelect.character_add_animations(E_MODEL_MOMO, ANIMTABLE_MOMO)
    charSelect.character_add_menu_instrumental(CT_MOMO, E_MOMO_CSMENU)
    charSelect.character_add_graffiti(CT_MOMO, TEX_MOMO_GRAFITTI)
    charSelect.character_set_nickname(CT_MOMO, "Momo")
    charSelect.character_add_caps(E_MODEL_MOMO, CAPTABLE_MOMO)

    ------------
	--- momo ---
	------------ spoken for
    charSelect.character_add_costume(CT_MOMO,
        "Momo (Spoken For)",
        "Also known as Uta Utane, she's a voicebank that comes preinstalled with UTAU, and is based on the AquesTalk TTS engine!",
        "denpakei32, chalz276",
        "FB757B",
        E_MODEL_MOMO_SPOKENFOR,
        CT_MARIO,
        TEX_MOMO_LIFE_ICON,
        1.2
    )
    charSelect.character_add_voice(E_MODEL_MOMO_SPOKENFOR, VOICETABLE_MOMO)
    if charSelect.version_get_full().major >= 17 then
	    charSelect.character_add_celebration_star(E_MODEL_MOMO_SPOKENFOR, E_MODEL_RICE, nil)
    end
    if PALETTE_MOMO then
        for i = 1, #PALETTE_MOMO do
            charSelect.character_add_palette_preset(E_MODEL_MOMO_SPOKENFOR, PALETTE_MOMO[i], PALETTE_MOMO[i].name)
        end
    end
    charSelect.character_add_health_meter(CT_MOMO, HEALTH_METER_MOMO)
	charSelect.character_set_category(CT_MOMO, TEXT_MOD_NAME)
	charSelect.character_add_animations(E_MODEL_MOMO_SPOKENFOR, ANIMTABLE_MOMO)
    charSelect.character_add_menu_instrumental(CT_MOMO, E_MOMO_CSMENU)
    charSelect.character_add_graffiti(CT_MOMO, TEX_MOMO_GRAFITTI)
    charSelect.character_set_nickname(CT_MOMO, "Momo")
    charSelect.character_add_caps(E_MODEL_MOMO_SPOKENFOR, CAPTABLE_DEFOKO_SPOKENFOR)

    -------------
    -- credits --
    -------------
    charSelect.credit_add(TEXT_MOD_NAME, "denpakei32", "Modeling/Animation/Grafitti")

	charSelect.credit_add(TEXT_MOD_NAME, "chalz276", "Voice samples/Palettes")
    charSelect.credit_add(TEXT_MOD_NAME, "TeionLeeIRL", "Voice samples")

    charSelect.credit_add(TEXT_MOD_NAME, "Cooliokid 956", "Facial code")

    charSelect.credit_add(TEXT_MOD_NAME, "Wibblus", "Physbone engine")

	charSelect.credit_add(TEXT_MOD_NAME, "AmeyaP", "Defoko voicebank")
	charSelect.credit_add(TEXT_MOD_NAME, "momomomo-P", "Momo Momone voicebank")
	charSelect.credit_add(TEXT_MOD_NAME, "missile_39", "Adachi Rei voicebank")
end
hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)

---------------------------
-- SINGLE IDLE ANIM CODE --
---------------------------
local function before_update(m)
    local get_current_number = charSelect.character_get_current_number(m.playerIndex)

    if CT_DEFOKO == get_current_number or CT_MOMO == get_current_number or CT_REI == get_current_number then
        if (m.action == ACT_IDLE) then
            m.actionTimer = m.actionTimer + 1
            if (m.actionTimer > 900 or charSelect.is_menu_open()) then
                m.actionState = 3
            else
                m.actionState = 0
            end
        end
    end
end
hook_event(HOOK_BEFORE_MARIO_UPDATE, before_update)