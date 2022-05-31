local ESX = exports['es_extended']:getSharedObject()
local colors = { {
    name = "Black",
    colorindex = 0
}, {
    name = "Carbon Black",
    colorindex = 147
}, {
    name = "Graphite",
    colorindex = 1
}, {
    name = "Anthracite Black",
    colorindex = 11
}, {
    name = "Black Steel",
    colorindex = 2
}, {
    name = "Dark Steel",
    colorindex = 3
}, {
    name = "Silver",
    colorindex = 4
}, {
    name = "Bluish Silver",
    colorindex = 5
}, {
    name = "Rolled Steel",
    colorindex = 6
}, {
    name = "Shadow Silver",
    colorindex = 7
}, {
    name = "Stone Silver",
    colorindex = 8
}, {
    name = "Midnight Silver",
    colorindex = 9
}, {
    name = "Cast Iron Silver",
    colorindex = 10
}, {
    name = "Red",
    colorindex = 27
}, {
    name = "Torino Red",
    colorindex = 28
}, {
    name = "Formula Red",
    colorindex = 29
}, {
    name = "Lava Red",
    colorindex = 150
}, {
    name = "Blaze Red",
    colorindex = 30
}, {
    name = "Grace Red",
    colorindex = 31
}, {
    name = "Garnet Red",
    colorindex = 32
}, {
    name = "Sunset Red",
    colorindex = 33
}, {
    name = "Cabernet Red",
    colorindex = 34
}, {
    name = "Wine Red",
    colorindex = 143
}, {
    name = "Candy Red",
    colorindex = 35
}, {
    name = "Hot Pink",
    colorindex = 135
}, {
    name = "Pfsiter Pink",
    colorindex = 137
}, {
    name = "Salmon Pink",
    colorindex = 136
}, {
    name = "Sunrise Orange",
    colorindex = 36
}, {
    name = "Orange",
    colorindex = 38
}, {
    name = "Bright Orange",
    colorindex = 138
}, {
    name = "Gold",
    colorindex = 99
}, {
    name = "Bronze",
    colorindex = 90
}, {
    name = "Yellow",
    colorindex = 88
}, {
    name = "Race Yellow",
    colorindex = 89
}, {
    name = "Dew Yellow",
    colorindex = 91
}, {
    name = "Dark Green",
    colorindex = 49
}, {
    name = "Racing Green",
    colorindex = 50
}, {
    name = "Sea Green",
    colorindex = 51
}, {
    name = "Olive Green",
    colorindex = 52
}, {
    name = "Bright Green",
    colorindex = 53
}, {
    name = "Gasoline Green",
    colorindex = 54
}, {
    name = "Lime Green",
    colorindex = 92
}, {
    name = "Midnight Blue",
    colorindex = 141
}, {
    name = "Galaxy Blue",
    colorindex = 61
}, {
    name = "Dark Blue",
    colorindex = 62
}, {
    name = "Saxon Blue",
    colorindex = 63
}, {
    name = "Blue",
    colorindex = 64
}, {
    name = "Mariner Blue",
    colorindex = 65
}, {
    name = "Harbor Blue",
    colorindex = 66
}, {
    name = "Diamond Blue",
    colorindex = 67
}, {
    name = "Surf Blue",
    colorindex = 68
}, {
    name = "Nautical Blue",
    colorindex = 69
}, {
    name = "Racing Blue",
    colorindex = 73
}, {
    name = "Ultra Blue",
    colorindex = 70
}, {
    name = "Light Blue",
    colorindex = 74
}, {
    name = "Chocolate Brown",
    colorindex = 96
}, {
    name = "Bison Brown",
    colorindex = 101
}, {
    name = "Creeen Brown",
    colorindex = 95
}, {
    name = "Feltzer Brown",
    colorindex = 94
}, {
    name = "Maple Brown",
    colorindex = 97
}, {
    name = "Beechwood Brown",
    colorindex = 103
}, {
    name = "Sienna Brown",
    colorindex = 104
}, {
    name = "Saddle Brown",
    colorindex = 98
}, {
    name = "Moss Brown",
    colorindex = 100
}, {
    name = "Woodbeech Brown",
    colorindex = 102
}, {
    name = "Straw Brown",
    colorindex = 99
}, {
    name = "Sandy Brown",
    colorindex = 105
}, {
    name = "Bleached Brown",
    colorindex = 106
}, {
    name = "Schafter Purple",
    colorindex = 71
}, {
    name = "Spinnaker Purple",
    colorindex = 72
}, {
    name = "Midnight Purple",
    colorindex = 142
}, {
    name = "Bright Purple",
    colorindex = 145
}, {
    name = "Cream",
    colorindex = 107
}, {
    name = "Ice White",
    colorindex = 111
}, {
    name = "Frost White",
    colorindex = 112
} }
local metalcolors = { {
    name = "Brushed Steel",
    colorindex = 117
}, {
    name = "Brushed Black Steel",
    colorindex = 118
}, {
    name = "Brushed Aluminum",
    colorindex = 119
}, {
    name = "Pure Gold",
    colorindex = 158
}, {
    name = "Brushed Gold",
    colorindex = 159
}, {
    name = "Chrome",
    colorindex = 120
} }
local mattecolors = { {
    name = "Black",
    colorindex = 12
}, {
    name = "Gray",
    colorindex = 13
}, {
    name = "Light Gray",
    colorindex = 14
}, {
    name = "Ice White",
    colorindex = 131
}, {
    name = "Blue",
    colorindex = 83
}, {
    name = "Dark Blue",
    colorindex = 82
}, {
    name = "Midnight Blue",
    colorindex = 84
}, {
    name = "Midnight Purple",
    colorindex = 149
}, {
    name = "Schafter Purple",
    colorindex = 148
}, {
    name = "Red",
    colorindex = 39
}, {
    name = "Dark Red",
    colorindex = 40
}, {
    name = "Orange",
    colorindex = 41
}, {
    name = "Yellow",
    colorindex = 42
}, {
    name = "Lime Green",
    colorindex = 55
}, {
    name = "Green",
    colorindex = 128
}, {
    name = "Frost Green",
    colorindex = 151
}, {
    name = "Foliage Green",
    colorindex = 155
}, {
    name = "Olive Darb",
    colorindex = 152
}, {
    name = "Dark Earth",
    colorindex = 153
}, {
    name = "Desert Tan",
    colorindex = 154
} }

local tyrecolors = { {
    name = "Black",
    r = 0,
    g = 0,
    b = 0
}, {
    name = "White	",
    r = 255,
    g = 255,
    b = 255
}, {
    name = "Red",
    r = 255,
    g = 0,
    b = 0
}, {
    name = "Lime",
    r = 0,
    g = 255,
    b = 0
}, {
    name = "Blue",
    r = 0,
    g = 0,
    b = 255
}, {
    name = "Yellow",
    r = 255,
    g = 255,
    b = 0
}, {
    name = "Cyan",
    r = 0,
    g = 255,
    b = 255
}, {
    name = "Magenta",
    r = 255,
    g = 0,
    b = 255
}, {
    name = "Silver",
    r = 192,
    g = 192,
    b = 192
}, {
    name = "Gray",
    r = 128,
    g = 128,
    b = 128
}, {
    name = "Maroon",
    r = 128,
    g = 0,
    b = 0
}, {
    name = "Olive",
    r = 128,
    g = 128,
    b = 0
}, {
    name = "Green",
    r = 0,
    g = 128,
    b = 0
}, {
    name = "Purple",
    r = 128,
    g = 0,
    b = 128
}, {
    name = "Green",
    r = 0,
    g = 128,
    b = 0
}, {
    name = "Teal",
    r = 0,
    g = 128,
    b = 128
}, {
    name = "Navy Blue",
    r = 0,
    g = 0,
    b = 128
} }

local vehmods = {
    modTurbo = {
        label = "Turbo",
        parent = 'upgrades',
        modType = 17,
        price = { 55.81 }
    },
    modEngine = {
        label = "Engine",
        parent = 'upgrades',
        modType = 11,
        price = { 13.95, 32.56, 65.12, 139.53 }
    },
    modBrakes = {
        label = "Brakes",
        parent = 'upgrades',
        modType = 12,
        price = { 4.65, 9.3, 18.6, 13.95 }
    },
    modTransmission = {
        label = "Transmission",
        parent = 'upgrades',
        modType = 13,
        price = { 13.95, 20.93, 46.51 }
    },
    modSuspension = {
        label = "Suspension",
        parent = 'upgrades',
        modType = 15,
        price = { 3.72, 7.44, 14.88, 29.77, 40.2 }
    },
    modArmor = {
        label = "Armor",
        parent = 'upgrades',
        modType = 16,
        price = { 69.77, 116.28, 130.00, 150.00, 180.00, 190.00 }
    },
    modPlateHolder = {
        label = "Plate - Back",
        parent = 'cosmetics',
        modType = 25,
        price = 3.49
    },
    modVanityPlate = {
        label = "Plate - Front",
        parent = 'cosmetics',
        modType = 26,
        price = 1.1
    },
    modTrimA = {
        label = "Interior",
        parent = 'cosmetics',
        modType = 27,
        price = 6.98
    },
    modOrnaments = {
        label = "Trim",
        parent = 'cosmetics',
        modType = 28,
        price = 0.9
    },
    modDashboard = {
        label = "Dashboard",
        parent = 'cosmetics',
        modType = 29,
        price = 4.65
    },
    modDial = {
        label = "Speedometer",
        parent = 'cosmetics',
        modType = 30,
        price = 4.19
    },
    modDoorSpeaker = {
        label = "Door Speakers",
        parent = 'cosmetics',
        modType = 31,
        price = 5.58
    },
    modSeats = {
        label = "Seats",
        parent = 'cosmetics',
        modType = 32,
        price = 4.65
    },
    modSteeringWheel = {
        label = "Steering Wheel",
        parent = 'cosmetics',
        modType = 33,
        price = 4.19
    },
    modShifterLeavers = {
        label = "Gear Lever",
        parent = 'cosmetics',
        modType = 34,
        price = 3.26
    },
    modAPlate = {
        label = "Quarter-Deck",
        parent = 'cosmetics',
        modType = 35,
        price = 4.19
    },
    modSpeakers = {
        label = "Speakers",
        parent = 'cosmetics',
        modType = 36,
        price = 6.98
    },
    modTrunk = {
        label = "Trunk",
        parent = 'cosmetics',
        modType = 37,
        price = 5.58
    },
    modHydrolic = {
        label = "Hydraulic",
        parent = 'cosmetics',
        modType = 38,
        price = 5.12
    },
    modEngineBlock = {
        label = "Engine Block",
        parent = 'cosmetics',
        modType = 39,
        price = 5.12
    },
    modAirFilter = {
        label = "Air Filter",
        parent = 'cosmetics',
        modType = 40,
        price = 3.72
    },
    modStruts = {
        label = "Struts",
        parent = 'cosmetics',
        modType = 41,
        price = 6.51
    },
    modArchCover = {
        label = "Arch Cover",
        parent = 'cosmetics',
        modType = 42,
        price = 4.19
    },
    modAerials = {
        label = "Aerials",
        parent = 'cosmetics',
        modType = 43,
        price = 1.12
    },
    modTrimB = {
        label = "Wings",
        parent = 'cosmetics',
        modType = 44,
        price = 6.05
    },
    modTank = {
        label = "Fuel Tank",
        parent = 'cosmetics',
        modType = 45,
        price = 4.19
    },
    modWindows = {
        label = "Windows",
        parent = 'cosmetics',
        modType = 46,
        price = 4.19
    },
    modLivery = {
        label = "Stickers",
        parent = 'cosmetics',
        modType = 48,
        price = 9.3
    },
    modFrontWheelsType0 = {
        label = "Sport",
        parent = 'modFrontWheelsTypes',
        modType = 23,
        wheelType = 0,
        price = 4.65
    },
    modFrontWheelsType1 = {
        label = "Muscle",
        parent = 'modFrontWheelsTypes',
        modType = 23,
        wheelType = 1,
        price = 4.19
    },
    modFrontWheelsType2 = {
        label = "Low Rider",
        parent = 'modFrontWheelsTypes',
        modType = 23,
        wheelType = 2,
        price = 4.65
    },
    modFrontWheelsType3 = {
        label = "SUV",
        parent = 'modFrontWheelsTypes',
        modType = 23,
        wheelType = 3,
        price = 4.19
    },
    modFrontWheelsType4 = {
        label = "All Terrain",
        parent = 'modFrontWheelsTypes',
        modType = 23,
        wheelType = 4,
        price = 4.19
    },
    modFrontWheelsType5 = {
        label = "Tuning",
        parent = 'modFrontWheelsTypes',
        modType = 23,
        wheelType = 5,
        price = 5.12
    },
    modFrontWheelsType6 = {
        label = "Motorcycle",
        parent = 'modFrontWheelsTypes',
        modType = 23,
        wheelType = 6,
        price = 3.26
    },
    modFrontWheelsType7 = {
        label = "Highend",
        parent = 'modFrontWheelsTypes',
        modType = 23,
        wheelType = 7,
        price = 5.12
    },
    wheelColor = {
        label = "Wheel Color",
        parent = 'modFrontWheelsColor',
        modType = 'wheelColor',
        price = 0.66
    },
    plateIndex = {
        label = "License Plates",
        parent = 'cosmetics',
        modType = 'plateIndex',
        price = 1.1
    },
    color1 = {
        label = "Primary Color",
        parent = 'primaryRespray',
        modType = 'color1',
        price = 1.12
    },
    color2 = {
        label = "Secondary Color",
        parent = 'secondaryRespray',
        modType = 'color2',
        price = 0.66
    },
    pearlescentColor = {
        label = "Pearlescent Color",
        parent = 'pearlescentRespray',
        modType = 'pearlescentColor',
        price = 0.88
    },
    modXenon = {
        label = "Headlight",
        parent = 'cosmetics',
        modType = 22,
        price = 3.72
    },
    modSpoilers = {
        label = "Spoilers",
        parent = 'bodyparts',
        modType = 0,
        price = 4.65
    },
    modFrontBumper = {
        label = "Front Bumper",
        parent = 'bodyparts',
        modType = 1,
        price = 5.12
    },
    modRearBumper = {
        label = "Rear Bumper",
        parent = 'bodyparts',
        modType = 2,
        price = 5.12
    },
    modSideSkirt = {
        label = "Sideskirt",
        parent = 'bodyparts',
        modType = 3,
        price = 4.65
    },
    modExhaust = {
        label = "Exhaust",
        parent = 'bodyparts',
        modType = 4,
        price = 5.12
    },
    modFrame = {
        label = "Cage",
        parent = 'bodyparts',
        modType = 5,
        price = 5.12
    },
    modGrille = {
        label = "Grille",
        parent = 'bodyparts',
        modType = 6,
        price = 3.72
    },
    modHood = {
        label = "Hood",
        parent = 'bodyparts',
        modType = 7,
        price = 4.88
    },
    modFender = {
        label = "Left Fender",
        parent = 'bodyparts',
        modType = 8,
        price = 5.12
    },
    modRightFender = {
        label = "Right Fender",
        parent = 'bodyparts',
        modType = 9,
        price = 5.12
    },
    modRoof = {
        label = "Roof",
        parent = 'bodyparts',
        modType = 10,
        price = 5.58
    },
    modHorns = {
        label = "Horns",
        parent = 'cosmetics',
        modType = 14,
        price = 1.12
    },
    neonColor = {
        label = "Neon",
        parent = 'cosmetics',
        modType = 'neonColor',
        price = 1.12
    },
    tyreSmokeColor = {
        label = "Tiresmoke",
        parent = 'wheels',
        modType = 'tyreSmokeColor',
        price = 1.12
    },
    modSticker = {
        label = "Livery 2",
        parent = "cosmetics",
        modType = 'livery2',
        price = 9.3
    }
}

local Timecycles = { { {
    value = "AmbientPUSH",
    label = "AmbientPUSH",
    description = "AmbientPUSH"
}, {
    value = "AP1_01_B_IntRefRange",
    label = "AP1_01_B_IntRefRange",
    description = "AP1_01_B_IntRefRange"
}, {
    value = "AP1_01_C_NoFog",
    label = "AP1_01_C_NoFog",
    description = "AP1_01_C_NoFog"
}, {
    value = "Bank_HLWD",
    label = "Bank_HLWD",
    description = "Bank_HLWD"
}, {
    value = "Barry1_Stoned",
    label = "Barry1_Stoned",
    description = "Barry1_Stoned"
}, {
    value = "BarryFadeOut",
    label = "BarryFadeOut",
    description = "BarryFadeOut"
}, {
    value = "baseTONEMAPPING",
    label = "baseTONEMAPPING",
    description = "baseTONEMAPPING"
}, {
    value = "BeastIntro01",
    label = "BeastIntro01",
    description = "BeastIntro01"
}, {
    value = "BeastIntro02",
    label = "BeastIntro02",
    description = "BeastIntro02"
}, {
    value = "BeastLaunch01",
    label = "BeastLaunch01",
    description = "BeastLaunch01"
}, {
    value = "BeastLaunch02",
    label = "BeastLaunch02",
    description = "BeastLaunch02"
}, {
    value = "BikerFilter",
    label = "BikerFilter",
    description = "BikerFilter"
}, {
    value = "BikerForm01",
    label = "BikerForm01",
    description = "BikerForm01"
}, {
    value = "BikerFormFlash",
    label = "BikerFormFlash",
    description = "BikerFormFlash"
}, {
    value = "Bikers",
    label = "Bikers",
    description = "Bikers"
}, {
    value = "BikersSPLASH",
    label = "BikersSPLASH",
    description = "BikersSPLASH"
}, {
    value = "blackNwhite",
    label = "blackNwhite",
    description = "blackNwhite"
}, {
    value = "BlackOut",
    label = "BlackOut",
    description = "BlackOut"
}, {
    value = "BleepYellow01",
    label = "BleepYellow01",
    description = "BleepYellow01"
}, {
    value = "BleepYellow02",
    label = "BleepYellow02",
    description = "BleepYellow02"
}, {
    value = "Bloom",
    label = "Bloom",
    description = "Bloom"
}, {
    value = "BloomLight",
    label = "BloomLight",
    description = "BloomLight"
}, {
    value = "BloomMid",
    label = "BloomMid",
    description = "BloomMid"
}, {
    value = "buggy_shack",
    label = "buggy_shack",
    description = "buggy_shack"
}, {
    value = "buildingTOP",
    label = "buildingTOP",
    description = "buildingTOP"
}, {
    value = "BulletTimeDark",
    label = "BulletTimeDark",
    description = "BulletTimeDark"
}, {
    value = "BulletTimeLight",
    label = "BulletTimeLight",
    description = "BulletTimeLight"
}, {
    value = "CAMERA_BW",
    label = "CAMERA_BW",
    description = "CAMERA_BW"
}, {
    value = "CAMERA_secuirity",
    label = "CAMERA_secuirity",
    description = "CAMERA_secuirity"
}, {
    value = "CAMERA_secuirity_FUZZ",
    label = "CAMERA_secuirity_FUZZ",
    description = "CAMERA_secuirity_FUZZ"
}, {
    value = "canyon_mission",
    label = "canyon_mission",
    description = "canyon_mission"
}, {
    value = "carMOD_underpass",
    label = "carMOD_underpass",
    description = "carMOD_underpass"
}, {
    value = "carpark",
    label = "carpark",
    description = "carpark"
}, {
    value = "carpark_dt1_02",
    label = "carpark_dt1_02",
    description = "carpark_dt1_02"
}, {
    value = "carpark_dt1_03",
    label = "carpark_dt1_03",
    description = "carpark_dt1_03"
}, {
    value = "Carpark_MP_exit",
    label = "Carpark_MP_exit",
    description = "Carpark_MP_exit"
}, {
    value = "cashdepot",
    label = "cashdepot",
    description = "cashdepot"
}, {
    value = "cashdepotEMERGENCY",
    label = "cashdepotEMERGENCY",
    description = "cashdepotEMERGENCY"
}, {
    value = "cBank_back",
    label = "cBank_back",
    description = "cBank_back"
}, {
    value = "cBank_front",
    label = "cBank_front",
    description = "cBank_front"
}, {
    value = "ch2_tunnel_whitelight",
    label = "ch2_tunnel_whitelight",
    description = "ch2_tunnel_whitelight"
}, {
    value = "CH3_06_water",
    label = "CH3_06_water",
    description = "CH3_06_water"
}, {
    value = "CHOP",
    label = "CHOP",
    description = "CHOP"
}, {
    value = "cinema",
    label = "cinema",
    description = "cinema"
}, {
    value = "cinema_001",
    label = "cinema_001",
    description = "cinema_001"
}, {
    value = "cops",
    label = "cops",
    description = "cops"
}, {
    value = "CopsSPLASH",
    label = "CopsSPLASH",
    description = "CopsSPLASH"
}, {
    value = "crane_cam",
    label = "crane_cam",
    description = "crane_cam"
}, {
    value = "crane_cam_cinematic",
    label = "crane_cam_cinematic",
    description = "crane_cam_cinematic"
}, {
    value = "CrossLine01",
    label = "CrossLine01",
    description = "CrossLine01"
}, {
    value = "CrossLine02",
    label = "CrossLine02",
    description = "CrossLine02"
}, {
    value = "CS1_railwayB_tunnel",
    label = "CS1_railwayB_tunnel",
    description = "CS1_railwayB_tunnel"
}, {
    value = "CS3_rail_tunnel",
    label = "CS3_rail_tunnel",
    description = "CS3_rail_tunnel"
}, {
    value = "CUSTOM_streetlight",
    label = "CUSTOM_streetlight",
    description = "CUSTOM_streetlight"
}, {
    value = "damage",
    label = "damage",
    description = "damage"
}, {
    value = "DeadlineNeon01",
    label = "DeadlineNeon01",
    description = "DeadlineNeon01"
}, {
    value = "default",
    label = "default",
    description = "default"
}, {
    value = "DefaultColorCode",
    label = "DefaultColorCode",
    description = "DefaultColorCode"
}, {
    value = "DONT_overide_sunpos",
    label = "DONT_overide_sunpos",
    description = "DONT_overide_sunpos"
}, {
    value = "Dont_tazeme_bro",
    label = "Dont_tazeme_bro",
    description = "Dont_tazeme_bro"
}, {
    value = "dont_tazeme_bro_b",
    label = "dont_tazeme_bro_b",
    description = "dont_tazeme_bro_b"
}, {
    value = "downtown_FIB_cascades_opt",
    label = "downtown_FIB_cascades_opt",
    description = "downtown_FIB_cascades_opt"
}, {
    value = "DrivingFocusDark",
    label = "DrivingFocusDark",
    description = "DrivingFocusDark"
}, {
    value = "DrivingFocusLight",
    label = "DrivingFocusLight",
    description = "DrivingFocusLight"
}, {
    value = "DRUG_2_drive",
    label = "DRUG_2_drive",
    description = "DRUG_2_drive"
}, {
    value = "Drug_deadman",
    label = "Drug_deadman",
    description = "Drug_deadman"
}, {
    value = "Drug_deadman_blend",
    label = "Drug_deadman_blend",
    description = "Drug_deadman_blend"
}, {
    value = "drug_drive_blend01",
    label = "drug_drive_blend01",
    description = "drug_drive_blend01"
}, {
    value = "drug_drive_blend02",
    label = "drug_drive_blend02",
    description = "drug_drive_blend02"
}, {
    value = "drug_flying_01",
    label = "drug_flying_01",
    description = "drug_flying_01"
}, {
    value = "drug_flying_02",
    label = "drug_flying_02",
    description = "drug_flying_02"
}, {
    value = "drug_flying_base",
    label = "drug_flying_base",
    description = "drug_flying_base"
}, {
    value = "DRUG_gas_huffin",
    label = "DRUG_gas_huffin",
    description = "DRUG_gas_huffin"
}, {
    value = "drug_wobbly",
    label = "drug_wobbly",
    description = "drug_wobbly"
}, {
    value = "Drunk",
    label = "Drunk",
    description = "Drunk"
}, {
    value = "dying",
    label = "dying",
    description = "dying"
}, {
    value = "eatra_bouncelight_beach",
    label = "eatra_bouncelight_beach",
    description = "eatra_bouncelight_beach"
}, {
    value = "epsilion",
    label = "epsilion",
    description = "epsilion"
}, {
    value = "exile1_exit",
    label = "exile1_exit",
    description = "exile1_exit"
}, {
    value = "exile1_plane",
    label = "exile1_plane",
    description = "exile1_plane"
}, {
    value = "ExplosionJosh",
    label = "ExplosionJosh",
    description = "ExplosionJosh"
}, {
    value = "EXT_FULLAmbientmult_art",
    label = "EXT_FULLAmbientmult_art",
    description = "EXT_FULLAmbientmult_art"
}, {
    value = "ext_int_extlight_large",
    label = "ext_int_extlight_large",
    description = "ext_int_extlight_large"
}, {
    value = "EXTRA_bouncelight",
    label = "EXTRA_bouncelight",
    description = "EXTRA_bouncelight"
}, {
    value = "eyeINtheSKY",
    label = "eyeINtheSKY",
    description = "eyeINtheSKY"
}, {
    value = "Facebook_NEW",
    label = "Facebook_NEW",
    description = "Facebook_NEW"
}, {
    value = "facebook_serveroom",
    label = "facebook_serveroom",
    description = "facebook_serveroom"
}, {
    value = "FIB_5",
    label = "FIB_5",
    description = "FIB_5"
}, {
    value = "FIB_6",
    label = "FIB_6",
    description = "FIB_6"
}, {
    value = "FIB_A",
    label = "FIB_A",
    description = "FIB_A"
}, {
    value = "FIB_B",
    label = "FIB_B",
    description = "FIB_B"
}, {
    value = "FIB_interview",
    label = "FIB_interview",
    description = "FIB_interview"
}, {
    value = "FIB_interview_optimise",
    label = "FIB_interview_optimise",
    description = "FIB_interview_optimise"
}, {
    value = "FinaleBank",
    label = "FinaleBank",
    description = "FinaleBank"
}, {
    value = "FinaleBankexit",
    label = "FinaleBankexit",
    description = "FinaleBankexit"
}, {
    value = "FinaleBankMid",
    label = "FinaleBankMid",
    description = "FinaleBankMid"
}, {
    value = "fireDEPT",
    label = "fireDEPT",
    description = "fireDEPT"
}, {
    value = "FORdoron_delete",
    label = "FORdoron_delete",
    description = "FORdoron_delete"
}, {
    value = "Forest",
    label = "Forest",
    description = "Forest"
}, {
    value = "fp_vig_black",
    label = "fp_vig_black",
    description = "fp_vig_black"
}, {
    value = "fp_vig_blue",
    label = "fp_vig_blue",
    description = "fp_vig_blue"
}, {
    value = "fp_vig_brown",
    label = "fp_vig_brown",
    description = "fp_vig_brown"
}, {
    value = "fp_vig_gray",
    label = "fp_vig_gray",
    description = "fp_vig_gray"
}, {
    value = "fp_vig_green",
    label = "fp_vig_green",
    description = "fp_vig_green"
}, {
    value = "fp_vig_red",
    label = "fp_vig_red",
    description = "fp_vig_red"
}, {
    value = "FrankilinsHOUSEhills",
    label = "FrankilinsHOUSEhills",
    description = "FrankilinsHOUSEhills"
}, {
    value = "frankilnsAUNTS_new",
    label = "frankilnsAUNTS_new",
    description = "frankilnsAUNTS_new"
}, {
    value = "frankilnsAUNTS_SUNdir",
    label = "frankilnsAUNTS_SUNdir",
    description = "frankilnsAUNTS_SUNdir"
}, {
    value = "FRANKLIN",
    label = "FRANKLIN",
    description = "FRANKLIN"
}, {
    value = "FranklinColorCode",
    label = "FranklinColorCode",
    description = "FranklinColorCode"
}, {
    value = "FranklinColorCodeBasic",
    label = "FranklinColorCodeBasic",
    description = "FranklinColorCodeBasic"
}, {
    value = "FranklinColorCodeBright",
    label = "FranklinColorCodeBright",
    description = "FranklinColorCodeBright"
}, {
    value = "FullAmbientmult_interior",
    label = "FullAmbientmult_interior",
    description = "FullAmbientmult_interior"
}, {
    value = "gallery_refmod",
    label = "gallery_refmod",
    description = "gallery_refmod"
}, {
    value = "garage",
    label = "garage",
    description = "garage"
}, {
    value = "gen_bank",
    label = "gen_bank",
    description = "gen_bank"
}, {
    value = "glasses_black",
    label = "glasses_black",
    description = "glasses_black"
}, {
    value = "Glasses_BlackOut",
    label = "Glasses_BlackOut",
    description = "Glasses_BlackOut"
}, {
    value = "glasses_blue",
    label = "glasses_blue",
    description = "glasses_blue"
}, {
    value = "glasses_brown",
    label = "glasses_brown",
    description = "glasses_brown"
}, {
    value = "glasses_Darkblue",
    label = "glasses_Darkblue",
    description = "glasses_Darkblue"
}, {
    value = "glasses_green",
    label = "glasses_green",
    description = "glasses_green"
}, {
    value = "glasses_orange",
    label = "glasses_orange",
    description = "glasses_orange"
}, {
    value = "glasses_pink",
    label = "glasses_pink",
    description = "glasses_pink"
}, {
    value = "glasses_purple",
    label = "glasses_purple",
    description = "glasses_purple"
}, {
    value = "glasses_red",
    label = "glasses_red",
    description = "glasses_red"
}, {
    value = "glasses_Scuba",
    label = "glasses_Scuba",
    description = "glasses_Scuba"
}, {
    value = "glasses_VISOR",
    label = "glasses_VISOR",
    description = "glasses_VISOR"
}, {
    value = "glasses_yellow",
    label = "glasses_yellow",
    description = "glasses_yellow"
}, {
    value = "gorge_reflection_gpu",
    label = "gorge_reflection_gpu",
    description = "gorge_reflection_gpu"
}, {
    value = "gorge_reflectionoffset",
    label = "gorge_reflectionoffset",
    description = "gorge_reflectionoffset"
}, {
    value = "gorge_reflectionoffset2",
    label = "gorge_reflectionoffset2",
    description = "gorge_reflectionoffset2"
}, {
    value = "graveyard_shootout",
    label = "graveyard_shootout",
    description = "graveyard_shootout"
}, {
    value = "gunclub",
    label = "gunclub",
    description = "gunclub"
}, {
    value = "gunclubrange",
    label = "gunclubrange",
    description = "gunclubrange"
}, {
    value = "gunshop",
    label = "gunshop",
    description = "gunshop"
}, {
    value = "gunstore",
    label = "gunstore",
    description = "gunstore"
}, {
    value = "half_direct",
    label = "half_direct",
    description = "half_direct"
}, {
    value = "hangar_lightsmod",
    label = "hangar_lightsmod",
    description = "hangar_lightsmod"
}, {
    value = "Hanger_INTmods",
    label = "Hanger_INTmods",
    description = "Hanger_INTmods"
}, {
    value = "heathaze",
    label = "heathaze",
    description = "heathaze"
}, {
    value = "heist_boat",
    label = "heist_boat",
    description = "heist_boat"
}, {
    value = "heist_boat_engineRoom",
    label = "heist_boat_engineRoom",
    description = "heist_boat_engineRoom"
}, {
    value = "heist_boat_norain",
    label = "heist_boat_norain",
    description = "heist_boat_norain"
}, {
    value = "helicamfirst",
    label = "helicamfirst",
    description = "helicamfirst"
}, {
    value = "heliGunCam",
    label = "heliGunCam",
    description = "heliGunCam"
}, {
    value = "Hicksbar",
    label = "Hicksbar",
    description = "Hicksbar"
}, {
    value = "HicksbarNEW",
    label = "HicksbarNEW",
    description = "HicksbarNEW"
}, {
    value = "hillstunnel",
    label = "hillstunnel",
    description = "hillstunnel"
}, {
    value = "Hint_cam",
    label = "Hint_cam",
    description = "Hint_cam"
}, {
    value = "hitped",
    label = "hitped",
    description = "hitped"
}, {
    value = "hud_def_blur",
    label = "hud_def_blur",
    description = "hud_def_blur"
}, {
    value = "hud_def_blur_switch",
    label = "hud_def_blur_switch",
    description = "hud_def_blur_switch"
}, {
    value = "hud_def_colorgrade",
    label = "hud_def_colorgrade",
    description = "hud_def_colorgrade"
}, {
    value = "hud_def_desat_cold",
    label = "hud_def_desat_cold",
    description = "hud_def_desat_cold"
}, {
    value = "hud_def_desat_cold_kill",
    label = "hud_def_desat_cold_kill",
    description = "hud_def_desat_cold_kill"
}, {
    value = "hud_def_desat_Franklin",
    label = "hud_def_desat_Franklin",
    description = "hud_def_desat_Franklin"
}, {
    value = "hud_def_desat_Michael",
    label = "hud_def_desat_Michael",
    description = "hud_def_desat_Michael"
}, {
    value = "hud_def_desat_Neutral",
    label = "hud_def_desat_Neutral",
    description = "hud_def_desat_Neutral"
}, {
    value = "hud_def_desat_switch",
    label = "hud_def_desat_switch",
    description = "hud_def_desat_switch"
}, {
    value = "hud_def_desat_Trevor",
    label = "hud_def_desat_Trevor",
    description = "hud_def_desat_Trevor"
}, {
    value = "hud_def_desatcrunch",
    label = "hud_def_desatcrunch",
    description = "hud_def_desatcrunch"
}, {
    value = "hud_def_flash",
    label = "hud_def_flash",
    description = "hud_def_flash"
}, {
    value = "hud_def_focus",
    label = "hud_def_focus",
    description = "hud_def_focus"
}, {
    value = "hud_def_Franklin",
    label = "hud_def_Franklin",
    description = "hud_def_Franklin"
}, {
    value = "hud_def_lensdistortion",
    label = "hud_def_lensdistortion",
    description = "hud_def_lensdistortion"
}, {
    value = "hud_def_lensdistortion_subtle",
    label = "hud_def_lensdistortion_subtle",
    description = "hud_def_lensdistortion_subtle"
}, {
    value = "hud_def_Michael",
    label = "hud_def_Michael",
    description = "hud_def_Michael"
}, {
    value = "hud_def_Trevor",
    label = "hud_def_Trevor",
    description = "hud_def_Trevor"
}, {
    value = "id1_11_tunnel",
    label = "id1_11_tunnel",
    description = "id1_11_tunnel"
}, {
    value = "ImpExp_Interior_01",
    label = "ImpExp_Interior_01",
    description = "ImpExp_Interior_01"
}, {
    value = "impexp_interior_01_lift",
    label = "impexp_interior_01_lift",
    description = "impexp_interior_01_lift"
}, {
    value = "IMpExt_Interior_02",
    label = "IMpExt_Interior_02",
    description = "IMpExt_Interior_02"
}, {
    value = "IMpExt_Interior_02_stair_cage",
    label = "IMpExt_Interior_02_stair_cage",
    description = "IMpExt_Interior_02_stair_cage"
}, {
    value = "InchOrange01",
    label = "InchOrange01",
    description = "InchOrange01"
}, {
    value = "InchOrange02",
    label = "InchOrange02",
    description = "InchOrange02"
}, {
    value = "InchPickup01",
    label = "InchPickup01",
    description = "InchPickup01"
}, {
    value = "InchPickup02",
    label = "InchPickup02",
    description = "InchPickup02"
}, {
    value = "InchPurple01",
    label = "InchPurple01",
    description = "InchPurple01"
}, {
    value = "InchPurple02",
    label = "InchPurple02",
    description = "InchPurple02"
}, {
    value = "int_amb_mult_large",
    label = "int_amb_mult_large",
    description = "int_amb_mult_large"
}, {
    value = "int_Barber1",
    label = "int_Barber1",
    description = "int_Barber1"
}, {
    value = "int_carmod_small",
    label = "int_carmod_small",
    description = "int_carmod_small"
}, {
    value = "int_carrier_control",
    label = "int_carrier_control",
    description = "int_carrier_control"
}, {
    value = "int_carrier_control_2",
    label = "int_carrier_control_2",
    description = "int_carrier_control_2"
}, {
    value = "int_carrier_hanger",
    label = "int_carrier_hanger",
    description = "int_carrier_hanger"
}, {
    value = "int_carrier_rear",
    label = "int_carrier_rear",
    description = "int_carrier_rear"
}, {
    value = "int_carrier_stair",
    label = "int_carrier_stair",
    description = "int_carrier_stair"
}, {
    value = "int_carshowroom",
    label = "int_carshowroom",
    description = "int_carshowroom"
}, {
    value = "int_chopshop",
    label = "int_chopshop",
    description = "int_chopshop"
}, {
    value = "int_clean_extlight_large",
    label = "int_clean_extlight_large",
    description = "int_clean_extlight_large"
}, {
    value = "int_clean_extlight_none",
    label = "int_clean_extlight_none",
    description = "int_clean_extlight_none"
}, {
    value = "int_clean_extlight_small",
    label = "int_clean_extlight_small",
    description = "int_clean_extlight_small"
}, {
    value = "int_ClothesHi",
    label = "int_ClothesHi",
    description = "int_ClothesHi"
}, {
    value = "int_clotheslow_large",
    label = "int_clotheslow_large",
    description = "int_clotheslow_large"
}, {
    value = "int_cluckinfactory_none",
    label = "int_cluckinfactory_none",
    description = "int_cluckinfactory_none"
}, {
    value = "int_cluckinfactory_small",
    label = "int_cluckinfactory_small",
    description = "int_cluckinfactory_small"
}, {
    value = "int_ControlTower_none",
    label = "int_ControlTower_none",
    description = "int_ControlTower_none"
}, {
    value = "int_ControlTower_small",
    label = "int_ControlTower_small",
    description = "int_ControlTower_small"
}, {
    value = "int_dockcontrol_small",
    label = "int_dockcontrol_small",
    description = "int_dockcontrol_small"
}, {
    value = "int_extlght_sm_cntrst",
    label = "int_extlght_sm_cntrst",
    description = "int_extlght_sm_cntrst"
}, {
    value = "int_extlight_large",
    label = "int_extlight_large",
    description = "int_extlight_large"
}, {
    value = "int_extlight_large_fog",
    label = "int_extlight_large_fog",
    description = "int_extlight_large_fog"
}, {
    value = "int_extlight_none",
    label = "int_extlight_none",
    description = "int_extlight_none"
}, {
    value = "int_extlight_none_dark",
    label = "int_extlight_none_dark",
    description = "int_extlight_none_dark"
}, {
    value = "int_extlight_none_dark_fog",
    label = "int_extlight_none_dark_fog",
    description = "int_extlight_none_dark_fog"
}, {
    value = "int_extlight_none_fog",
    label = "int_extlight_none_fog",
    description = "int_extlight_none_fog"
}, {
    value = "int_extlight_small",
    label = "int_extlight_small",
    description = "int_extlight_small"
}, {
    value = "int_extlight_small_clipped",
    label = "int_extlight_small_clipped",
    description = "int_extlight_small_clipped"
}, {
    value = "int_extlight_small_fog",
    label = "int_extlight_small_fog",
    description = "int_extlight_small_fog"
}, {
    value = "int_Farmhouse_none",
    label = "int_Farmhouse_none",
    description = "int_Farmhouse_none"
}, {
    value = "int_Farmhouse_small",
    label = "int_Farmhouse_small",
    description = "int_Farmhouse_small"
}, {
    value = "int_FranklinAunt_small",
    label = "int_FranklinAunt_small",
    description = "int_FranklinAunt_small"
}, {
    value = "INT_FullAmbientmult",
    label = "INT_FullAmbientmult",
    description = "INT_FullAmbientmult"
}, {
    value = "INT_FULLAmbientmult_art",
    label = "INT_FULLAmbientmult_art",
    description = "INT_FULLAmbientmult_art"
}, {
    value = "INT_FULLAmbientmult_both",
    label = "INT_FULLAmbientmult_both",
    description = "INT_FULLAmbientmult_both"
}, {
    value = "INT_garage",
    label = "INT_garage",
    description = "INT_garage"
}, {
    value = "int_GasStation",
    label = "int_GasStation",
    description = "int_GasStation"
}, {
    value = "int_hanger_none",
    label = "int_hanger_none",
    description = "int_hanger_none"
}, {
    value = "int_hanger_small",
    label = "int_hanger_small",
    description = "int_hanger_small"
}, {
    value = "int_Hospital2_DM",
    label = "int_Hospital2_DM",
    description = "int_Hospital2_DM"
}, {
    value = "int_Hospital_Blue",
    label = "int_Hospital_Blue",
    description = "int_Hospital_Blue"
}, {
    value = "int_Hospital_BlueB",
    label = "int_Hospital_BlueB",
    description = "int_Hospital_BlueB"
}, {
    value = "int_hospital_dark",
    label = "int_hospital_dark",
    description = "int_hospital_dark"
}, {
    value = "int_Hospital_DM",
    label = "int_Hospital_DM",
    description = "int_Hospital_DM"
}, {
    value = "int_hospital_small",
    label = "int_hospital_small",
    description = "int_hospital_small"
}, {
    value = "int_lesters",
    label = "int_lesters",
    description = "int_lesters"
}, {
    value = "int_Lost_none",
    label = "int_Lost_none",
    description = "int_Lost_none"
}, {
    value = "int_Lost_small",
    label = "int_Lost_small",
    description = "int_Lost_small"
}, {
    value = "INT_mall",
    label = "INT_mall",
    description = "INT_mall"
}, {
    value = "int_methlab_small",
    label = "int_methlab_small",
    description = "int_methlab_small"
}, {
    value = "int_motelroom",
    label = "int_motelroom",
    description = "int_motelroom"
}, {
    value = "INT_NO_fogALPHA",
    label = "INT_NO_fogALPHA",
    description = "INT_NO_fogALPHA"
}, {
    value = "INT_NoAmbientmult",
    label = "INT_NoAmbientmult",
    description = "INT_NoAmbientmult"
}, {
    value = "INT_NoAmbientmult_art",
    label = "INT_NoAmbientmult_art",
    description = "INT_NoAmbientmult_art"
}, {
    value = "INT_NoAmbientmult_both",
    label = "INT_NoAmbientmult_both",
    description = "INT_NoAmbientmult_both"
}, {
    value = "INT_NOdirectLight",
    label = "INT_NOdirectLight",
    description = "INT_NOdirectLight"
}, {
    value = "INT_nowaterREF",
    label = "INT_nowaterREF",
    description = "INT_nowaterREF"
}, {
    value = "int_office_Lobby",
    label = "int_office_Lobby",
    description = "int_office_Lobby"
}, {
    value = "int_office_LobbyHall",
    label = "int_office_LobbyHall",
    description = "int_office_LobbyHall"
}, {
    value = "INT_posh_hairdresser",
    label = "INT_posh_hairdresser",
    description = "INT_posh_hairdresser"
}, {
    value = "INT_smshop",
    label = "INT_smshop",
    description = "INT_smshop"
}, {
    value = "INT_smshop_indoor_bloom",
    label = "INT_smshop_indoor_bloom",
    description = "INT_smshop_indoor_bloom"
}, {
    value = "INT_smshop_inMOD",
    label = "INT_smshop_inMOD",
    description = "INT_smshop_inMOD"
}, {
    value = "INT_smshop_outdoor_bloom",
    label = "INT_smshop_outdoor_bloom",
    description = "INT_smshop_outdoor_bloom"
}, {
    value = "INT_streetlighting",
    label = "INT_streetlighting",
    description = "INT_streetlighting"
}, {
    value = "int_tattoo",
    label = "int_tattoo",
    description = "int_tattoo"
}, {
    value = "int_tattoo_B",
    label = "int_tattoo_B",
    description = "int_tattoo_B"
}, {
    value = "INT_trailer_cinema",
    label = "INT_trailer_cinema",
    description = "INT_trailer_cinema"
}, {
    value = "int_tunnel_none_dark",
    label = "int_tunnel_none_dark",
    description = "int_tunnel_none_dark"
}, {
    value = "interior_WATER_lighting",
    label = "interior_WATER_lighting",
    description = "interior_WATER_lighting"
}, {
    value = "introblue",
    label = "introblue",
    description = "introblue"
}, {
    value = "jewel_gas",
    label = "jewel_gas",
    description = "jewel_gas"
}, {
    value = "jewel_optim",
    label = "jewel_optim",
    description = "jewel_optim"
}, {
    value = "jewelry_entrance",
    label = "jewelry_entrance",
    description = "jewelry_entrance"
}, {
    value = "jewelry_entrance_INT",
    label = "jewelry_entrance_INT",
    description = "jewelry_entrance_INT"
}, {
    value = "jewelry_entrance_INT_fog",
    label = "jewelry_entrance_INT_fog",
    description = "jewelry_entrance_INT_fog"
}, {
    value = "Kifflom",
    label = "Kifflom",
    description = "Kifflom"
}, {
    value = "KT_underpass",
    label = "KT_underpass",
    description = "KT_underpass"
}, {
    value = "lab_none",
    label = "lab_none",
    description = "lab_none"
}, {
    value = "lab_none_dark",
    label = "lab_none_dark",
    description = "lab_none_dark"
}, {
    value = "lab_none_dark_fog",
    label = "lab_none_dark_fog",
    description = "lab_none_dark_fog"
}, {
    value = "lab_none_dark_OVR",
    label = "lab_none_dark_OVR",
    description = "lab_none_dark_OVR"
}, {
    value = "lab_none_exit",
    label = "lab_none_exit",
    description = "lab_none_exit"
}, {
    value = "lab_none_exit_OVR",
    label = "lab_none_exit_OVR",
    description = "lab_none_exit_OVR"
}, {
    value = "LectroDark",
    label = "LectroDark",
    description = "LectroDark"
}, {
    value = "LectroLight",
    label = "LectroLight",
    description = "LectroLight"
}, {
    value = "li",
    label = "li",
    description = "li"
}, {
    value = "LifeInvaderLOD",
    label = "LifeInvaderLOD",
    description = "LifeInvaderLOD"
}, {
    value = "lightning",
    label = "lightning",
    description = "lightning"
}, {
    value = "lightning_cloud",
    label = "lightning_cloud",
    description = "lightning_cloud"
}, {
    value = "lightning_strong",
    label = "lightning_strong",
    description = "lightning_strong"
}, {
    value = "lightning_weak",
    label = "lightning_weak",
    description = "lightning_weak"
}, {
    value = "LightPollutionHills",
    label = "LightPollutionHills",
    description = "LightPollutionHills"
}, {
    value = "lightpolution",
    label = "lightpolution",
    description = "lightpolution"
}, {
    value = "LIGHTSreduceFALLOFF",
    label = "LIGHTSreduceFALLOFF",
    description = "LIGHTSreduceFALLOFF"
}, {
    value = "LODmult_global_reduce",
    label = "LODmult_global_reduce",
    description = "LODmult_global_reduce"
}, {
    value = "LODmult_global_reduce_NOHD",
    label = "LODmult_global_reduce_NOHD",
    description = "LODmult_global_reduce_NOHD"
}, {
    value = "LODmult_HD_orphan_LOD_reduce",
    label = "LODmult_HD_orphan_LOD_reduce",
    description = "LODmult_HD_orphan_LOD_reduce"
}, {
    value = "LODmult_HD_orphan_reduce",
    label = "LODmult_HD_orphan_reduce",
    description = "LODmult_HD_orphan_reduce"
}, {
    value = "LODmult_LOD_reduce",
    label = "LODmult_LOD_reduce",
    description = "LODmult_LOD_reduce"
}, {
    value = "LODmult_SLOD1_reduce",
    label = "LODmult_SLOD1_reduce",
    description = "LODmult_SLOD1_reduce"
}, {
    value = "LODmult_SLOD2_reduce",
    label = "LODmult_SLOD2_reduce",
    description = "LODmult_SLOD2_reduce"
}, {
    value = "LODmult_SLOD3_reduce",
    label = "LODmult_SLOD3_reduce",
    description = "LODmult_SLOD3_reduce"
}, {
    value = "lodscaler",
    label = "lodscaler",
    description = "lodscaler"
}, {
    value = "LostTimeDark",
    label = "LostTimeDark",
    description = "LostTimeDark"
}, {
    value = "LostTimeFlash",
    label = "LostTimeFlash",
    description = "LostTimeFlash"
}, {
    value = "LostTimeLight",
    label = "LostTimeLight",
    description = "LostTimeLight"
}, {
    value = "maxlodscaler",
    label = "maxlodscaler",
    description = "maxlodscaler"
}, {
    value = "metro",
    label = "metro",
    description = "metro"
}, {
    value = "METRO_platform",
    label = "METRO_platform",
    description = "METRO_platform"
}, {
    value = "METRO_Tunnels",
    label = "METRO_Tunnels",
    description = "METRO_Tunnels"
}, {
    value = "METRO_Tunnels_entrance",
    label = "METRO_Tunnels_entrance",
    description = "METRO_Tunnels_entrance"
}, {
    value = "MichaelColorCode",
    label = "MichaelColorCode",
    description = "MichaelColorCode"
}, {
    value = "MichaelColorCodeBasic",
    label = "MichaelColorCodeBasic",
    description = "MichaelColorCodeBasic"
}, {
    value = "MichaelColorCodeBright",
    label = "MichaelColorCodeBright",
    description = "MichaelColorCodeBright"
}, {
    value = "MichaelsDarkroom",
    label = "MichaelsDarkroom",
    description = "MichaelsDarkroom"
}, {
    value = "MichaelsDirectional",
    label = "MichaelsDirectional",
    description = "MichaelsDirectional"
}, {
    value = "MichaelsNODirectional",
    label = "MichaelsNODirectional",
    description = "MichaelsNODirectional"
}, {
    value = "micheal",
    label = "micheal",
    description = "micheal"
}, {
    value = "micheals_lightsOFF",
    label = "micheals_lightsOFF",
    description = "micheals_lightsOFF"
}, {
    value = "michealspliff",
    label = "michealspliff",
    description = "michealspliff"
}, {
    value = "michealspliff_blend",
    label = "michealspliff_blend",
    description = "michealspliff_blend"
}, {
    value = "michealspliff_blend02",
    label = "michealspliff_blend02",
    description = "michealspliff_blend02"
}, {
    value = "militarybase_nightlight",
    label = "militarybase_nightlight",
    description = "militarybase_nightlight"
}, {
    value = "mineshaft",
    label = "mineshaft",
    description = "mineshaft"
}, {
    value = "morebloom",
    label = "morebloom",
    description = "morebloom"
}, {
    value = "morgue_dark",
    label = "morgue_dark",
    description = "morgue_dark"
}, {
    value = "morgue_dark_ovr",
    label = "morgue_dark_ovr",
    description = "morgue_dark_ovr"
}, {
    value = "Mp_apart_mid",
    label = "Mp_apart_mid",
    description = "Mp_apart_mid"
}, {
    value = "mp_bkr_int01_garage",
    label = "mp_bkr_int01_garage",
    description = "mp_bkr_int01_garage"
}, {
    value = "mp_bkr_int01_small_rooms",
    label = "mp_bkr_int01_small_rooms",
    description = "mp_bkr_int01_small_rooms"
}, {
    value = "mp_bkr_int01_transition",
    label = "mp_bkr_int01_transition",
    description = "mp_bkr_int01_transition"
}, {
    value = "mp_bkr_int02_garage",
    label = "mp_bkr_int02_garage",
    description = "mp_bkr_int02_garage"
}, {
    value = "mp_bkr_int02_hangout",
    label = "mp_bkr_int02_hangout",
    description = "mp_bkr_int02_hangout"
}, {
    value = "mp_bkr_int02_small_rooms",
    label = "mp_bkr_int02_small_rooms",
    description = "mp_bkr_int02_small_rooms"
}, {
    value = "mp_bkr_ware01",
    label = "mp_bkr_ware01",
    description = "mp_bkr_ware01"
}, {
    value = "mp_bkr_ware02_dry",
    label = "mp_bkr_ware02_dry",
    description = "mp_bkr_ware02_dry"
}, {
    value = "mp_bkr_ware02_standard",
    label = "mp_bkr_ware02_standard",
    description = "mp_bkr_ware02_standard"
}, {
    value = "mp_bkr_ware02_upgrade",
    label = "mp_bkr_ware02_upgrade",
    description = "mp_bkr_ware02_upgrade"
}, {
    value = "mp_bkr_ware03_basic",
    label = "mp_bkr_ware03_basic",
    description = "mp_bkr_ware03_basic"
}, {
    value = "mp_bkr_ware03_upgrade",
    label = "mp_bkr_ware03_upgrade",
    description = "mp_bkr_ware03_upgrade"
}, {
    value = "mp_bkr_ware04",
    label = "mp_bkr_ware04",
    description = "mp_bkr_ware04"
}, {
    value = "mp_bkr_ware05",
    label = "mp_bkr_ware05",
    description = "mp_bkr_ware05"
}, {
    value = "MP_Bull_tost",
    label = "MP_Bull_tost",
    description = "MP_Bull_tost"
}, {
    value = "MP_Bull_tost_blend",
    label = "MP_Bull_tost_blend",
    description = "MP_Bull_tost_blend"
}, {
    value = "MP_corona_heist",
    label = "MP_corona_heist",
    description = "MP_corona_heist"
}, {
    value = "MP_corona_heist_blend",
    label = "MP_corona_heist_blend",
    description = "MP_corona_heist_blend"
}, {
    value = "MP_corona_heist_BW",
    label = "MP_corona_heist_BW",
    description = "MP_corona_heist_BW"
}, {
    value = "MP_corona_heist_BW_night",
    label = "MP_corona_heist_BW_night",
    description = "MP_corona_heist_BW_night"
}, {
    value = "MP_corona_heist_DOF",
    label = "MP_corona_heist_DOF",
    description = "MP_corona_heist_DOF"
}, {
    value = "MP_corona_heist_night",
    label = "MP_corona_heist_night",
    description = "MP_corona_heist_night"
}, {
    value = "MP_corona_heist_night_blend",
    label = "MP_corona_heist_night_blend",
    description = "MP_corona_heist_night_blend"
}, {
    value = "MP_corona_selection",
    label = "MP_corona_selection",
    description = "MP_corona_selection"
}, {
    value = "MP_corona_switch",
    label = "MP_corona_switch",
    description = "MP_corona_switch"
}, {
    value = "MP_corona_tournament",
    label = "MP_corona_tournament",
    description = "MP_corona_tournament"
}, {
    value = "MP_corona_tournament_DOF",
    label = "MP_corona_tournament_DOF",
    description = "MP_corona_tournament_DOF"
}, {
    value = "MP_death_grade",
    label = "MP_death_grade",
    description = "MP_death_grade"
}, {
    value = "MP_death_grade_blend01",
    label = "MP_death_grade_blend01",
    description = "MP_death_grade_blend01"
}, {
    value = "MP_death_grade_blend02",
    label = "MP_death_grade_blend02",
    description = "MP_death_grade_blend02"
}, {
    value = "MP_deathfail_night",
    label = "MP_deathfail_night",
    description = "MP_deathfail_night"
}, {
    value = "mp_exec_office_01",
    label = "mp_exec_office_01",
    description = "mp_exec_office_01"
}, {
    value = "mp_exec_office_02",
    label = "mp_exec_office_02",
    description = "mp_exec_office_02"
}, {
    value = "mp_exec_office_03",
    label = "mp_exec_office_03",
    description = "mp_exec_office_03"
}, {
    value = "mp_exec_office_03_blue",
    label = "mp_exec_office_03_blue",
    description = "mp_exec_office_03_blue"
}, {
    value = "mp_exec_office_03C",
    label = "mp_exec_office_03C",
    description = "mp_exec_office_03C"
}, {
    value = "mp_exec_office_04",
    label = "mp_exec_office_04",
    description = "mp_exec_office_04"
}, {
    value = "mp_exec_office_05",
    label = "mp_exec_office_05",
    description = "mp_exec_office_05"
}, {
    value = "mp_exec_office_06",
    label = "mp_exec_office_06",
    description = "mp_exec_office_06"
}, {
    value = "mp_exec_warehouse_01",
    label = "mp_exec_warehouse_01",
    description = "mp_exec_warehouse_01"
}, {
    value = "MP_Garage_L",
    label = "MP_Garage_L",
    description = "MP_Garage_L"
}, {
    value = "MP_H_01_Bathroom",
    label = "MP_H_01_Bathroom",
    description = "MP_H_01_Bathroom"
}, {
    value = "MP_H_01_Bedroom",
    label = "MP_H_01_Bedroom",
    description = "MP_H_01_Bedroom"
}, {
    value = "MP_H_01_New",
    label = "MP_H_01_New",
    description = "MP_H_01_New"
}, {
    value = "MP_H_01_New_Bathroom",
    label = "MP_H_01_New_Bathroom",
    description = "MP_H_01_New_Bathroom"
}, {
    value = "MP_H_01_New_Bedroom",
    label = "MP_H_01_New_Bedroom",
    description = "MP_H_01_New_Bedroom"
}, {
    value = "MP_H_01_New_Study",
    label = "MP_H_01_New_Study",
    description = "MP_H_01_New_Study"
}, {
    value = "MP_H_01_Study",
    label = "MP_H_01_Study",
    description = "MP_H_01_Study"
}, {
    value = "MP_H_02",
    label = "MP_H_02",
    description = "MP_H_02"
}, {
    value = "MP_H_04",
    label = "MP_H_04",
    description = "MP_H_04"
}, {
    value = "mp_h_05",
    label = "mp_h_05",
    description = "mp_h_05"
}, {
    value = "MP_H_06",
    label = "MP_H_06",
    description = "MP_H_06"
}, {
    value = "mp_h_07",
    label = "mp_h_07",
    description = "mp_h_07"
}, {
    value = "mp_h_08",
    label = "mp_h_08",
    description = "mp_h_08"
}, {
    value = "MP_heli_cam",
    label = "MP_heli_cam",
    description = "MP_heli_cam"
}, {
    value = "mp_imx_intwaremed",
    label = "mp_imx_intwaremed",
    description = "mp_imx_intwaremed"
}, {
    value = "mp_imx_intwaremed_office",
    label = "mp_imx_intwaremed_office",
    description = "mp_imx_intwaremed_office"
}, {
    value = "mp_imx_mod_int_01",
    label = "mp_imx_mod_int_01",
    description = "mp_imx_mod_int_01"
}, {
    value = "MP_intro_logo",
    label = "MP_intro_logo",
    description = "MP_intro_logo"
}, {
    value = "MP_job_end_night",
    label = "MP_job_end_night",
    description = "MP_job_end_night"
}, {
    value = "MP_job_load",
    label = "MP_job_load",
    description = "MP_job_load"
}, {
    value = "MP_job_load_01",
    label = "MP_job_load_01",
    description = "MP_job_load_01"
}, {
    value = "MP_job_load_02",
    label = "MP_job_load_02",
    description = "MP_job_load_02"
}, {
    value = "MP_job_lose",
    label = "MP_job_lose",
    description = "MP_job_lose"
}, {
    value = "MP_job_preload",
    label = "MP_job_preload",
    description = "MP_job_preload"
}, {
    value = "MP_job_preload_blend",
    label = "MP_job_preload_blend",
    description = "MP_job_preload_blend"
}, {
    value = "MP_job_preload_night",
    label = "MP_job_preload_night",
    description = "MP_job_preload_night"
}, {
    value = "MP_job_win",
    label = "MP_job_win",
    description = "MP_job_win"
}, {
    value = "MP_Killstreak",
    label = "MP_Killstreak",
    description = "MP_Killstreak"
}, {
    value = "MP_Killstreak_blend",
    label = "MP_Killstreak_blend",
    description = "MP_Killstreak_blend"
}, {
    value = "mp_lad_day",
    label = "mp_lad_day",
    description = "mp_lad_day"
}, {
    value = "mp_lad_judgment",
    label = "mp_lad_judgment",
    description = "mp_lad_judgment"
}, {
    value = "mp_lad_night",
    label = "mp_lad_night",
    description = "mp_lad_night"
}, {
    value = "MP_Loser",
    label = "MP_Loser",
    description = "MP_Loser"
}, {
    value = "MP_Loser_blend",
    label = "MP_Loser_blend",
    description = "MP_Loser_blend"
}, {
    value = "MP_lowgarage",
    label = "MP_lowgarage",
    description = "MP_lowgarage"
}, {
    value = "MP_MedGarage",
    label = "MP_MedGarage",
    description = "MP_MedGarage"
}, {
    value = "MP_Powerplay",
    label = "MP_Powerplay",
    description = "MP_Powerplay"
}, {
    value = "MP_Powerplay_blend",
    label = "MP_Powerplay_blend",
    description = "MP_Powerplay_blend"
}, {
    value = "MP_race_finish",
    label = "MP_race_finish",
    description = "MP_race_finish"
}, {
    value = "MP_select",
    label = "MP_select",
    description = "MP_select"
}, {
    value = "Mp_Stilts",
    label = "Mp_Stilts",
    description = "Mp_Stilts"
}, {
    value = "Mp_Stilts2",
    label = "Mp_Stilts2",
    description = "Mp_Stilts2"
}, {
    value = "Mp_Stilts2_bath",
    label = "Mp_Stilts2_bath",
    description = "Mp_Stilts2_bath"
}, {
    value = "Mp_Stilts_gym",
    label = "Mp_Stilts_gym",
    description = "Mp_Stilts_gym"
}, {
    value = "Mp_Stilts_gym2",
    label = "Mp_Stilts_gym2",
    description = "Mp_Stilts_gym2"
}, {
    value = "MP_Studio_Lo",
    label = "MP_Studio_Lo",
    description = "MP_Studio_Lo"
}, {
    value = "MPApart_H_01",
    label = "MPApart_H_01",
    description = "MPApart_H_01"
}, {
    value = "MPApart_H_01_gym",
    label = "MPApart_H_01_gym",
    description = "MPApart_H_01_gym"
}, {
    value = "MPApartHigh",
    label = "MPApartHigh",
    description = "MPApartHigh"
}, {
    value = "MPApartHigh_palnning",
    label = "MPApartHigh_palnning",
    description = "MPApartHigh_palnning"
}, {
    value = "mugShot",
    label = "mugShot",
    description = "mugShot"
}, {
    value = "mugShot_lineup",
    label = "mugShot_lineup",
    description = "mugShot_lineup"
}, {
    value = "Multipayer_spectatorCam",
    label = "Multipayer_spectatorCam",
    description = "Multipayer_spectatorCam"
}, {
    value = "multiplayer_ped_fight",
    label = "multiplayer_ped_fight",
    description = "multiplayer_ped_fight"
}, {
    value = "nervousRON_fog",
    label = "nervousRON_fog",
    description = "nervousRON_fog"
}, {
    value = "NeutralColorCode",
    label = "NeutralColorCode",
    description = "NeutralColorCode"
}, {
    value = "NeutralColorCodeBasic",
    label = "NeutralColorCodeBasic",
    description = "NeutralColorCodeBasic"
}, {
    value = "NeutralColorCodeBright",
    label = "NeutralColorCodeBright",
    description = "NeutralColorCodeBright"
}, {
    value = "NeutralColorCodeLight",
    label = "NeutralColorCodeLight",
    description = "NeutralColorCodeLight"
}, {
    value = "NEW_abattoir",
    label = "NEW_abattoir",
    description = "NEW_abattoir"
}, {
    value = "new_bank",
    label = "new_bank",
    description = "new_bank"
}, {
    value = "NEW_jewel",
    label = "NEW_jewel",
    description = "NEW_jewel"
}, {
    value = "NEW_jewel_EXIT",
    label = "NEW_jewel_EXIT",
    description = "NEW_jewel_EXIT"
}, {
    value = "NEW_lesters",
    label = "NEW_lesters",
    description = "NEW_lesters"
}, {
    value = "new_MP_Garage_L",
    label = "new_MP_Garage_L",
    description = "new_MP_Garage_L"
}, {
    value = "NEW_ornate_bank",
    label = "NEW_ornate_bank",
    description = "NEW_ornate_bank"
}, {
    value = "NEW_ornate_bank_entrance",
    label = "NEW_ornate_bank_entrance",
    description = "NEW_ornate_bank_entrance"
}, {
    value = "NEW_ornate_bank_office",
    label = "NEW_ornate_bank_office",
    description = "NEW_ornate_bank_office"
}, {
    value = "NEW_ornate_bank_safe",
    label = "NEW_ornate_bank_safe",
    description = "NEW_ornate_bank_safe"
}, {
    value = "New_sewers",
    label = "New_sewers",
    description = "New_sewers"
}, {
    value = "NEW_shrinksOffice",
    label = "NEW_shrinksOffice",
    description = "NEW_shrinksOffice"
}, {
    value = "NEW_station_unfinished",
    label = "NEW_station_unfinished",
    description = "NEW_station_unfinished"
}, {
    value = "new_stripper_changing",
    label = "new_stripper_changing",
    description = "new_stripper_changing"
}, {
    value = "NEW_trevorstrailer",
    label = "NEW_trevorstrailer",
    description = "NEW_trevorstrailer"
}, {
    value = "NEW_tunnels",
    label = "NEW_tunnels",
    description = "NEW_tunnels"
}, {
    value = "NEW_tunnels_ditch",
    label = "NEW_tunnels_ditch",
    description = "NEW_tunnels_ditch"
}, {
    value = "new_tunnels_entrance",
    label = "new_tunnels_entrance",
    description = "new_tunnels_entrance"
}, {
    value = "NEW_tunnels_hole",
    label = "NEW_tunnels_hole",
    description = "NEW_tunnels_hole"
}, {
    value = "NEW_yellowtunnels",
    label = "NEW_yellowtunnels",
    description = "NEW_yellowtunnels"
}, {
    value = "NewMicheal",
    label = "NewMicheal",
    description = "NewMicheal"
}, {
    value = "NewMicheal_night",
    label = "NewMicheal_night",
    description = "NewMicheal_night"
}, {
    value = "NewMicheal_upstairs",
    label = "NewMicheal_upstairs",
    description = "NewMicheal_upstairs"
}, {
    value = "NewMichealgirly",
    label = "NewMichealgirly",
    description = "NewMichealgirly"
}, {
    value = "NewMichealstoilet",
    label = "NewMichealstoilet",
    description = "NewMichealstoilet"
}, {
    value = "NewMichealupstairs",
    label = "NewMichealupstairs",
    description = "NewMichealupstairs"
}, {
    value = "nextgen",
    label = "nextgen",
    description = "nextgen"
}, {
    value = "NG_blackout",
    label = "NG_blackout",
    description = "NG_blackout"
}, {
    value = "NG_deathfail_BW_base",
    label = "NG_deathfail_BW_base",
    description = "NG_deathfail_BW_base"
}, {
    value = "NG_deathfail_BW_blend01",
    label = "NG_deathfail_BW_blend01",
    description = "NG_deathfail_BW_blend01"
}, {
    value = "NG_deathfail_BW_blend02",
    label = "NG_deathfail_BW_blend02",
    description = "NG_deathfail_BW_blend02"
}, {
    value = "NG_filmic01",
    label = "NG_filmic01",
    description = "NG_filmic01"
}, {
    value = "NG_filmic02",
    label = "NG_filmic02",
    description = "NG_filmic02"
}, {
    value = "NG_filmic03",
    label = "NG_filmic03",
    description = "NG_filmic03"
}, {
    value = "NG_filmic04",
    label = "NG_filmic04",
    description = "NG_filmic04"
}, {
    value = "NG_filmic05",
    label = "NG_filmic05",
    description = "NG_filmic05"
}, {
    value = "NG_filmic06",
    label = "NG_filmic06",
    description = "NG_filmic06"
}, {
    value = "NG_filmic07",
    label = "NG_filmic07",
    description = "NG_filmic07"
}, {
    value = "NG_filmic08",
    label = "NG_filmic08",
    description = "NG_filmic08"
}, {
    value = "NG_filmic09",
    label = "NG_filmic09",
    description = "NG_filmic09"
}, {
    value = "NG_filmic10",
    label = "NG_filmic10",
    description = "NG_filmic10"
}, {
    value = "NG_filmic11",
    label = "NG_filmic11",
    description = "NG_filmic11"
}, {
    value = "NG_filmic12",
    label = "NG_filmic12",
    description = "NG_filmic12"
}, {
    value = "NG_filmic13",
    label = "NG_filmic13",
    description = "NG_filmic13"
}, {
    value = "NG_filmic14",
    label = "NG_filmic14",
    description = "NG_filmic14"
}, {
    value = "NG_filmic15",
    label = "NG_filmic15",
    description = "NG_filmic15"
}, {
    value = "NG_filmic16",
    label = "NG_filmic16",
    description = "NG_filmic16"
}, {
    value = "NG_filmic17",
    label = "NG_filmic17",
    description = "NG_filmic17"
}, {
    value = "NG_filmic18",
    label = "NG_filmic18",
    description = "NG_filmic18"
}, {
    value = "NG_filmic19",
    label = "NG_filmic19",
    description = "NG_filmic19"
}, {
    value = "NG_filmic20",
    label = "NG_filmic20",
    description = "NG_filmic20"
}, {
    value = "NG_filmic21",
    label = "NG_filmic21",
    description = "NG_filmic21"
}, {
    value = "NG_filmic22",
    label = "NG_filmic22",
    description = "NG_filmic22"
}, {
    value = "NG_filmic23",
    label = "NG_filmic23",
    description = "NG_filmic23"
}, {
    value = "NG_filmic24",
    label = "NG_filmic24",
    description = "NG_filmic24"
}, {
    value = "NG_filmic25",
    label = "NG_filmic25",
    description = "NG_filmic25"
}, {
    value = "NG_filmnoir_BW01",
    label = "NG_filmnoir_BW01",
    description = "NG_filmnoir_BW01"
}, {
    value = "NG_filmnoir_BW02",
    label = "NG_filmnoir_BW02",
    description = "NG_filmnoir_BW02"
}, {
    value = "NG_first",
    label = "NG_first",
    description = "NG_first"
}, {
    value = "nightvision",
    label = "nightvision",
    description = "nightvision"
}, {
    value = "NO_coronas",
    label = "NO_coronas",
    description = "NO_coronas"
}, {
    value = "NO_fog_alpha",
    label = "NO_fog_alpha",
    description = "NO_fog_alpha"
}, {
    value = "NO_streetAmbient",
    label = "NO_streetAmbient",
    description = "NO_streetAmbient"
}, {
    value = "NO_weather",
    label = "NO_weather",
    description = "NO_weather"
}, {
    value = "NoAmbientmult",
    label = "NoAmbientmult",
    description = "NoAmbientmult"
}, {
    value = "NoAmbientmult_interior",
    label = "NoAmbientmult_interior",
    description = "NoAmbientmult_interior"
}, {
    value = "NOdirectLight",
    label = "NOdirectLight",
    description = "NOdirectLight"
}, {
    value = "NoPedLight",
    label = "NoPedLight",
    description = "NoPedLight"
}, {
    value = "NOrain",
    label = "NOrain",
    description = "NOrain"
}, {
    value = "overwater",
    label = "overwater",
    description = "overwater"
}, {
    value = "Paleto",
    label = "Paleto",
    description = "Paleto"
}, {
    value = "paleto_nightlight",
    label = "paleto_nightlight",
    description = "paleto_nightlight"
}, {
    value = "paleto_opt",
    label = "paleto_opt",
    description = "paleto_opt"
}, {
    value = "PennedInDark",
    label = "PennedInDark",
    description = "PennedInDark"
}, {
    value = "PennedInLight",
    label = "PennedInLight",
    description = "PennedInLight"
}, {
    value = "PERSHING_water_reflect",
    label = "PERSHING_water_reflect",
    description = "PERSHING_water_reflect"
}, {
    value = "phone_cam",
    label = "phone_cam",
    description = "phone_cam"
}, {
    value = "phone_cam1",
    label = "phone_cam1",
    description = "phone_cam1"
}, {
    value = "phone_cam10",
    label = "phone_cam10",
    description = "phone_cam10"
}, {
    value = "phone_cam11",
    label = "phone_cam11",
    description = "phone_cam11"
}, {
    value = "phone_cam12",
    label = "phone_cam12",
    description = "phone_cam12"
}, {
    value = "phone_cam13",
    label = "phone_cam13",
    description = "phone_cam13"
}, {
    value = "phone_cam2",
    label = "phone_cam2",
    description = "phone_cam2"
}, {
    value = "phone_cam3",
    label = "phone_cam3",
    description = "phone_cam3"
}, {
    value = "phone_cam3_REMOVED",
    label = "phone_cam3_REMOVED",
    description = "phone_cam3_REMOVED"
}, {
    value = "phone_cam4",
    label = "phone_cam4",
    description = "phone_cam4"
}, {
    value = "phone_cam5",
    label = "phone_cam5",
    description = "phone_cam5"
}, {
    value = "phone_cam6",
    label = "phone_cam6",
    description = "phone_cam6"
}, {
    value = "phone_cam7",
    label = "phone_cam7",
    description = "phone_cam7"
}, {
    value = "phone_cam8",
    label = "phone_cam8",
    description = "phone_cam8"
}, {
    value = "phone_cam8_REMOVED",
    label = "phone_cam8_REMOVED",
    description = "phone_cam8_REMOVED"
}, {
    value = "phone_cam9",
    label = "phone_cam9",
    description = "phone_cam9"
}, {
    value = "plane_inside_mode",
    label = "plane_inside_mode",
    description = "plane_inside_mode"
}, {
    value = "player_transition",
    label = "player_transition",
    description = "player_transition"
}, {
    value = "player_transition_no_scanlines",
    label = "player_transition_no_scanlines",
    description = "player_transition_no_scanlines"
}, {
    value = "player_transition_scanlines",
    label = "player_transition_scanlines",
    description = "player_transition_scanlines"
}, {
    value = "PlayerSwitchNeutralFlash",
    label = "PlayerSwitchNeutralFlash",
    description = "PlayerSwitchNeutralFlash"
}, {
    value = "PlayerSwitchPulse",
    label = "PlayerSwitchPulse",
    description = "PlayerSwitchPulse"
}, {
    value = "plaza_carpark",
    label = "plaza_carpark",
    description = "plaza_carpark"
}, {
    value = "PoliceStation",
    label = "PoliceStation",
    description = "PoliceStation"
}, {
    value = "PoliceStationDark",
    label = "PoliceStationDark",
    description = "PoliceStationDark"
}, {
    value = "polluted",
    label = "polluted",
    description = "polluted"
}, {
    value = "poolsidewaterreflection2",
    label = "poolsidewaterreflection2",
    description = "poolsidewaterreflection2"
}, {
    value = "PORT_heist_underwater",
    label = "PORT_heist_underwater",
    description = "PORT_heist_underwater"
}, {
    value = "powerplant_nightlight",
    label = "powerplant_nightlight",
    description = "powerplant_nightlight"
}, {
    value = "powerstation",
    label = "powerstation",
    description = "powerstation"
}, {
    value = "PPFilter",
    label = "PPFilter",
    description = "PPFilter"
}, {
    value = "PPGreen01",
    label = "PPGreen01",
    description = "PPGreen01"
}, {
    value = "PPGreen02",
    label = "PPGreen02",
    description = "PPGreen02"
}, {
    value = "PPOrange01",
    label = "PPOrange01",
    description = "PPOrange01"
}, {
    value = "PPOrange02",
    label = "PPOrange02",
    description = "PPOrange02"
}, {
    value = "PPPink01",
    label = "PPPink01",
    description = "PPPink01"
}, {
    value = "PPPink02",
    label = "PPPink02",
    description = "PPPink02"
}, {
    value = "PPPurple01",
    label = "PPPurple01",
    description = "PPPurple01"
}, {
    value = "PPPurple02",
    label = "PPPurple02",
    description = "PPPurple02"
}, {
    value = "prison_nightlight",
    label = "prison_nightlight",
    description = "prison_nightlight"
}, {
    value = "projector",
    label = "projector",
    description = "projector"
}, {
    value = "prologue",
    label = "prologue",
    description = "prologue"
}, {
    value = "prologue_ending_fog",
    label = "prologue_ending_fog",
    description = "prologue_ending_fog"
}, {
    value = "prologue_ext_art_amb",
    label = "prologue_ext_art_amb",
    description = "prologue_ext_art_amb"
}, {
    value = "prologue_reflection_opt",
    label = "prologue_reflection_opt",
    description = "prologue_reflection_opt"
}, {
    value = "prologue_shootout",
    label = "prologue_shootout",
    description = "prologue_shootout"
}, {
    value = "Prologue_shootout_opt",
    label = "Prologue_shootout_opt",
    description = "Prologue_shootout_opt"
}, {
    value = "pulse",
    label = "pulse",
    description = "pulse"
}, {
    value = "RaceTurboDark",
    label = "RaceTurboDark",
    description = "RaceTurboDark"
}, {
    value = "RaceTurboFlash",
    label = "RaceTurboFlash",
    description = "RaceTurboFlash"
}, {
    value = "RaceTurboLight",
    label = "RaceTurboLight",
    description = "RaceTurboLight"
}, {
    value = "ranch",
    label = "ranch",
    description = "ranch"
}, {
    value = "REDMIST",
    label = "REDMIST",
    description = "REDMIST"
}, {
    value = "REDMIST_blend",
    label = "REDMIST_blend",
    description = "REDMIST_blend"
}, {
    value = "ReduceDrawDistance",
    label = "ReduceDrawDistance",
    description = "ReduceDrawDistance"
}, {
    value = "ReduceDrawDistanceMAP",
    label = "ReduceDrawDistanceMAP",
    description = "ReduceDrawDistanceMAP"
}, {
    value = "ReduceDrawDistanceMission",
    label = "ReduceDrawDistanceMission",
    description = "ReduceDrawDistanceMission"
}, {
    value = "reducelightingcost",
    label = "reducelightingcost",
    description = "reducelightingcost"
}, {
    value = "ReduceSSAO",
    label = "ReduceSSAO",
    description = "ReduceSSAO"
}, {
    value = "reducewaterREF",
    label = "reducewaterREF",
    description = "reducewaterREF"
}, {
    value = "refit",
    label = "refit",
    description = "refit"
}, {
    value = "reflection_correct_ambient",
    label = "reflection_correct_ambient",
    description = "reflection_correct_ambient"
}, {
    value = "RemoteSniper",
    label = "RemoteSniper",
    description = "RemoteSniper"
}, {
    value = "resvoire_reflection",
    label = "resvoire_reflection",
    description = "resvoire_reflection"
}, {
    value = "rply_brightness",
    label = "rply_brightness",
    description = "rply_brightness"
}, {
    value = "rply_brightness_neg",
    label = "rply_brightness_neg",
    description = "rply_brightness_neg"
}, {
    value = "rply_contrast",
    label = "rply_contrast",
    description = "rply_contrast"
}, {
    value = "rply_contrast_neg",
    label = "rply_contrast_neg",
    description = "rply_contrast_neg"
}, {
    value = "rply_motionblur",
    label = "rply_motionblur",
    description = "rply_motionblur"
}, {
    value = "rply_saturation",
    label = "rply_saturation",
    description = "rply_saturation"
}, {
    value = "rply_saturation_neg",
    label = "rply_saturation_neg",
    description = "rply_saturation_neg"
}, {
    value = "rply_vignette",
    label = "rply_vignette",
    description = "rply_vignette"
}, {
    value = "rply_vignette_neg",
    label = "rply_vignette_neg",
    description = "rply_vignette_neg"
}, {
    value = "SALTONSEA",
    label = "SALTONSEA",
    description = "SALTONSEA"
}, {
    value = "sandyshore_nightlight",
    label = "sandyshore_nightlight",
    description = "sandyshore_nightlight"
}, {
    value = "SAWMILL",
    label = "SAWMILL",
    description = "SAWMILL"
}, {
    value = "scanline_cam",
    label = "scanline_cam",
    description = "scanline_cam"
}, {
    value = "scanline_cam_cheap",
    label = "scanline_cam_cheap",
    description = "scanline_cam_cheap"
}, {
    value = "scope_zoom_in",
    label = "scope_zoom_in",
    description = "scope_zoom_in"
}, {
    value = "scope_zoom_out",
    label = "scope_zoom_out",
    description = "scope_zoom_out"
}, {
    value = "secret_camera",
    label = "secret_camera",
    description = "secret_camera"
}, {
    value = "services_nightlight",
    label = "services_nightlight",
    description = "services_nightlight"
}, {
    value = "shades_pink",
    label = "shades_pink",
    description = "shades_pink"
}, {
    value = "shades_yellow",
    label = "shades_yellow",
    description = "shades_yellow"
}, {
    value = "SheriffStation",
    label = "SheriffStation",
    description = "SheriffStation"
}, {
    value = "ship_explosion_underwater",
    label = "ship_explosion_underwater",
    description = "ship_explosion_underwater"
}, {
    value = "ship_lighting",
    label = "ship_lighting",
    description = "ship_lighting"
}, {
    value = "Shop247",
    label = "Shop247",
    description = "Shop247"
}, {
    value = "Shop247_none",
    label = "Shop247_none",
    description = "Shop247_none"
}, {
    value = "sleeping",
    label = "sleeping",
    description = "sleeping"
}, {
    value = "Sniper",
    label = "Sniper",
    description = "Sniper"
}, {
    value = "SP1_03_drawDistance",
    label = "SP1_03_drawDistance",
    description = "SP1_03_drawDistance"
}, {
    value = "spectator1",
    label = "spectator1",
    description = "spectator1"
}, {
    value = "spectator10",
    label = "spectator10",
    description = "spectator10"
}, {
    value = "spectator2",
    label = "spectator2",
    description = "spectator2"
}, {
    value = "spectator3",
    label = "spectator3",
    description = "spectator3"
}, {
    value = "spectator4",
    label = "spectator4",
    description = "spectator4"
}, {
    value = "spectator5",
    label = "spectator5",
    description = "spectator5"
}, {
    value = "spectator6",
    label = "spectator6",
    description = "spectator6"
}, {
    value = "spectator7",
    label = "spectator7",
    description = "spectator7"
}, {
    value = "spectator8",
    label = "spectator8",
    description = "spectator8"
}, {
    value = "spectator9",
    label = "spectator9",
    description = "spectator9"
}, {
    value = "StadLobby",
    label = "StadLobby",
    description = "StadLobby"
}, {
    value = "stc_coroners",
    label = "stc_coroners",
    description = "stc_coroners"
}, {
    value = "stc_deviant_bedroom",
    label = "stc_deviant_bedroom",
    description = "stc_deviant_bedroom"
}, {
    value = "stc_deviant_lounge",
    label = "stc_deviant_lounge",
    description = "stc_deviant_lounge"
}, {
    value = "stc_franklinsHouse",
    label = "stc_franklinsHouse",
    description = "stc_franklinsHouse"
}, {
    value = "stc_trevors",
    label = "stc_trevors",
    description = "stc_trevors"
}, {
    value = "stoned",
    label = "stoned",
    description = "stoned"
}, {
    value = "stoned_aliens",
    label = "stoned_aliens",
    description = "stoned_aliens"
}, {
    value = "stoned_cutscene",
    label = "stoned_cutscene",
    description = "stoned_cutscene"
}, {
    value = "stoned_monkeys",
    label = "stoned_monkeys",
    description = "stoned_monkeys"
}, {
    value = "StreetLighting",
    label = "StreetLighting",
    description = "StreetLighting"
}, {
    value = "StreetLightingJunction",
    label = "StreetLightingJunction",
    description = "StreetLightingJunction"
}, {
    value = "StreetLightingtraffic",
    label = "StreetLightingtraffic",
    description = "StreetLightingtraffic"
}, {
    value = "STRIP_changing",
    label = "STRIP_changing",
    description = "STRIP_changing"
}, {
    value = "STRIP_nofog",
    label = "STRIP_nofog",
    description = "STRIP_nofog"
}, {
    value = "STRIP_office",
    label = "STRIP_office",
    description = "STRIP_office"
}, {
    value = "STRIP_stage",
    label = "STRIP_stage",
    description = "STRIP_stage"
}, {
    value = "StuntFastDark",
    label = "StuntFastDark",
    description = "StuntFastDark"
}, {
    value = "StuntFastLight",
    label = "StuntFastLight",
    description = "StuntFastLight"
}, {
    value = "StuntSlowDark",
    label = "StuntSlowDark",
    description = "StuntSlowDark"
}, {
    value = "StuntSlowLight",
    label = "StuntSlowLight",
    description = "StuntSlowLight"
}, {
    value = "subBASE_water_ref",
    label = "subBASE_water_ref",
    description = "subBASE_water_ref"
}, {
    value = "sunglasses",
    label = "sunglasses",
    description = "sunglasses"
}, {
    value = "superDARK",
    label = "superDARK",
    description = "superDARK"
}, {
    value = "switch_cam_1",
    label = "switch_cam_1",
    description = "switch_cam_1"
}, {
    value = "switch_cam_2",
    label = "switch_cam_2",
    description = "switch_cam_2"
}, {
    value = "telescope",
    label = "telescope",
    description = "telescope"
}, {
    value = "TinyGreen01",
    label = "TinyGreen01",
    description = "TinyGreen01"
}, {
    value = "TinyGreen02",
    label = "TinyGreen02",
    description = "TinyGreen02"
}, {
    value = "TinyPink01",
    label = "TinyPink01",
    description = "TinyPink01"
}, {
    value = "TinyPink02",
    label = "TinyPink02",
    description = "TinyPink02"
}, {
    value = "TinyRacerMoBlur",
    label = "TinyRacerMoBlur",
    description = "TinyRacerMoBlur"
}, {
    value = "torpedo",
    label = "torpedo",
    description = "torpedo"
}, {
    value = "traffic_skycam",
    label = "traffic_skycam",
    description = "traffic_skycam"
}, {
    value = "trailer_explosion_optimise",
    label = "trailer_explosion_optimise",
    description = "trailer_explosion_optimise"
}, {
    value = "TREVOR",
    label = "TREVOR",
    description = "TREVOR"
}, {
    value = "TrevorColorCode",
    label = "TrevorColorCode",
    description = "TrevorColorCode"
}, {
    value = "TrevorColorCodeBasic",
    label = "TrevorColorCodeBasic",
    description = "TrevorColorCodeBasic"
}, {
    value = "TrevorColorCodeBright",
    label = "TrevorColorCodeBright",
    description = "TrevorColorCodeBright"
}, {
    value = "Trevors_room",
    label = "Trevors_room",
    description = "Trevors_room"
}, {
    value = "trevorspliff",
    label = "trevorspliff",
    description = "trevorspliff"
}, {
    value = "trevorspliff_blend",
    label = "trevorspliff_blend",
    description = "trevorspliff_blend"
}, {
    value = "trevorspliff_blend02",
    label = "trevorspliff_blend02",
    description = "trevorspliff_blend02"
}, {
    value = "Tunnel",
    label = "Tunnel",
    description = "Tunnel"
}, {
    value = "tunnel_entrance",
    label = "tunnel_entrance",
    description = "tunnel_entrance"
}, {
    value = "tunnel_entrance_INT",
    label = "tunnel_entrance_INT",
    description = "tunnel_entrance_INT"
}, {
    value = "TUNNEL_green",
    label = "TUNNEL_green",
    description = "TUNNEL_green"
}, {
    value = "Tunnel_green1",
    label = "Tunnel_green1",
    description = "Tunnel_green1"
}, {
    value = "TUNNEL_green_ext",
    label = "TUNNEL_green_ext",
    description = "TUNNEL_green_ext"
}, {
    value = "tunnel_id1_11",
    label = "tunnel_id1_11",
    description = "tunnel_id1_11"
}, {
    value = "TUNNEL_orange",
    label = "TUNNEL_orange",
    description = "TUNNEL_orange"
}, {
    value = "TUNNEL_orange_exterior",
    label = "TUNNEL_orange_exterior",
    description = "TUNNEL_orange_exterior"
}, {
    value = "TUNNEL_white",
    label = "TUNNEL_white",
    description = "TUNNEL_white"
}, {
    value = "TUNNEL_yellow",
    label = "TUNNEL_yellow",
    description = "TUNNEL_yellow"
}, {
    value = "TUNNEL_yellow_ext",
    label = "TUNNEL_yellow_ext",
    description = "TUNNEL_yellow_ext"
}, {
    value = "ufo",
    label = "ufo",
    description = "ufo"
}, {
    value = "ufo_deathray",
    label = "ufo_deathray",
    description = "ufo_deathray"
}, {
    value = "underwater",
    label = "underwater",
    description = "underwater"
}, {
    value = "underwater_deep",
    label = "underwater_deep",
    description = "underwater_deep"
}, {
    value = "underwater_deep_clear",
    label = "underwater_deep_clear",
    description = "underwater_deep_clear"
}, {
    value = "v_abattoir",
    label = "v_abattoir",
    description = "v_abattoir"
}, {
    value = "V_Abattoir_Cold",
    label = "V_Abattoir_Cold",
    description = "V_Abattoir_Cold"
}, {
    value = "v_bahama",
    label = "v_bahama",
    description = "v_bahama"
}, {
    value = "v_cashdepot",
    label = "v_cashdepot",
    description = "v_cashdepot"
}, {
    value = "V_CIA_Facility",
    label = "V_CIA_Facility",
    description = "V_CIA_Facility"
}, {
    value = "v_dark",
    label = "v_dark",
    description = "v_dark"
}, {
    value = "V_FIB_IT3",
    label = "V_FIB_IT3",
    description = "V_FIB_IT3"
}, {
    value = "V_FIB_IT3_alt",
    label = "V_FIB_IT3_alt",
    description = "V_FIB_IT3_alt"
}, {
    value = "V_FIB_IT3_alt5",
    label = "V_FIB_IT3_alt5",
    description = "V_FIB_IT3_alt5"
}, {
    value = "V_FIB_stairs",
    label = "V_FIB_stairs",
    description = "V_FIB_stairs"
}, {
    value = "v_foundry",
    label = "v_foundry",
    description = "v_foundry"
}, {
    value = "v_janitor",
    label = "v_janitor",
    description = "v_janitor"
}, {
    value = "v_jewel2",
    label = "v_jewel2",
    description = "v_jewel2"
}, {
    value = "v_metro",
    label = "v_metro",
    description = "v_metro"
}, {
    value = "V_Metro2",
    label = "V_Metro2",
    description = "V_Metro2"
}, {
    value = "V_Metro_station",
    label = "V_Metro_station",
    description = "V_Metro_station"
}, {
    value = "v_michael",
    label = "v_michael",
    description = "v_michael"
}, {
    value = "v_michael_lounge",
    label = "v_michael_lounge",
    description = "v_michael_lounge"
}, {
    value = "V_Office_smoke",
    label = "V_Office_smoke",
    description = "V_Office_smoke"
}, {
    value = "V_Office_smoke_ext",
    label = "V_Office_smoke_ext",
    description = "V_Office_smoke_ext"
}, {
    value = "V_Office_smoke_Fire",
    label = "V_Office_smoke_Fire",
    description = "V_Office_smoke_Fire"
}, {
    value = "v_recycle",
    label = "v_recycle",
    description = "v_recycle"
}, {
    value = "V_recycle_dark",
    label = "V_recycle_dark",
    description = "V_recycle_dark"
}, {
    value = "V_recycle_light",
    label = "V_recycle_light",
    description = "V_recycle_light"
}, {
    value = "V_recycle_mainroom",
    label = "V_recycle_mainroom",
    description = "V_recycle_mainroom"
}, {
    value = "v_rockclub",
    label = "v_rockclub",
    description = "v_rockclub"
}, {
    value = "V_Solomons",
    label = "V_Solomons",
    description = "V_Solomons"
}, {
    value = "v_strip3",
    label = "v_strip3",
    description = "v_strip3"
}, {
    value = "V_strip_nofog",
    label = "V_strip_nofog",
    description = "V_strip_nofog"
}, {
    value = "V_strip_office",
    label = "V_strip_office",
    description = "V_strip_office"
}, {
    value = "v_strpchangerm",
    label = "v_strpchangerm",
    description = "v_strpchangerm"
}, {
    value = "v_sweat",
    label = "v_sweat",
    description = "v_sweat"
}, {
    value = "v_sweat_entrance",
    label = "v_sweat_entrance",
    description = "v_sweat_entrance"
}, {
    value = "v_sweat_NoDirLight",
    label = "v_sweat_NoDirLight",
    description = "v_sweat_NoDirLight"
}, {
    value = "v_torture",
    label = "v_torture",
    description = "v_torture"
}, {
    value = "Vagos",
    label = "Vagos",
    description = "Vagos"
}, {
    value = "vagos_extlight_small",
    label = "vagos_extlight_small",
    description = "vagos_extlight_small"
}, {
    value = "VAGOS_new_garage",
    label = "VAGOS_new_garage",
    description = "VAGOS_new_garage"
}, {
    value = "VAGOS_new_hangout",
    label = "VAGOS_new_hangout",
    description = "VAGOS_new_hangout"
}, {
    value = "VagosSPLASH",
    label = "VagosSPLASH",
    description = "VagosSPLASH"
}, {
    value = "VC_tunnel_entrance",
    label = "VC_tunnel_entrance",
    description = "VC_tunnel_entrance"
}, {
    value = "vehicle_subint",
    label = "vehicle_subint",
    description = "vehicle_subint"
}, {
    value = "venice_canal_tunnel",
    label = "venice_canal_tunnel",
    description = "venice_canal_tunnel"
}, {
    value = "vespucci_garage",
    label = "vespucci_garage",
    description = "vespucci_garage"
}, {
    value = "VolticBlur",
    label = "VolticBlur",
    description = "VolticBlur"
}, {
    value = "VolticFlash",
    label = "VolticFlash",
    description = "VolticFlash"
}, {
    value = "VolticGold",
    label = "VolticGold",
    description = "VolticGold"
}, {
    value = "WAREHOUSE",
    label = "WAREHOUSE",
    description = "WAREHOUSE"
}, {
    value = "WATER _lab_cooling",
    label = "WATER _lab_cooling",
    description = "WATER _lab_cooling"
}, {
    value = "WATER_CH2_06_01_03",
    label = "WATER_CH2_06_01_03",
    description = "WATER_CH2_06_01_03"
}, {
    value = "WATER_CH2_06_02",
    label = "WATER_CH2_06_02",
    description = "WATER_CH2_06_02"
}, {
    value = "WATER_CH2_06_04",
    label = "WATER_CH2_06_04",
    description = "WATER_CH2_06_04"
}, {
    value = "WATER_cove",
    label = "WATER_cove",
    description = "WATER_cove"
}, {
    value = "WATER_hills",
    label = "WATER_hills",
    description = "WATER_hills"
}, {
    value = "WATER_ID2_21",
    label = "WATER_ID2_21",
    description = "WATER_ID2_21"
}, {
    value = "WATER_lab",
    label = "WATER_lab",
    description = "WATER_lab"
}, {
    value = "WATER_militaryPOOP",
    label = "WATER_militaryPOOP",
    description = "WATER_militaryPOOP"
}, {
    value = "WATER_muddy",
    label = "WATER_muddy",
    description = "WATER_muddy"
}, {
    value = "WATER_port",
    label = "WATER_port",
    description = "WATER_port"
}, {
    value = "WATER_REF_malibu",
    label = "WATER_REF_malibu",
    description = "WATER_REF_malibu"
}, {
    value = "WATER_refmap_high",
    label = "WATER_refmap_high",
    description = "WATER_refmap_high"
}, {
    value = "WATER_refmap_hollywoodlake",
    label = "WATER_refmap_hollywoodlake",
    description = "WATER_refmap_hollywoodlake"
}, {
    value = "WATER_refmap_low",
    label = "WATER_refmap_low",
    description = "WATER_refmap_low"
}, {
    value = "WATER_refmap_med",
    label = "WATER_refmap_med",
    description = "WATER_refmap_med"
}, {
    value = "WATER_refmap_off",
    label = "WATER_refmap_off",
    description = "WATER_refmap_off"
}, {
    value = "WATER_refmap_poolside",
    label = "WATER_refmap_poolside",
    description = "WATER_refmap_poolside"
}, {
    value = "WATER_refmap_silverlake",
    label = "WATER_refmap_silverlake",
    description = "WATER_refmap_silverlake"
}, {
    value = "WATER_refmap_venice",
    label = "WATER_refmap_venice",
    description = "WATER_refmap_venice"
}, {
    value = "WATER_refmap_verylow",
    label = "WATER_refmap_verylow",
    description = "WATER_refmap_verylow"
}, {
    value = "WATER_resevoir",
    label = "WATER_resevoir",
    description = "WATER_resevoir"
}, {
    value = "WATER_RichmanStuntJump",
    label = "WATER_RichmanStuntJump",
    description = "WATER_RichmanStuntJump"
}, {
    value = "WATER_river",
    label = "WATER_river",
    description = "WATER_river"
}, {
    value = "WATER_salton",
    label = "WATER_salton",
    description = "WATER_salton"
}, {
    value = "WATER_salton_bottom",
    label = "WATER_salton_bottom",
    description = "WATER_salton_bottom"
}, {
    value = "WATER_shore",
    label = "WATER_shore",
    description = "WATER_shore"
}, {
    value = "WATER_silty",
    label = "WATER_silty",
    description = "WATER_silty"
}, {
    value = "WATER_silverlake",
    label = "WATER_silverlake",
    description = "WATER_silverlake"
}, {
    value = "whitenightlighting",
    label = "whitenightlighting",
    description = "whitenightlighting"
}, {
    value = "WhiteOut",
    label = "WhiteOut",
    description = "WhiteOut"
}, {
    value = "winning_room",
    label = "winning_room",
    description = "winning_room"
}, {
    value = "yacht_DLC",
    label = "yacht_DLC",
    description = "yacht_DLC"
}, {
    value = "yell_tunnel_nodirect",
    label = "yell_tunnel_nodirect",
    description = "yell_tunnel_nodirect"
} } }

local vehicleslist = {
    Compacts = { "ASBO", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "BLISTA", "BRIOSO", "BRIOSO2", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "CLUB", -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
        "DILETTANTE", "DILETTANTE2", "ISSI2", "ISSI3", "ISSI4", "ISSI5", "ISSI6", "KANJO", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "PANTO", "PRAIRIE", "RHAPSODY", "WEEVIL" -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
    },
    Sedans = { "ASEA", "ASEA2", "ASTEROPE", "COG55", "COG552", "COGNOSCENTI", "COGNOSCENTI2", "EMPEROR", "EMPEROR2",
        "EMPEROR3", "FUGITIVE", "GLENDALE", "GLENDALE2", -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
        "INGOT", "INTRUDER", "LIMO2", "PREMIER", "PRIMO", "PRIMO2", "REGINA", "ROMERO", "SCHAFTER2", "SCHAFTER5",
        "SCHAFTER6", "STAFFORD", "STANIER", "STRATUM", "STRETCH", "SUPERD", "SURGE", "TAILGATER", "TAILGATER2", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "WARRENER", "WARRENER2", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "WASHINGTON" },

    SUV = { "BALLER", "BALLER2", "BALLER3", "BALLER4", "BALLER5", "BALLER6", "BJXL", "CAVALCADE", "CAVALCADE2",
        "CONTENDER", "DUBSTA", "DUBSTA2", "FQ2", "GRANGER", "GRESLEY", "HABANERO", "HUNTLEY", "LANDSTALKER",
        "LANDSTALKER2", -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
        "MESA", "MESA2", "NOVAK", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "PATRIOT", "PATRIOT2", "RADI", "REBLA", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "ROCOTO", "SEMINOLE", "SEMINOLE2", -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
        "SERRANO", "SQUADDIE", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "TOROS", "XLS", "XLS2" },
    Coupes = { "COGCABRIO", "EXEMPLAR", "F620", "FELON", "FELON2", "JACKAL", "ORACLE", "ORACLE2", "PREVION", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "SENTINEL", "SENTINEL2", "WINDSOR", "WINDSOR2", "ZION", "ZION2" },
    Muscle = { "BLADE", "BUCCANEER", "BUCCANEER2", "CHINO", "CHINO2", "CLIQUE", "COQUETTE3", "DEVIANT", "DOMINATOR",
        "DOMINATOR2", "DOMINATOR3", "DOMINATOR4", "DOMINATOR5", "DOMINATOR6", "DOMINATOR7", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "DOMINATOR8", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "DUKES", "DUKES2", "DUKES3", -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
        "ELLIE", "FACTION", "FACTION2", "FACTION3", "GAUNTLET", "GAUNTLET2", "GAUNTLET3", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "GAUNTLET4", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "GAUNTLET5", -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
        "HERMES", "HOTKNIFE", "HUSTLER", "IMPALER", "IMPALER2", "IMPALER3", "IMPALER4", "IMPERATOR", "IMPERATOR2",
        "IMPERATOR3", "LURCHER", "MANANA2", -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
        "MOONBEAM", "MOONBEAM2", "NIGHTSHADE", "PEYOTE2", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "PHOENIX", "PICADOR", "RATLOADER", "RATLOADER2", "RUINER", "RUINER2", "RUINER3", "SABREGT", "SABREGT2", "SLAMVAN",
        "SLAMVAN2", "SLAMVAN3", "SLAMVAN4", "SLAMVAN5", "SLAMVAN6", "STALION", "STALION2", "TAMPA", "TAMPA3",
        "TULIP", "VAMOS", "VIGERO", "VIRGO", "VIRGO2", "VIRGO3", "VOODOO", "VOODOO2", "YOSEMITE", "YOSEMITE2" -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
    },
    SportsClassic = { "ARDENT", "BTYPE", "BTYPE2", "BTYPE3", "CASCO", "CHEBUREK", "CHEETAH2", "COQUETTE2", "DELUXO",
        "DYNASTY", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "FAGALOA", "FELTZER3", -- Stirling GT
        "GT500", "INFERNUS2", "JB700", "JB7002", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "JESTER3", "MAMBA", "MANANA", "MICHELLI", "MONROE", "NEBULA", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "PEYOTE", "PEYOTE3", -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
        "PIGALLE", "RAPIDGT3", "RETINUE", "RETINUE2", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "SAVESTRA", "STINGER", "STINGERGT", "STROMBERG", "SWINGER", "TOREADOR", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "TORERO", "TORNADO", "TORNADO2", "TORNADO3", "TORNADO4", "TORNADO5", "TORNADO6", "TURISMO2",
        "VISERIS", "Z190", "ZION3", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "ZTYPE" },
    Sports = { "ALPHA", "BANSHEE", "BESTIAGTS", "BLISTA2", "BLISTA3", "BUFFALO", "BUFFALO2", "BUFFALO3", "CALICO", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "CARBONIZZARE", "COMET2", "COMET3", "COMET4", "COMET5", "COMET6", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "COQUETTE", "COQUETTE4", -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
        "CYPHER", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "DRAFTER", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "ELEGY", "ELEGY2", "EUROS", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "FELTZER2", "FLASHGT", "FUROREGT", "FUSILADE", "FUTO", "FUTO2", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "GB200", "GROWLER", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "HOTRING", "IMORGON", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "ISSI7", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "ITALIGTO", "ITALIRSX", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "JESTER", "JESTER2", "JESTER4", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "JUGULAR", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "KHAMELION", "KOMODA", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "KURUMA", "KURUMA2", "LOCUST", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "LYNX", "MASSACRO", "MASSACRO2", "NEO", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "NEON", "NINEF", "NINEF2", "OMNIS", "PARAGON", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "PARAGON2", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "PARIAH", "PENUMBRA", "PENUMBRA2", -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
        "RAIDEN", "RAPIDGT", "RAPIDGT2", "RAPTOR", "REMUS", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "REVOLTER", "RT3000", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "RUSTON", "SCHAFTER2", "SCHAFTER3", "SCHAFTER4", "SCHAFTER5", "SCHLAGEN", "SCHWARZER", "SENTINEL3", "SEVEN70",
        "SPECTER", "SPECTER2", "SUGOI", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "SULTAN", "SULTAN2", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "SULTAN3", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "SURANO", "TAMPA2", "TROPOS", "VERLIERER2", "VECTRE", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "VETO", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "VETO2", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "VSTR", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "ZR350", -- LS TUNERS (MPTUNER) DLC - Requires b2372
        "ZR380", "ZR3802", "ZR3803" },
    Super = { "ADDER", "AUTARCH", "BANSHEE2", "BULLET", "CHEETAH", "CYCLONE", "DEVESTE", "EMERUS", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "ENTITYXF", "ENTITY2", "FMJ", "FURIA", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "GP1", "INFERNUS", "ITALIGTB", "ITALIGTB2", "KRIEGER", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "LE7B", "NERO", "NERO2", "OSIRIS", "PENETRATOR", "PFISTER811", "PROTOTIPO", "REAPER", "S80", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "SC1", "SCRAMJET", "SHEAVA", -- ETR1
        "SULTANRS", "T20", "TAIPAN", "TEMPESTA", "TEZERACT", "THRAX", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "TIGON", -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
        "TURISMOR", "TYRANT", "TYRUS", "VACCA", "VAGNER", "VIGILANTE", "VISIONE", "VOLTIC", "VOLTIC2", "XA21", "ZENTORNO",
        "ZORRUSSO" -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
    },
    MotorCycles = { "AKUMA", "AVARUS", "BAGGER", "BATI", "BATI2", "BF400", "CARBONRS", "CHIMERA", "CLIFFHANGER",
        "DAEMON", "DAEMON2", "DEFILER", "DEATHBIKE", "DEATHBIKE2", "DEATHBIKE3", "DIABLOUS", "DIABLOUS2",
        "DOUBLE", "ENDURO", "ESSKEY", "FAGGIO", "FAGGIO2", "FAGGIO3", "FCR", "FCR2", "GARGOYLE", "HAKUCHOU",
        "HAKUCHOU2", "HEXER", "INNOVATION", "LECTRO", "MANCHEZ", "MANCHEZ2", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "NEMESIS", "NIGHTBLADE", "OPPRESSOR", "OPPRESSOR2", "PCJ", "RATBIKE", "RROCKET", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "RUFFIAN", "SANCHEZ", "SANCHEZ2", "SANCTUS", "SHOTARO", "SOVEREIGN", "STRYDER", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "THRUST", "VADER", "VINDICATOR", "VORTEX", "WOLFSBANE", "ZOMBIEA", "ZOMBIEB" },
    OffRoad = { "BFINJECTION", "BIFTA", "BLAZER", "BLAZER2", "BLAZER3", "BLAZER4", "BLAZER5", "BODHI2", "BRAWLER",
        "BRUISER", "BRUISER2", "BRUISER3", "BRUTUS", "BRUTUS2", "BRUTUS3", "CARACARA", "CARACARA2", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "DLOADER", "DUBSTA3", "DUNE", "DUNE2", "DUNE3", "DUNE4", "DUNE5", "EVERON", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "FREECRAWLER", "HELLION", -- CASINO AND RESORT (MPVINEWOOD) DLC - Requires b2060
        "INSURGENT", "INSURGENT2", "INSURGENT3", "KALAHARI", "KAMACHO", "MARSHALL", "MENACER", "MESA3", "MONSTER",
        "MONSTER3", "MONSTER4", "MONSTER5", "NIGHTSHARK", "OUTLAW", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "RANCHERXL", "RANCHERXL2", "RCBANDITO", "REBEL", "REBEL2", "RIATA", "SANDKING", "SANDKING2", "TECHNICAL",
        "TECHNICAL2", "TECHNICAL3", "TROPHYTRUCK", "TROPHYTRUCK2", "VAGRANT", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "VERUS", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "WINKY", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "YOSEMITE3", -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
        "ZHABA" -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
    },
    Industrial = { "BULLDOZER", "CUTTER", "DUMP", "FLATBED", "GUARDIAN", "HANDLER", "MIXER", "MIXER2", "RUBBLE",
        "TIPTRUCK", "TIPTRUCK2" },
    Utility = { "AIRTUG", "CADDY", "CADDY2", "CADDY3", "DOCKTUG", "FORKLIFT", "MOWER", -- Lawnmower
        "RIPLEY", "SADLER", "SADLER2", "SCRAP", "SLAMTRUCK", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "TOWTRUCK", "TOWTRUCK2", "TRACTOR", -- Tractor (rusted/old)
        "TRACTOR2", -- Fieldmaster
        "TRACTOR3", -- Fieldmaster
        "UTILLITRUCK", "UTILLITRUCK2", "UTILLITRUCK3", -- / Trailers
        -- / Army Trailers
        "ARMYTRAILER", -- Military
        "ARMYTRAILER2", -- Civillian
        "FREIGHTTRAILER", -- Extended
        "ARMYTANKER", -- Army Tanker
        "TRAILERLARGE", -- Mobile Operations Center
        -- / Large Trailers
        "DOCKTRAILER", -- Shipping Container Trailer
        "TR3", -- Large Boat Trailer (Sailboat)
        "TR2", -- Large Vehicle Trailer
        "TR4", -- Large Vehicle Trailer (Mission Cars)
        "TRFLAT", -- Large Flatbed Empty Trailer
        "TRAILERS", -- Container/Curtain Trailer
        "TRAILERS4", -- White Container Trailer
        "TRAILERS2", -- Box Trailer
        "TRAILERS3", -- Ramp Box Trailer
        "TVTRAILER", -- Fame or Shame Trailer
        "TRAILERLOGS", -- Logs Trailer
        "TANKER", -- Ron Oil Tanker Trailer
        "TANKER2", -- Ron Oil Tanker Trailer (Heist Version)
        -- / Medium Trailers
        "BALETRAILER", -- (Tractor Hay Bale Trailer)
        "GRAINTRAILER", -- (Tractor Grain Trailer)
        -- Ortega's trailer, we don't want this one because you can't drive them.
        -- "PROPTRAILER",
        -- / Small Trailers
        "BOATTRAILER", -- Small Boat Trailer
        "RAKETRAILER", -- Tractor Tow Plow/Rake
        "TRAILERSMALL" -- Small Utility Trailer
    },
    Vans = { "BISON", "BISON2", "BISON3", "BOBCATXL", "BOXVILLE", "BOXVILLE2", "BOXVILLE3", "BOXVILLE4", "BOXVILLE5",
        "BURRITO", "BURRITO2", "BURRITO3", "BURRITO4", "BURRITO5", "CAMPER", "GBURRITO", "GBURRITO2", "JOURNEY",
        "MINIVAN", "MINIVAN2", "PARADISE", "PONY", "PONY2", "RUMPO", "RUMPO2", "RUMPO3", "SPEEDO", "SPEEDO2",
        "SPEEDO4", "SURFER", "SURFER2", "TACO", "YOUGA", "YOUGA2", "YOUGA3" -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
    },
    Cycles = { "BMX", "CRUISER", "FIXTER", "SCORCHER", "TRIBIKE", "TRIBIKE2", "TRIBIKE3" },
    Boats = { "AVISA", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "DINGHY", "DINGHY2", "DINGHY3", "DINGHY4", "DINGHY5", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "JETMAX", "KOSATKA", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "LONGFIN", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "MARQUIS", "PATROLBOAT", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "PREDATOR", "SEASHARK", "SEASHARK2", "SEASHARK3", "SPEEDER", "SPEEDER2", "SQUALO", "SUBMERSIBLE", "SUBMERSIBLE2",
        "SUNTRAP", "TORO", "TORO2", "TROPIC", "TROPIC2", "TUG" },
    Helicopter = { "AKULA", "ANNIHILATOR", "ANNIHILATOR2", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "BUZZARD", "BUZZARD2", "CARGOBOB", "CARGOBOB2", "CARGOBOB3", "CARGOBOB4", "FROGGER", "FROGGER2", "HAVOK", "HUNTER",
        "MAVERICK", "POLMAV", "SAVAGE", "SEASPARROW", "SEASPARROW2", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "SEASPARROW3", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "SKYLIFT", "SUPERVOLITO", "SUPERVOLITO2", "SWIFT", "SWIFT2", "VALKYRIE", "VALKYRIE2", "VOLATUS" },
    Planes = { "ALKONOST", -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
        "ALPHAZ1", "AVENGER", "AVENGER2", "BESRA", "BLIMP", "BLIMP2", "BLIMP3", "BOMBUSHKA", "CARGOPLANE", "CUBAN800",
        "DODO", "DUSTER", "HOWARD", "HYDRA", "JET", "LAZER", "LUXOR", "LUXOR2", "MAMMATUS", "MICROLIGHT",
        "MILJET", "MOGUL", "MOLOTOK", "NIMBUS", "NOKOTA", "PYRO", "ROGUE", "SEABREEZE", "SHAMAL", "STARLING",
        "STRIKEFORCE", "STUNT", "TITAN", "TULA", "VELUM", "VELUM2", "VESTRA", "VOLATOL" },
    Service = { "AIRBUS", "BRICKADE", "BUS", "COACH", "PBUS2", "RALLYTRUCK", "RENTALBUS", "TAXI", "TOURBUS", "TRASH",
        "TRASH2", "WASTELANDER" },
    Emergency = { "AMBULANCE", "FBI", "FBI2", "FIRETRUK", "LGUARD", "PBUS", "POLICE", "POLICE2", "POLICE3", "POLICE4",
        "POLICEB", "POLICEOLD1", "POLICEOLD2", "POLICET", "POLMAV", "PRANGER", "PREDATOR", "RIOT", "RIOT2",
        "SHERIFF", "SHERIFF2" },
    Military = { "APC", "BARRACKS", "BARRACKS2", "BARRACKS3", "BARRAGE", "CHERNOBOG", "CRUSADER", "HALFTRACK",
        "KHANJALI", "MINITANK", -- CASINO HEIST (MPHEIST3) DLC - Requires b2060
        "RHINO", "SCARAB", "SCARAB2", "SCARAB3", "THRUSTER", -- Jetpack
        "TRAILERSMALL2", -- Anti Aircraft Trailer
        "VETIR" -- CAYO PERICO (MPHEIST4) DLC - Requires b2189
    },
    Commercial = { "BENSON", "BIFF", "CERBERUS", "CERBERUS2", "CERBERUS3", "HAULER", "HAULER2", "MULE", "MULE2", "MULE3",
        "MULE4", "PACKER", "PHANTOM", "PHANTOM2", "PHANTOM3", "POUNDER", "POUNDER2", "STOCKADE", "STOCKADE3",
        "TERBYTE" },
    Trains = { "CABLECAR", "FREIGHT", "FREIGHTCAR", "FREIGHTCONT1", "FREIGHTCONT2", "FREIGHTGRAIN", "METROTRAIN",
        "TANKERCAR" },
    OpenWheel = { "FORMULA", "FORMULA2", "OPENWHEEL1", -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
        "OPENWHEEL2" -- SUMMER SPECIAL (MPSUM) DLC - Requires b2060
    }
}
local fakeNotif =
{ -- stuff thats playable in the fake sound option, uses special furfag.de page for youtube player embed and volume
    {
        name = "Discord Call",
        youtube_id = "n_WorPInSPQ",
        volume = 25 -- 75% is the maximum.
    }, {
        name = "Discord Message",
        youtube_id = "rIPq9Fl5r44",
        volume = 20
    }, {
        name = "Skype Call",
        youtube_id = "lVQI7CLus04",
        volume = 25
    }, {
        name = "TS3 Hey Wake Up",
        youtube_id = "s-KcXdYysTQ",
        volume = 15
    }, {
        name = "Win10 Error",
        youtube_id = "QkcEqzO_pus",
        volume = 25
    }, {
        name = "Win10 USB",
        youtube_id = "OOJi5zm9GYQ",
        volume = 60
    }, {
        name = "Door Knocking",
        youtube_id = "4Potjy81R3c",
        volume = 60
    } }
local TSNotif = function(msg)
    lib.notify({
        title = 'TS Admin Menu',
        description = msg,
        type = 'inform'
    })
end

local IsPlayerAllowed = function(obj)
    local allowed = lib.callback.await('ts-adminmenu:getAuthorization', false, obj)
    return allowed
end

local selectedPlayer = 0
local menu = MenuV:CreateMenu(" ", 'Developed By Tony', 'topright', 102, 0, 204, 'size-150', 'template1', 'menuv',
    'mainmenu')
local onlineplayers = MenuV:CreateMenu(" ", 'Online Players', 'topright', 102, 0, 204, 'size-150', 'template1', 'menuv',
    'onlineplayers')
local onlineplayers_each = MenuV:CreateMenu(" ", 'Online Players', 'topright', 102, 0, 204, 'size-150', 'template1',
    'menuv', 'onlineplayers_each')

local playeroptions = MenuV:CreateMenu(" ", 'Player Related Options', 'topright', 102, 0, 204, 'size-150', 'template1',
    'menuv', 'playerrelatedoption')

local playeroptions2 = MenuV:CreateMenu(" ", 'Player Options', 'topright', 102, 0, 204, 'size-150', 'template1',
    'menuv', 'playerrelatedoption2')
local playeroptions_custom = MenuV:CreateMenu(" ", 'Ped Customization', 'topright', 102, 0, 204, 'size-150',
    'template1', 'menuv', 'playerrelatedoption_ped')

local playeroptions_custom_customize = MenuV:CreateMenu(" ", 'Ped Customization Menu', 'topright', 102, 0, 204,
    'size-150', 'template1', 'menuv', 'playerrelatedoption_ped2')

local vehicleoptions = MenuV:CreateMenu(" ", 'Vehicle Related Options', 'topright', 102, 0, 204, 'size-150',
    'template1', 'menuv', 'vehiclerelatedoption')

local vehicleoptions_vehiclespawn = MenuV:CreateMenu(" ", 'Vehicle Spawner', 'topright', 102, 0, 204, 'size-150',
    'template1', 'menuv', 'vehiclerelatedspawner')

local vehicleoptions_vehicleop = MenuV:CreateMenu(" ", 'Vehicle Options', 'topright', 102, 0, 204, 'size-150',
    'template1', 'menuv', 'vehiclerelatedoption2')

local vehicleoptions_vehicleop_mod = MenuV:CreateMenu(" ", 'Mod Menu', 'topright', 102, 0, 204, 'size-150', 'template1',
    'menuv', 'vehmodmenu')
local vehicleoptions_vehicleop_mod_colormenu = MenuV:CreateMenu(" ", 'Color Menu', 'topright', 102, 0, 204, 'size-150',
    'template1', 'menuv', 'vehmodmenucolor')
local vehicleoptions_vehicleop_mod_colors = MenuV:CreateMenu(" ", 'Classic Colors', 'topright', 102, 0, 204, 'size-150',
    'template1', 'menuv', 'vehmodmenuclasiccol')
local vehicleoptions_vehicleop_mod_tyresmoke = MenuV:CreateMenu(" ", 'Tyre Smoke Colors', 'topright', 255, 0, 0,
    'size-150', 'template1', 'menuv', 'vehmodmenutyrsmok')
local vehicleoptions_vehicleop_mod_metal = MenuV:CreateMenu(" ", 'Metal Colors', 'topright', 102, 0, 204, 'size-150',
    'template1', 'menuv', 'vehmodmenumetalcol')
local vehicleoptions_vehicleop_mod_matte = MenuV:CreateMenu(" ", 'Matte Colors', 'topright', 102, 0, 204, 'size-150',
    'template1', 'menuv', 'vehmodmenumattecol')
local vehicleoptions_vehicleop_mod_neon = MenuV:CreateMenu(" ", 'Neon Options', 'topright', 102, 0, 204, 'size-150',
    'template1', 'menuv', 'vehmodmenuneon')
local miscsettings = MenuV:CreateMenu(" ", 'Misc Settings', 'topright', 102, 0, 204, 'size-150', 'template1', 'menuv',
    'miscsett')
local rockstar = MenuV:CreateMenu(" ", 'Rockstar Editor', 'topright', 102, 0, 204, 'size-150', 'template1', 'menuv',
    'rockstar')

local trollmenu = MenuV:CreateMenu(" ", 'Troll Menu', 'topright', 102, 0, 204, 'size-150', 'template1', 'menuv',
    'trollmenu')

local spawnermenu = {}
for k, v in pairs(vehicleslist) do
    spawnermenu[k] = MenuV:CreateMenu(" ", k, 'topright', 102, 0, 204, 'size-150', 'template1', 'menuv', k)
end

local isPrimary = true
local isSecondary = false
local isPearlescent = false
local isWheel = false
local isDash = false
local isInt = false
local isTyreSmoke = false



local LoadOnlinePlayersEach = function()
    onlineplayers_each:ClearItems()
    -----------------------------------------------------------------------------
    -- SEND MESSAGE
    ----------------------------------------------------------------------------
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.SendMessage') then

        local onlineplayers_each_sendm = onlineplayers_each:AddButton({
            icon = '💬',
            label = "Send Private Message",
            description = "Send private message to player",
            value = "sendm",
            false,
            select = function(i)
                local input = lib.inputDialog('TS Admin Menu', { 'Message' })

                if input then
                    local message = input[1]
                    if message == nil then
                        return
                    end
                    TriggerServerEvent('ts-adminmenu:server:SendMessage', selectedPlayer, message)
                end
            end
        })
    end
    -----------------------------------------------------------------------------
    -- CHANGE SKIN
    ----------------------------------------------------------------------------

    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.ChangeSkin') then

        local onlineplayers_each_sendm = onlineplayers_each:AddButton({
            icon = '💬',
            label = "Change Skin",
            description = "Change skin option for player",
            value = "changesk",
            false,
            select = function(i)

                TriggerServerEvent('ts-adminmenu:server:ChangeSkin', selectedPlayer)
            end
        })
    end

    -------------------------------------------------------------------------
    -- SHOW INVENTORY
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.OpenInventory') then

        local onlineplayers_each_openinv = onlineplayers_each:AddButton({
            icon = '📂',
            label = "Show Inventory",
            description = "Show Player Inventory",
            value = "openinv",
            false,
            select = function(i)
                MenuV:CloseAll()
                TriggerServerEvent('ts-adminmenu:server:ShowInventory', selectedPlayer)
                selectedPlayer = 0
            end
        })
    end

    -------------------------------------------------------------------------
    -- SET JOB
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.SetJob') then

        local onlineplayers_each_setjob = onlineplayers_each:AddButton({
            icon = '📗',
            label = "Set Job",
            description = "Change Player Job",
            value = "setj",
            false,
            select = function(i)
                lib.callback('ts-adminmenu:server:GetJobs', false, function(jobs)
                    local myMenu = {}
                    for k, v in pairs(jobs) do
                        local grade = 0
                        for i, j in pairs(v.grades) do
                            grade = grade + 1
                        end
                        myMenu[v.label..' - '..v.name] = {
                            description = 'Grades = '.. grade -1,
                            arrow = true,
                            event = 'ts-adminmenu:client:setgrade',
                            args = {
                                job = v.name,
                                max = grade
                            }
                        }
                    end
                    lib.registerContext({
                        id = 'jobs_menu',
                        title = 'TS Job List',
                        options = myMenu
                    })
                    
                    lib.showContext('jobs_menu')
                end)
            end
        })
        RegisterCommand('sjob', function(source, args, raw)
            TriggerServerEvent('ts-adminmenu:server:SetJob', args[1], args[2], args[3])
        end)
    end

    RegisterNetEvent('ts-adminmenu:client:setgrade', function(data)
        local job = data.job
        local max = tonumber(data.max) - 1

        local input = lib.inputDialog('TS Admin Menu', { "Max Grade: " .. max })

        if input then
            local grade = tonumber(input[1])
            if grade == nil then
                return
            end
            TriggerServerEvent('ts-adminmenu:server:SetJob', selectedPlayer, job, grade)
        end
    end)

    -------------------------------------------------------------------------
    -- ADD INVENTORY ITEM
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.GiveItem') then

        local SelectItems = function()
            local Items = exports.ox_inventory:Items()

            local myMenu = {}

            for k, v in pairs(Items) do
                myMenu[v.label] = {
                    description = 'Give ' .. v.name,
                    arrow = true,
                    event = 'ts-adminmenu:client:GiveItem',
                    args = {
                        item = v.name,
                        plyid = selectedPlayer
                    }
                }
            end
            lib.registerContext({
                id = 'give_item',
                title = 'Give Item - Item List',
                options = myMenu
            })
            lib.showContext('give_item')
        end
        local onlineplayers_each_giveitem = onlineplayers_each:AddButton({
            icon = '🎁',
            label = "Give Player Item",
            description = "Give Item",
            value = "giveinv",
            false,
            select = function(i)
                SelectItems()
            end
        })
    end

    -- NAME
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.GiveItemName') then

        local SelectItems = function()
            local input = lib.inputDialog('TS Admin Menu', { "Item Code" })

            if input then
                local itemname = input[1]
                if itemname == nil then
                    return
                end
                local data = {
                    item = itemname,
                    plyid = selectedPlayer
                }
                TriggerEvent('ts-adminmenu:client:GiveItem', data)
            end
        end
        RegisterCommand('gi', function(source, args, raw)
            local input = lib.inputDialog('TS Admin Menu', { "Player ID", "Item Name" })

            if input then
                local pid = tonumber(input[1])
                local itemname = input[2]
                if pid or itemname == nil then
                    return
                end
                local data = {
                    item = itemname,
                    plyid = pid
                }
                TriggerEvent('ts-adminmenu:client:GiveItem', data)
            end
        end)
        local onlineplayers_each_giveitemname = onlineplayers_each:AddButton({
            icon = '🎁',
            label = "Give Player Item",
            description = "Give Item",
            value = "giveitem",
            false,
            select = function(i)
                SelectItems()
            end
        })
    end

    -------------------------------------------------------------------------
    -- REMOVE INVENTORY ITEM
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.RemoveInventoryItem') then

        local onlineplayers_each_removeitem = onlineplayers_each:AddButton({
            icon = '🗑',
            label = "Remove Inventory Item",
            description = "Remove Item",
            value = "removeinv",
            false,
            select = function(i)
                TriggerServerEvent('ts-adminmenu:server:GetItems', selectedPlayer)
            end
        })
    end
    -------------------------------------------------------------------------
    -- GIVE ACCOUNT MONEY
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.GiveMoney') then

        local onlineplayers_each_givem = onlineplayers_each:AddButton({
            icon = '💵',
            label = "Give Account Money",
            description = "Give Money",
            value = "givemon",
            false,
            select = function(i)
                local input = lib.inputDialog('Add Account Money - TSAdmin', { "Account Name (money, bank, black_money)", "Amount" })

                if input then
                    local acc = input[1]
                    local amount = tonumber(input[2])
                    if acc == nil or amount == nil then
                        return
                    end
                    TriggerServerEvent('ts-adminmenu:server:GiveAccMoney', selectedPlayer, acc, amount)
                end
            end
        })
    end
    -------------------------------------------------------------------------
    -- REMOVE ACCOUNT MONEY
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.RemoveMoney') then

        local onlineplayers_each_removem = onlineplayers_each:AddButton({
            icon = '💵',
            label = "Remove Account Money",
            description = "Remove Money",
            value = "givemon",
            false,
            select = function(i)
                local input = lib.inputDialog('Remove Account Money - TSAdmin', { "Account Name (money, bank, black_money)", "Amount" })

                if input then
                    local acc = input[1]
                    local amount = tonumber(input[2])
                    if acc == nil or amount == nil then
                        return
                    end
                    TriggerServerEvent('ts-adminmenu:server:RemoveAccMoney', selectedPlayer, acc, amount)
                end
            end
        })
    end
    -------------------------------------------------------------------------
    -- GIVE/REMOVE LICENSE
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.License') then

        local onlineplayers_each_lic = onlineplayers_each:AddButton({
            icon = '✨',
            label = "Add / Remove License",
            description = "Add / Remove License",
            value = "addrmlicense",
            false,
            select = function(i)
                local input = lib.inputDialog('TS Admin Menu - License Manager', { "License Name" })

                if input then
                    local license = input[1]
                    if license == nil then
                        return
                    end
                    TriggerServerEvent('ts-adminmenu:server:ToggleLicense', selectedPlayer, license)
                end
            end
        })
    end
    -------------------------------------------------------------------------
    -- HEAL PLAYER
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.Heal') then

        local onlineplayers_each_heal = onlineplayers_each:AddButton({
            icon = '✨',
            label = "Heal Player",
            description = "Heal Player",
            value = "heal",
            false,
            select = function(i)
                TriggerServerEvent('ts-adminmenu:server:HealPlayer', selectedPlayer)
            end
        })
    end
    -------------------------------------------------------------------------
    -- REVIVE
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.Revive') then

        local onlineplayers_each_revive = onlineplayers_each:AddButton({
            icon = '❤️',
            label = "Revive Player",
            description = "Revive Player",
            value = "rev",
            false,
            select = function(i)
                TriggerServerEvent('ts-adminmenu:server:RevivePlayer', selectedPlayer)
            end
        })
        RegisterCommand('rv', function(source, args, raw)
            if args[1] then
                TriggerServerEvent('ts-adminmenu:server:RevivePlayer', args[1])
            else
                TriggerServerEvent('ts-adminmenu:server:RevivePlayer', GetPlayerServerId(PlayerId()))
            end
        end)
    end


    -------------------------------------------------------------------------
    -- GOTO
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.Goto') then

        local onlineplayers_each_goto = onlineplayers_each:AddButton({
            icon = '🛸',
            label = "Teleport To Player",
            description = "Teleport to Player",
            value = "goto",
            false,
            select = function(i)
                TriggerServerEvent('ts-adminmenu:server:Goto', selectedPlayer)
            end
        })
        RegisterCommand('gt', function(source, args, raw)
            if args[1] then
                TriggerServerEvent('ts-adminmenu:server:Goto', args[1])
            end
        end)
    end
    -------------------------------------------------------------------------
    -- BRING
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.Bring') then

        local onlineplayers_each_bring = onlineplayers_each:AddButton({
            icon = '🚀',
            label = "Bring Player",
            description = "Bring Player",
            value = "bring",
            false,
            select = function(i)
                TriggerServerEvent('ts-adminmenu:server:Bring', selectedPlayer)
            end
        })
        RegisterCommand('br', function(source, args, raw)
            if args[1] then
                TriggerServerEvent('ts-adminmenu:server:Bring', args[1])
            end
        end)
    end
    -------------------------------------------------------------------------
    -- SET WAYPOINT
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.SetWaypoint') then

        local onlineplayers_each_waypoint = onlineplayers_each:AddButton({
            icon = '🔍',
            label = "Set Waypoint",
            description = "Set waypoint to player coords",
            value = "waypointgoto",
            false,
            select = function(i)
                TriggerServerEvent('ts-adminmenu:server:SetWaypoint', selectedPlayer)
            end
        })
    end
    -------------------------------------------------------------------------
    -- PRINT IDENTIFIERS
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.PRINTID') then

        local onlineplayers_each_printid = onlineplayers_each:AddButton({
            icon = '💾',
            label = "Print Identifiers",
            description = "Print player identifiers",
            value = "printid",
            false,
            select = function(i)
                TriggerServerEvent('ts-adminmenu:server:PrintID', selectedPlayer)
            end
        })
    end
    -------------------------------------------------------------------------
    -- KILL PLAYER
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.KillPlayer') then

        local onlineplayers_each_killp = onlineplayers_each:AddButton({
            icon = '🔪',
            label = "Kill Player",
            description = "Kill Player",
            value = "killp",
            false,
            select = function(i)
                TriggerServerEvent('ts-adminmenu:server:KillPlayer', selectedPlayer)
            end
        })
    end
    -------------------------------------------------------------------------
    -- KICK PLAYER
    if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.KickPlayer') then

        local onlineplayers_each_kickp = onlineplayers_each:AddButton({
            icon = '🦶🏽',
            label = "Kick Player",
            description = "Kick Player",
            value = "kickp",
            false,
            select = function(i)
                TriggerServerEvent('ts-adminmenu:server:KickPlayer', selectedPlayer)
            end
        })
    end

    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------
end
local LoadVehicleOptions = function()
    vehicleoptions:ClearItems()
    vehicleoptions_vehiclespawn:ClearItems()
    vehicleoptions_vehicleop:ClearItems()
    vehicleoptions_vehicleop_mod_colormenu:ClearItems()
    for k, v in pairs(vehicleslist) do
        if spawnermenu[k] then
            spawnermenu[k]:ClearItems()
        end
    end
    -- DELETE VEHICLE RADIUS
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.DeleteVehicle') then

        local vehicleoptions_vehicleop_deleter = vehicleoptions:AddButton({
            icon = '🚙',
            label = 'Delete Vehicle Radius',
            value = 'dvr',
            description = 'Delete vehicles in radius',
            select = function(i)
                local input = lib.inputDialog('TS Admin Menu - Delete Vehicle In Radius', { "Radius" })

                if input then
                    local radius = tonumber(input[1])
                    if radius == nil then
                        return
                    end
                    TriggerServerEvent('ts-adminmenu:server:DeleteVehicle', radius)
                end

            end
        })
    end

    -- Unlock Closest Vehicle
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.UnlockVehicle') then

        local vehicleoptions_vehicleop_lockpick = vehicleoptions:AddButton({
            icon = '🚙',
            label = 'Unlock Vehicle',
            value = 'unc',
            description = 'Unlock Closest Vehicle',
            select = function(i)
                local vehicle = ESX.Game.GetClosestVehicle()
                SetVehicleDoorsLocked(vehicle, 1)
                SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            end
        })
    end
    local vehicleoptions_vehrelated_spawn = vehicleoptions:AddButton({
        icon = '🚙',
        label = 'Vehicle Spawner',
        value = vehicleoptions_vehiclespawn,
        description = 'Vehicle Spawner'
    })
    ----------------------------------------------------------------------------
    -- VEHICLE SPAWNER

    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.Spawner') then

        local cooldown = false
        CreateThread(function()

            vehicleoptions_vehiclespawn:AddButton({
                icon = '',
                label = "Spawn Custom Vehicle",
                description = "Spawn Custom Veh",
                value = 'custom',
                false,
                select = function(i)
                    local input = lib.inputDialog('TS Admin Menu - Vehicle Spawner', { "Spawn Code" })

                    if input then
                        local veh = input[1]
                        if veh == nil then
                            return
                        end
                        TriggerServerEvent('ts-adminmenu:server:SpawnVehicle', veh)
                    end
                end
            })
            for k, v in pairs(vehicleslist) do

                vehicleoptions_vehiclespawn:AddButton({
                    icon = '',
                    label = k,
                    description = "Show " .. k .. ' Vehicles',
                    value = spawnermenu[k],
                    false
                })
                Wait(100)
                for i, j in ipairs(v) do
                    spawnermenu[k]:AddButton({
                        icon = '',
                        label = j,
                        value = 'adder',
                        description = 'Spawn ' .. j,
                        select = function(i)
                            if cooldown then
                                lib.notify({
                                    title = 'TS Admin Menu',
                                    description = 'Please Wait sometime before spawning again',
                                    type = 'inform'
                                })
                                return
                            end
                            cooldown = true
                            TriggerServerEvent('ts-adminmenu:server:SpawnVehicle', j)
                            Wait(3000)
                            cooldown = false
                        end
                    })
                end
            end
        end)
    end
    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------
    local vehicleoptions_vehrelated = vehicleoptions:AddButton({
        icon = '🚙',
        label = 'Vehicle Options',
        value = 'vehicleoptions_vehicleop',
        description = 'Vehicle Options',
        select = function(i)

            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            if veh ~= 0 then
                MenuV:OpenMenu(vehicleoptions_vehicleop)
            else
                lib.notify({
                    title = 'TS Admin Menu',
                    description = 'You are not in any vehicle',
                    type = 'error'
                })
            end
        end
    })
    ----------------------------------------------------------------------------
    -- VEHICLE OPTIONS

    ----------------------------------------------------------------------------
    -- MOD MENU

    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.Modmenu') then

        local vehicleoptions_vehicleop_mod_colortyr = vehicleoptions_vehicleop_mod_colormenu:AddButton({
            icon = '',
            label = 'Tyre Smoke Colors',
            value = vehicleoptions_vehicleop_mod_tyresmoke,
            description = 'Tyre Smoke Color'
        })

        local vehicleoptions_vehicleop_mod_colorneon = vehicleoptions_vehicleop_mod_colormenu:AddButton({
            icon = '',
            label = 'Neon Option',
            value = vehicleoptions_vehicleop_mod_neon,
            description = 'Neon Options'
        })
        local vehicleoptions_vehicleop_mod_colorclass = vehicleoptions_vehicleop_mod_colormenu:AddButton({
            icon = '',
            label = 'Classic Colors',
            value = vehicleoptions_vehicleop_mod_colors,
            description = 'Classic Color'
        })
        local vehicleoptions_vehicleop_mod_colormatte = vehicleoptions_vehicleop_mod_colormenu:AddButton({
            icon = '',
            label = 'Matte Colors',
            value = vehicleoptions_vehicleop_mod_matte,
            description = 'Matte Color'
        })

        local vehicleoptions_vehicleop_mod_colormetal = vehicleoptions_vehicleop_mod_colormenu:AddButton({
            icon = '',
            label = 'Metal Colors',
            value = vehicleoptions_vehicleop_mod_metal,
            description = 'Metal Color'
        })
        local cp = vehicleoptions_vehicleop_mod_colormenu:AddCheckbox({
            icon = '',
            label = 'Primary Color',
            value = 'y'
        })
        local cs = vehicleoptions_vehicleop_mod_colormenu:AddCheckbox({
            icon = '',
            label = 'Secondary Color',
            value = 'n'
        })
        local pearlescentc = vehicleoptions_vehicleop_mod_colormenu:AddCheckbox({
            icon = '',
            label = 'Pearlescent Color',
            value = 'n'
        })
        local wheelc = vehicleoptions_vehicleop_mod_colormenu:AddCheckbox({
            icon = '',
            label = 'Wheel Color',
            value = 'n'
        })

        local dashc = vehicleoptions_vehicleop_mod_colormenu:AddCheckbox({
            icon = '',
            label = 'Dashboard Color',
            value = 'n'
        })
        local intc = vehicleoptions_vehicleop_mod_colormenu:AddCheckbox({
            icon = '',
            label = 'Interior Color',
            value = 'n'
        })

        local neonfront = vehicleoptions_vehicleop_mod_neon:AddCheckbox({
            icon = '',
            label = 'Enable Front Neon',
            value = 'n'
        })
        local neonback = vehicleoptions_vehicleop_mod_neon:AddCheckbox({
            icon = '',
            label = 'Enable Back Neon',
            value = 'n'
        })
        local neonleft = vehicleoptions_vehicleop_mod_neon:AddCheckbox({
            icon = '',
            label = 'Enable Left Neon',
            value = 'n'
        })
        local neonright = vehicleoptions_vehicleop_mod_neon:AddCheckbox({
            icon = '',
            label = 'Enable Right Neon',
            value = 'n'
        })

        local neoncolor = vehicleoptions_vehicleop_mod_neon:AddSlider({
            icon = '',
            label = 'Neon Color',
            value = 'demo',
            values = { {
                label = 'White',
                value = { 222, 222, 255 },
                description = 'Demo Item 1'
            }, {
                label = 'Blue',
                value = { 2, 21, 255 },
                description = 'Demo Item 2'
            }, {
                label = 'Electric Blue',
                value = { 3, 83, 255 },
                description = 'Demo Item 3'
            }, {
                label = 'Mint Green',
                value = { 0, 222, 140 },
                description = 'Demo Item 4'
            }, {
                label = 'Lime Green',
                value = { 94, 222, 1 },
                description = 'Demo Item 4'
            }, {
                label = 'Yellow',
                value = { 255, 255, 0 },
                description = 'Demo Item 4'
            }, {
                label = 'Golden Shower',
                value = { 255, 150, 0 },
                description = 'Demo Item 4'
            }, {
                label = 'Orange',
                value = { 255, 62, 0 },
                description = 'Demo Item 4'
            }, {
                label = 'Red',
                value = { 255, 1, 1 },
                description = 'Demo Item 4'
            }, {
                label = 'Pony Pink',
                value = { 255, 50, 100 },
                description = 'Demo Item 4'
            }, {
                label = 'Hot Pink',
                value = { 255, 5, 190 },
                description = 'Demo Item 4'
            }, {
                label = 'Purple',
                value = { 35, 1, 255 },
                description = 'Demo Item 4'
            }, {
                label = 'Blacklight',
                value = { 15, 3, 255 },
                description = 'Demo Item 4'
            } }
        })

        neoncolor:On('select', function(item, value)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            SetVehicleNeonLightsColour(veh, value[1], value[2], value[3])
        end)
        local modbuttons = {}
        neonfront:On('check', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            SetVehicleNeonLightEnabled(veh, 2, true)
        end)

        neonfront:On('uncheck', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            SetVehicleNeonLightEnabled(veh, 2, false)

        end)
        neonback:On('check', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            SetVehicleNeonLightEnabled(veh, 3, true)
        end)

        neonback:On('uncheck', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            SetVehicleNeonLightEnabled(veh, 3, false)

        end)
        neonleft:On('check', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            SetVehicleNeonLightEnabled(veh, 0, true)
        end)

        neonleft:On('uncheck', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            SetVehicleNeonLightEnabled(veh, 0, false)

        end)
        neonright:On('check', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            SetVehicleNeonLightEnabled(veh, 1, true)
        end)

        neonright:On('uncheck', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            SetVehicleNeonLightEnabled(veh, 1, false)

        end)
        cp:On('check', function(item)
            isPrimary = true
        end)

        cp:On('uncheck', function(item)
            isPrimary = false

        end)
        cs:On('check', function(item)
            isSecondary = true
        end)

        cs:On('uncheck', function(item)
            isSecondary = false
        end)
        pearlescentc:On('check', function(item)
            isPearlescent = true
        end)

        pearlescentc:On('uncheck', function(item)
            isPearlescent = false
        end)
        wheelc:On('check', function(item)
            isWheel = true
        end)

        wheelc:On('uncheck', function(item)
            isWheel = false
        end)
        dashc:On('check', function(item)
            isDash = true
        end)

        dashc:On('uncheck', function(item)
            isDash = false
        end)
        intc:On('check', function(item)
            isInt = true
        end)

        intc:On('uncheck', function(item)
            isInt = false
        end)



        local vehicleoptions_vehrelated = vehicleoptions_vehicleop:AddButton({

            icon = '🚙',
            label = 'Mod Menu',
            value = 'vehicleoptions_vehicleop',
            description = 'Vehicle Mod Menu',
        })
        vehicleoptions_vehrelated:On("select", function()
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            if veh ~= 0 then
                vehicleoptions_vehicleop_mod_tyresmoke:ClearItems()
                vehicleoptions_vehicleop_mod_colors:ClearItems()
                vehicleoptions_vehicleop_mod_matte:ClearItems()
                vehicleoptions_vehicleop_mod_metal:ClearItems()
                vehicleoptions_vehicleop_mod:ClearItems()
                vehicleoptions_vehicleop_mod:AddButton({
                    icon = '',
                    label = 'Vehicle Color',
                    value = vehicleoptions_vehicleop_mod_colormenu,
                    description = 'Vehicle Color Menu'
                })

                for k, v in pairs(vehmods) do
                    if v.modType and type(v.modType) == 'number' then
                        if v.modType == 17 then
                            modbuttons[k] = vehicleoptions_vehicleop_mod:AddCheckbox({
                                icon = '',
                                label = v.label,
                                value = 'n'
                            })
                            modbuttons[k]:On('check', function()
                                ToggleVehicleMod(veh, 18, true)
                            end)

                            modbuttons[k]:On('uncheck', function()
                                ToggleVehicleMod(veh, 18, false)

                            end)
                            goto continue
                        end
                        SetVehicleModKit(veh, 0)
                        local max = GetNumVehicleMods(veh, v.modType)
                        if max ~= 0 then
                            local tonymod = GetVehicleMod(veh, v.modType)
                            if tonymod == -1 then
                                tonymod = 0
                            else
                                tonymod = tonymod + 1
                            end
                            modbuttons[k] = vehicleoptions_vehicleop_mod:AddRange({
                                icon = '',
                                label = v.label,
                                min = 0,
                                max = max,
                                value = tonymod,
                                saveOnUpdate = true
                            })
                            modbuttons[k]:On('select', function(item, newValue, oldValue)
                                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                                if veh ~= 0 then
                                    if newValue == 0 then
                                        SetVehicleMod(veh, v.modType, max, false)
                                    else
                                        SetVehicleMod(veh, v.modType, newValue - 1, false)
                                    end
                                end
                            end)
                        end

                    elseif v.modType and v.modType == 'plateIndex' then

                        SetVehicleModKit(veh, 0)
                        local tonymod = GetVehicleNumberPlateTextIndex(veh)
                        modbuttons[k] = vehicleoptions_vehicleop_mod:AddRange({
                            icon = '',
                            label = v.label,
                            min = 0,
                            max = 4,
                            value = tonymod,
                            saveOnUpdate = true
                        })
                        modbuttons[k]:On('select', function(item, newValue, oldValue)
                            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                            if veh ~= 0 then
                                SetVehicleNumberPlateTextIndex(veh, newValue)
                            end
                        end)
                    elseif v.modType and v.modType == 'livery2' then

                        SetVehicleLivery(veh, 0)
                        local tonymod = GetVehicleLiveryCount(veh)
                        if tonymod ~= -1 then
                            modbuttons[k] = vehicleoptions_vehicleop_mod:AddRange({
                                icon = '',
                                label = v.label,
                                min = 1,
                                max = tonymod,
                                value = 0,
                                saveOnUpdate = true
                            })
                            modbuttons[k]:On('select', function(item, newValue, oldValue)
                                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                                if veh ~= 0 then
                                    SetVehicleLivery(veh, newValue)
                                end
                            end)
                        end
                    end
                    ::continue::
                end

                modbuttons['xenon'] = vehicleoptions_vehicleop_mod:AddRange({
                    icon = '',
                    label = "Headlights Color",
                    min = 0,
                    max = 12,
                    value = 0,
                    saveOnUpdate = true
                })
                modbuttons['xenon']:On('select', function(item, newValue, oldValue)
                    local veh = GetVehiclePedIsUsing(PlayerPedId())

                    if veh ~= 0 then
                        ToggleVehicleMod(veh, 22, true) -- toggle xenon
                        SetVehicleHeadlightsColour(veh, newValue)
                    end
                end)
                modbuttons['windowtint'] = vehicleoptions_vehicleop_mod:AddRange({
                    icon = '',
                    label = "Window Tint",
                    min = 0,
                    max = GetNumVehicleWindowTints(),
                    value = GetVehicleWindowTint(GetVehiclePedIsUsing(PlayerPedId())),
                    saveOnUpdate = true
                })
                modbuttons['windowtint']:On('select', function(item, newValue, oldValue)
                    local veh = GetVehiclePedIsUsing(PlayerPedId())

                    if veh ~= 0 then
                        SetVehicleWindowTint(veh, newValue)
                    end
                end)
                for k, v in ipairs(colors) do
                    vehicleoptions_vehicleop_mod_colors:AddButton({
                        icon = '',
                        label = v.name,
                        value = v.colorindex,
                        description = 'Apply ' .. v.name .. ' Color to vehicle',
                        select = function(i)
                            local ped = PlayerPedId()
                            veh = GetVehiclePedIsIn(ped, false)
                            if veh ~= 0 then
                                local vehcolorp, vehcolors = GetVehicleColours(veh)
                                local vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
                                if isPrimary then
                                    SetVehicleColours(veh, v.colorindex, vehcolors)
                                end
                                if isSecondary then
                                    vehcolorp, vehcolors = GetVehicleColours(veh)
                                    vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
                                    SetVehicleColours(veh, vehcolorp, v.colorindex)
                                end
                                if isWheel then
                                    vehcolorp, vehcolors = GetVehicleColours(veh)
                                    vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
                                    SetVehicleExtraColours(veh, vehcolorp, v.colorindex)
                                end
                                if isDash then
                                    SetVehicleDashboardColor(veh, v.colorindex)
                                end
                                if isInt then
                                    SetVehicleInteriorColor(veh, v.colorindex)
                                end
                                if isPearlescent then
                                    vehcolorp, vehcolors = GetVehicleColours(veh)
                                    vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
                                    SetVehicleExtraColours(veh, v.colorindex, vehcolorwheel)
                                end
                            end
                        end
                    })
                end
                for k, v in ipairs(tyrecolors) do
                    vehicleoptions_vehicleop_mod_tyresmoke:AddButton({
                        icon = '',
                        label = v.name,
                        value = 'tyr',
                        description = 'Apply ' .. v.name .. ' Color to Tyre Smoke',
                        select = function(i)
                            local ped = PlayerPedId()
                            veh = GetVehiclePedIsIn(ped, false)
                            if veh ~= 0 then
                                ToggleVehicleMod(veh, 20, true)
                                SetVehicleTyreSmokeColor(veh, v.r, v.g, v.b)
                            end
                        end
                    })
                end
                for k, v in ipairs(mattecolors) do
                    vehicleoptions_vehicleop_mod_matte:AddButton({
                        icon = '',
                        label = v.name,
                        value = v.colorindex,
                        description = 'Apply ' .. v.name .. ' Color to vehicle',
                        select = function(i)
                            local ped = PlayerPedId()
                            veh = GetVehiclePedIsIn(ped, false)
                            if veh ~= 0 then
                                local vehcolorp, vehcolors = GetVehicleColours(veh)
                                if isPrimary and not isSecondary then
                                    SetVehicleColours(veh, v.colorindex, vehcolors)
                                elseif isSecondary and not isPrimary then
                                    SetVehicleColours(veh, vehcolorp, v.colorindex)
                                else
                                    SetVehicleColours(veh, v.colorindex, v.colorindex)
                                end
                            end
                        end
                    })
                end
                for k, v in ipairs(metalcolors) do
                    vehicleoptions_vehicleop_mod_metal:AddButton({
                        icon = '',
                        label = v.name,
                        value = v.colorindex,
                        description = 'Apply ' .. v.name .. ' Color to vehicle',
                        select = function(i)
                            local ped = PlayerPedId()
                            veh = GetVehiclePedIsIn(ped, false)
                            if veh ~= 0 then
                                local vehcolorp, vehcolors = GetVehicleColours(veh)
                                if isPrimary and not isSecondary then
                                    SetVehicleColours(veh, v.colorindex, vehcolors)
                                elseif isSecondary and not isPrimary then
                                    SetVehicleColours(veh, vehcolorp, v.colorindex)
                                else
                                    SetVehicleColours(veh, v.colorindex, v.colorindex)
                                end
                            end
                        end
                    })
                end
                for extraID = 0, 20 do
                    if DoesExtraExist(veh, extraID) then
                        modbuttons['extra' .. extraID] = vehicleoptions_vehicleop_mod:AddCheckbox({
                            icon = '',
                            label = 'Extra ' .. extraID,
                            value = 'n'
                        })
                        modbuttons['extra' .. extraID]:On('check', function(item)
                            SetVehicleExtra(veh, extraID, 0)
                        end)

                        modbuttons['extra' .. extraID]:On('uncheck', function(item)
                            SetVehicleExtra(veh, extraID, 1)

                        end)
                    end
                end
                MenuV:OpenMenu(vehicleoptions_vehicleop_mod)
            else
                lib.notify({
                    title = 'TS Admin Menu',
                    description = 'You are not in any vehicle',
                    type = 'error'
                })
            end

        end)
    end
    ----------------------------------------------------------------------------
    -- VEHICLE FREEZE
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.Freeze') then

        local vehicleoptions_vehicleop_freeze = vehicleoptions_vehicleop:AddCheckbox({
            icon = '🧊',
            label = 'Freeze Vehicle',
            value = 'n'
        })

        vehicleoptions_vehicleop_freeze:On('check', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            FreezeEntityPosition(veh, true)
        end)

        vehicleoptions_vehicleop_freeze:On('uncheck', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            FreezeEntityPosition(veh, false)

        end)
    end
    ----------------------------------------------------------------------------
    -- TOGGLE ENGINE

    local vehicleoptions_vehicleop_engine = vehicleoptions_vehicleop:AddCheckbox({
        icon = '🚧',
        label = 'Toggle Engine',
        value = 'y'
    })

    vehicleoptions_vehicleop_engine:On('check', function(item)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        SetVehicleEngineOn(veh, true, true, true)
    end)

    vehicleoptions_vehicleop_engine:On('uncheck', function(item)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        SetVehicleEngineOn(veh, false, true, true)

    end)
    ----------------------------------------------------------------------------
    -- CHANGE NUMBERPLATE
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.NumberPlate') then

        local vehicleoptions_vehicleop_setplate = vehicleoptions_vehicleop:AddButton({
            icon = '⌨️',
            label = "Change Numberplate",
            description = "Change Number Plate Text",
            value = "numbertext",
            false,
            select = function(i)
                local input = lib.inputDialog('TS Admin Menu - Plate Changer', { "Plate" })

                if input then
                    local plate = input[1]
                    if plate == nil then
                        return
                    end
                    local ped = PlayerPedId()
                    local veh = GetVehiclePedIsIn(ped, false)
                    if veh ~= 0 then
                        SetVehicleNumberPlateText(veh, plate)
                    end
                end
            end
        })
    end
    ----------------------------------------------------------------------------
    -- DOOR MENU
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.DoorMenu') then

        local tonydoor = {}
        local vehicleoptions_vehicleop_toggledoor = vehicleoptions_vehicleop:AddSlider({
            icon = '🚗',
            label = 'Toggle Doors',
            value = 0,
            values = { {
                label = 'LFront Door',
                value = 0,
                description = ''
            }, {
                label = 'RFront Door',
                value = 1,
                description = ''
            }, {
                label = 'LRear Door',
                value = 2,
                description = ''
            }, {
                label = 'RRear Door',
                value = 3,
                description = ''
            }, {
                label = 'Hood',
                value = 4,
                description = ''
            }, {
                label = 'Trunk',
                value = 5,
                description = ''
            } }
        })
        vehicleoptions_vehicleop_toggledoor:On('select', function(item, value)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            if veh then
                if tonydoor[veh] and tonydoor[veh][value] then
                    SetVehicleDoorShut(veh, value, false)
                    tonydoor[veh][value] = false
                else
                    SetVehicleDoorOpen(veh, value, false)
                    tonydoor[veh] = { veh }
                    tonydoor[veh][value] = true
                end
            end
        end)
    end
    ----------------------------------------------------------------------------
    -- TORQUE AND ENGINE MULTIPLIER
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.MultiplierSpeed') then

        local engineenabled = false
        local torqueinterval = nil
        local engineinterval = nil
        local orgspeed = nil
        local torquespeed = 1.0
        local enginespeed = 1.0
        local vehicleoptions_vehicleop_torqueen = vehicleoptions_vehicleop:AddCheckbox({
            icon = '🚀',
            label = 'Enable Torque Multiplier',
            value = 'n'
        })

        local vehicleoptions_vehicleop_enginem = vehicleoptions_vehicleop:AddCheckbox({
            icon = '🚀',
            label = 'Enable Engine Multiplier',
            value = 'n'
        })

        local vehicleoptions_vehicleop_torque = vehicleoptions_vehicleop:AddRange({
            icon = '🚀',
            label = 'Torque Multiplier',
            min = 0,
            max = 10,
            value = 0,
            saveOnUpdate = true
        })

        vehicleoptions_vehicleop_torqueen:On('check', function(item)
            local ped = PlayerPedId()
            torqueinterval = SetInterval(function()
                local veh = GetVehiclePedIsIn(ped, false)
                if veh ~= 0 then
                    SetVehicleCheatPowerIncrease(veh, torquespeed)
                end
            end, 0)
        end)

        vehicleoptions_vehicleop_torqueen:On('uncheck', function(item)
            if torqueinterval then
                ClearInterval(torqueinterval)
                torqueinterval = nil
            end
        end)
        vehicleoptions_vehicleop_torque:On('change', function(item, newValue, oldValue)
            local speed = 1.0
            for i = 1, newValue, 1 do
                speed = (speed * 2.0)
            end
            torquespeed = speed
        end)
        local vehicleoptions_vehicleop_enginem_R = vehicleoptions_vehicleop:AddRange({
            icon = '🚀',
            label = 'Engine Multiplier',
            min = 0,
            max = 10,
            value = 0,
            saveOnUpdate = true
        })

        vehicleoptions_vehicleop_enginem:On('check', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            orgspeed = GetVehicleEstimatedMaxSpeed(veh)
            engineinterval = SetInterval(function()
                if enginespeed == 1.0 then
                    ModifyVehicleTopSpeed(veh, 1.0)
                else
                    ModifyVehicleTopSpeed(veh, orgspeed * enginespeed)
                end
            end, 0)

        end)

        vehicleoptions_vehicleop_enginem:On('uncheck', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            orgspeed = nil
            if engineinterval then
                ClearInterval(engineinterval)
                engineinterval = nil
            end
        end)
        vehicleoptions_vehicleop_enginem_R:On('change', function(item, newValue, oldValue)
            local ped = PlayerPedId()

            local veh = GetVehiclePedIsIn(ped, false)
            local speed = 1.0
            for i = 1, newValue, 1 do
                speed = (speed * 2.0)
            end
            enginespeed = speed
        end)
    end
    ----------------------------------------------------------------------------
    -- FLIP VEHICLE
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.FlipVehicle') then

        local vehicleoptions_vehicleop_flip = vehicleoptions_vehicleop:AddButton({
            icon = '🚗',
            label = 'Flip Vehicle',
            value = 'n',
            description = 'Set Vehicle Properly',
            select = function(i)
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                SetVehicleOnGroundProperly(veh)
            end
        })
    end
    ----------------------------------------------------------------------------
    -- DELETE VEHICLE
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.DeleteVehicle') then

        local vehicleoptions_vehicleop_delete = vehicleoptions_vehicleop:AddButton({
            icon = '🚗',
            label = 'Delete Vehicle',
            value = 'n',
            description = 'Delete Vehicle you are in',
            select = function(i)
                TriggerServerEvent('ts-adminmenu:server:DeleteVehicle')
            end
        })
    end
    ----------------------------------------------------------------------------
    -- INFINITE FUEL
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.InfiniteFuel') then

        local vehicleoptions_vehicleop_infinitefuel = vehicleoptions_vehicleop:AddCheckbox({
            icon = '⛽️',
            label = 'Infinite Fuel',
            value = 'n'
        })

        local fuelinterval = nil

        vehicleoptions_vehicleop_infinitefuel:On('check', function(item)
            local ped = PlayerPedId()
            fuelinterval = SetInterval(function()

                local veh = GetVehiclePedIsIn(ped, false)
                if veh ~= 0 then
                    if exports["LegacyFuel"]:GetFuel(veh) < 100 then
                        exports["LegacyFuel"]:SetFuel(veh, 100)
                    end
                end
            end, 5000)
        end)

        vehicleoptions_vehicleop_infinitefuel:On('uncheck', function(item)
            ClearInterval(fuelinterval)
        end)
    end
    ----------------------------------------------------------------------------
    -- NO BIKE HELMET
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.NoBikeHelmet') then

        local vehicleoptions_vehicleop_nobikehelm = vehicleoptions_vehicleop:AddCheckbox({
            icon = '🏍',
            label = 'No Bike Helmet',
            value = 'n'
        })

        local helmint = nil
        vehicleoptions_vehicleop_nobikehelm:On('check', function(item)
            local ped = PlayerPedId()
            helmint = SetInterval(function()
                if IsPedWearingHelmet(ped) then
                    RemovePedHelmet(ped, true)
                end
                SetPedHelmet(ped, false)
            end, 0)

        end)

        vehicleoptions_vehicleop_nobikehelm:On('uncheck', function(item)
            SetPedHelmet(ped, true)
            if helmint then
                ClearInterval(helmint)
            end
        end)
    end
    ----------------------------------------------------------------------------
    -- VEHICLE GODMODE
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.Godmode') then

        local vehicleoptions_vehicleop_godmode = vehicleoptions_vehicleop:AddCheckbox({
            icon = '💪',
            label = 'Godmode',
            value = 'n'
        })

        local vehgod = nil
        vehicleoptions_vehicleop_godmode:On('check', function(item)
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            SetEntityInvincible(veh, true)
            SetVehicleEngineCanDegrade(veh, false)
            SetVehicleCanBeVisiblyDamaged(veh, false)
            SetVehicleWheelsCanBreak(veh, false)
            SetVehicleHasStrongAxles(veh, true)
            SetVehicleTyresCanBurst(veh, false)
            SetDisableVehicleEngineFires(veh, true)
            vehgod = SetInterval(function()

                if IsVehicleDamaged(veh) then
                    RemoveDecalsFromVehicle(veh)
                    SetVehicleFixed(veh)
                    SetVehicleDeformationFixed(veh)
                end

                if IsVehicleEngineOnFire(veh) then
                    SetDisableVehicleEngineFires(veh, true)
                end

                if ESX.Math.Round(GetVehicleEngineHealth(veh), 1) < 1000 then
                    SetVehicleFixed(veh)
                    SetVehicleEngineHealth(veh, 4000)
                end
            end, 0)
        end)

        vehicleoptions_vehicleop_godmode:On('uncheck', function(item)
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            SetEntityInvincible(veh, false)
            SetVehicleEngineCanDegrade(veh, true)
            SetVehicleCanBeVisiblyDamaged(veh, true)
            SetVehicleWheelsCanBreak(veh, true)
            SetVehicleHasStrongAxles(veh, false)
            SetVehicleTyresCanBurst(veh, true)
            SetDisableVehicleEngineFires(veh, false)
            ClearInterval(vehgod)
        end)
    end
    ----------------------------------------------------------------------------
    -- REPAIR VEHICLE
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.Repair') then

        local vehicleoptions_vehicleop_repair = vehicleoptions_vehicleop:AddButton({
            icon = '🛠',
            label = "Repair Vehicle",
            description = "Repair Vehicle",
            value = "repairveh",
            false,
            select = function(i)
                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                if veh ~= 0 then
                    SetVehicleFixed(veh)
                    SetVehicleDeformationFixed(veh)
                end
            end
        })
    end
    ----------------------------------------------------------------------------
    -- WASH VEHICLE
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.Wash') then

        local vehicleoptions_vehicleop_wash = vehicleoptions_vehicleop:AddButton({
            icon = '🚿',
            label = "Wash Vehicle",
            description = "Wash Vehicle",
            value = "washveh",
            false,
            select = function(i)
                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                if veh ~= 0 then
                    SetVehicleDirtLevel(veh, 0.0)
                end
            end
        })
    end
    ----------------------------------------------------------------------------
    -- KEEP VEHICLE CLEAN
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.KeepClean') then

        local vehicleoptions_vehicleop_keepclean = vehicleoptions_vehicleop:AddConfirm({
            icon = '🚿',
            label = "Keep Vehicle Clean",
            value = "no"
        })

        local keepclean = nil
        vehicleoptions_vehicleop_keepclean:On('confirm', function(item)
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            keepclean = SetInterval(function()
                if GetVehicleDirtLevel(veh) > 0.0 then
                    SetVehicleDirtLevel(veh, 0.0)
                end
            end, 0)
        end)

        vehicleoptions_vehicleop_keepclean:On('deny', function(item)
            ClearInterval(keepclean)
        end)
    end
    ----------------------------------------------------------------------------
    -- SET DIRT
    if IsPlayerAllowed('TSAdmin.VehicleRelatedOptions.SetDirt') then

        local vehicleoptions_vehicleop_setdirt = vehicleoptions_vehicleop:AddRange({
            icon = '🦠',
            label = 'Set Vehicle Dirt',
            min = 0,
            max = 15,
            value = 0,
            saveOnUpdate = true
        })

        vehicleoptions_vehicleop_setdirt:On('select', function(item, newValue, oldValue)
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if veh ~= 0 then
                local dirt = ToFloat(newValue)
                SetVehicleDirtLevel(veh, dirt)
            end
        end)
    end

end
local LoadPlayerOptions = function()
    playeroptions:ClearItems()
    playeroptions2:ClearItems()
    playeroptions_custom:ClearItems()
    playeroptions_custom_customize:ClearItems()
    if IsPlayerAllowed('TSAdmin.PlayerOptions.GiveCar') then

        local playeroptions_reviveid = playeroptions:AddButton({
            icon = '🚗',
            label = "Give Car",
            description = "Give car you are currently in",
            value = "givec",
            false,
            select = function(i)
                local veh = GetVehiclePedIsIn(PlayerPedId())
                if veh ~= 0 then
                    local props = ESX.Game.GetVehicleProperties(veh)
                    local input = lib.inputDialog('TS Admin Menu - Give Car', { "Player ID" })

                    if input then
                        local pid = tonumber(input[1])
                        if pid == nil then
                            return
                        end
                        TriggerServerEvent('ts-adminmenu:server:giveCar', pid, props)
                    end
                end
            end
        })
    end

    if IsPlayerAllowed('TSAdmin.PlayerOptions.DeleteCar') then

        local playeroptions_reviveid = playeroptions:AddButton({
            icon = '🚗',
            label = "Delete Car",
            description = "Delete Car From Plate",
            value = "delcar",
            false,
            select = function(i)
                local input = lib.inputDialog('TS Admin Menu - Delete Car', { "Plate" })

                if input then
                    local plate = input[1]
                    if plate == nil then
                        return
                    end
                    TriggerServerEvent('ts-adminmenu:server:removeCar', plate)
                end
            end
        })
    end
    local playeroptions_playerrelated = playeroptions:AddButton({
        icon = '🧍‍♂️',
        label = 'Player Options',
        value = playeroptions2,
        description = 'Player Options'
    })
    local playeroptions_playerrelated = playeroptions:AddButton({
        icon = '🧍‍♂️',
        label = 'Ped Options',
        value = playeroptions_custom,
        description = 'Ped Options'
    })
    ----------------------------------------------------------------------------
    -- GODMODE
    if IsPlayerAllowed('TSAdmin.PlayerOptions.God') then

        local playeroptions_godmode = playeroptions2:AddCheckbox({
            icon = '💪',
            label = 'Godmode',
            value = 'n'
        })

        local god = nil
        playeroptions_godmode:On('check', function(item)
            local ped = PlayerPedId()
            local maxh = GetEntityMaxHealth(ped)
            SetPedCanRagdoll(ped, false)
            SetPedDiesWhenInjured(ped, false)
            SetPedDiesInstantlyInWater(ped, false)
            SetPedDiesInVehicle(ped, false)
            SetPedDiesInSinkingVehicle(ped, false)
            god = SetInterval(function()
                if CanPedRagdoll(PlayerPedId()) then
                    SetPedCanRagdoll(PlayerPedId(), false)
                end
                if GetEntityHealth(ped) < maxh then
                    SetEntityHealth(PlayerPedId(), maxh)
                end
            end, 0)
        end)

        playeroptions_godmode:On('uncheck', function(item)
            SetPedCanRagdoll(PlayerPedId(), true)
            SetPedDiesWhenInjured(PlayerPedId(), true)
            SetPedDiesInstantlyInWater(PlayerPedId(), true)
            SetPedDiesInVehicle(PlayerPedId(), true)
            SetPedDiesInSinkingVehicle(PlayerPedId(), true)
            ClearInterval(god)
        end)
    end

    ----------------------------------------------------------------------------
    -- INVISIBLE
    if IsPlayerAllowed('TSAdmin.PlayerOptions.Invisible') then

        local playeroptions_invisible = playeroptions2:AddCheckbox({
            icon = '👀',
            label = 'Invisible',
            value = 'n'
        })

        playeroptions_invisible:On('check', function(item)
            SetEntityVisible(PlayerPedId(), false, 0)
            SetPedAudioFootstepLoud(PlayerPedId(), false)
            SetPedAudioFootstepQuiet(PlayerPedId(), false)
        end)

        playeroptions_invisible:On('uncheck', function(item)
            SetEntityVisible(PlayerPedId(), true, 0)
            SetPedAudioFootstepLoud(PlayerPedId(), true)
            SetPedAudioFootstepQuiet(PlayerPedId(), true)
        end)
    end
    ----------------------------------------------------------------------------

    -- STAMINA
    if IsPlayerAllowed('TSAdmin.PlayerOptions.Stamina') then

        local playeroptions_unlimstamina = playeroptions2:AddCheckbox({
            icon = '🏃🏻‍♀️',
            label = 'Unlimited Stamina',
            value = 'n'
        })

        local stam = nil
        playeroptions_unlimstamina:On('check', function(item)
            stam = SetInterval(function()
                RestorePlayerStamina(PlayerId(), 1.0)
            end, 100)
        end)

        playeroptions_unlimstamina:On('uncheck', function(item)
            ClearInterval(stam)
        end)
    end

    ----------------------------------------------------------------------------

    -- FASTRUN
    if IsPlayerAllowed('TSAdmin.PlayerOptions.FastRun') then

        local playeroptions_fastrun = playeroptions2:AddCheckbox({
            icon = '🏃🏻',
            label = 'Fast Run',
            value = 'n'
        })

        playeroptions_fastrun:On('check', function(item)
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
        end)

        playeroptions_fastrun:On('uncheck', function(item)
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        end)
    end
    ----------------------------------------------------------------------------

    -- FASTSWIM
    if IsPlayerAllowed('TSAdmin.PlayerOptions.FastSwim') then

        local playeroptions_fastswin = playeroptions2:AddCheckbox({
            icon = '🏊🏻‍♂️',
            label = 'Fast Swim',
            value = 'n'
        })

        playeroptions_fastswin:On('check', function(item)
            SetSwimMultiplierForPlayer(PlayerId(), 1.49)
        end)

        playeroptions_fastswin:On('uncheck', function(item)
            SetSwimMultiplierForPlayer(PlayerId(), 1.0)
        end)
    end

    ----------------------------------------------------------------------------
    -- SUPER JUMP
    if IsPlayerAllowed('TSAdmin.PlayerOptions.SuperJump') then

        local playeroptions_superjump = playeroptions2:AddCheckbox({
            icon = '🏃‍♀️',
            label = 'Super Jump',
            value = 'n'
        })

        local superjump = nil
        playeroptions_superjump:On('check', function(item)
            superjump = SetInterval(function()
                SetSuperJumpThisFrame(PlayerId())
            end, 0)
        end)

        playeroptions_superjump:On('uncheck', function(item)
            ClearInterval(superjump)
        end)
    end
    ----------------------------------------------------------------------------

    -- NO RAGDOLL
    if IsPlayerAllowed('TSAdmin.PlayerOptions.NoRagdoll') then

        local playeroptions_noragdoll = playeroptions2:AddCheckbox({
            icon = '🏃‍♀️',
            label = 'No Ragdoll',
            value = 'n'
        })

        local ragdoll = nil
        playeroptions_noragdoll:On('check', function(item)
            ragdoll = SetInterval(function()
                SetPedCanRagdoll(PlayerPedId(), false)
                SetPedCanRagdollFromPlayerImpact(PlayerPedId(), false)
            end, 0)
        end)

        playeroptions_noragdoll:On('uncheck', function(item)
            SetPedCanRagdollFromPlayerImpact(PlayerPedId(), true)
            SetPedCanRagdoll(PlayerPedId(), true)
            ClearInterval(ragdoll)
        end)
    end

    ----------------------------------------------------------------------------
    -- NEVER WANTED
    if IsPlayerAllowed('TSAdmin.PlayerOptions.NeverWanted') then

        local playeroptions_neverwanted = playeroptions2:AddCheckbox({
            icon = '👮',
            label = 'Never Wanted',
            value = 'n'
        })

        local wanted = nil
        playeroptions_neverwanted:On('check', function(item)
            wanted = SetInterval(function()
                if GetPlayerWantedLevel(PlayerId()) > 0 then
                    ClearPlayerWantedLevel(PlayerId())
                end
            end, 100)
        end)

        playeroptions_neverwanted:On('uncheck', function(item)
            ClearInterval(wanted)
        end)
    end
    ----------------------------------------------------------------------------
    -- STAY IN VEHICLE
    if IsPlayerAllowed('TSAdmin.PlayerOptions.StayInVeh') then

        local playeroptions_stayinveh = playeroptions2:AddCheckbox({
            icon = '🚗',
            label = 'Stay In Vehicle',
            value = 'n'
        })

        local stayinveh = nil
        playeroptions_stayinveh:On('check', function(item)
            stayinveh = SetInterval(function()
                SetPedCanBeDraggedOut(PlayerPedId(), false)
            end, 0)
        end)

        playeroptions_stayinveh:On('uncheck', function(item)
            SetPedCanBeDraggedOut(PlayerPedId(), true)
            ClearInterval(stayinveh)
        end)
    end
    ----------------------------------------------------------------------------
    -- HEAL
    if IsPlayerAllowed('TSAdmin.PlayerOptions.Heal') then

        local playeroptions_heal = playeroptions2:AddButton({
            icon = '✨',
            label = "Heal Player",
            description = "Heal Player",
            value = "heal",
            false,
            select = function(i)
                TriggerServerEvent('ts-adminmenu:server:HealPlayer', GetPlayerServerId(PlayerId()))
            end
        })
    end
    ----------------------------------------------------------------------------
    -- REVIVE
    if IsPlayerAllowed('TSAdmin.PlayerOptions.Revive') then

        local playeroptions_revive = playeroptions2:AddButton({
            icon = '❤️',
            label = "Revive Player",
            description = "Revive Player",
            value = "rev",
            false,
            select = function(i)
                TriggerServerEvent('ts-adminmenu:server:RevivePlayer', GetPlayerServerId(PlayerId()))
            end
        })
    end
    ----------------------------------------------------------------------------
    -- ARMOR
    if IsPlayerAllowed('TSAdmin.PlayerOptions.Armor') then

        local playeroptions_armor = playeroptions2:AddSlider({
            icon = '💙',
            label = 'Set Armor',
            value = 'armor',
            values = { {
                label = 'Super Light Armor',
                value = 20,
                description = '20% Armor'
            }, {
                label = 'Light Armor',
                value = 40,
                description = '40% Armor'
            }, {
                label = 'Standard Armor',
                value = 60,
                description = '60% Armor'
            }, {
                label = 'Heavy Armor',
                value = 80,
                description = '80% Armor'
            }, {
                label = 'Super Heavy Armor',
                value = 100,
                description = '100% Armor'
            } }
        })

        playeroptions_armor:On('select', function(item, value)
            SetPedArmour(PlayerPedId(), value)
        end)
    end
    ----------------------------------------------------------------------------
    -- CLEAN CLOTHES
    if IsPlayerAllowed('TSAdmin.PlayerOptions.CleanClothes') then

        local playeroptions_cleanclothes = playeroptions2:AddButton({
            icon = '🚿',
            label = "Clean Player Clothes",
            description = "Clean player clothes",
            value = "clean",
            false,
            select = function(i)
                ClearPedBloodDamage(PlayerPedId())
            end
        })
    end
    ----------------------------------------------------------------------------
    -- WET CLOTHES
    if IsPlayerAllowed('TSAdmin.PlayerOptions.WetClothes') then

        local playeroptions_wetclothes = playeroptions2:AddButton({
            icon = '🧺',
            label = "Wet Player Clothes",
            description = "Wet player clothes",
            value = "wet",
            false,
            select = function(i)
                SetPedWetnessHeight(PlayerPedId(), 2.0)
            end
        })
    end
    ----------------------------------------------------------------------------
    -- DRY CLOTHES
    if IsPlayerAllowed('TSAdmin.PlayerOptions.DryClothes') then

        local playeroptions_dryclothes = playeroptions2:AddButton({
            icon = '🔅',
            label = "Dry Player Clothes",
            description = "Dry player clothes",
            value = "dry",
            false,
            select = function(i)
                ClearPedWetness(PlayerPedId())
            end
        })
    end
    ----------------------------------------------------------------------------
    -- COMMIT SUICIDE
    if IsPlayerAllowed('TSAdmin.PlayerOptions.Suicide') then

        local playeroptions_suicide = playeroptions2:AddButton({
            icon = '💀',
            label = "Commit Suicide",
            description = "Die",
            value = "diesui",
            false,
            select = function(i)
                SetEntityHealth(PlayerPedId(), 0.0)
            end
        })
    end

    ----------------------------------------------------------------------------
    -- FREEZE
    if IsPlayerAllowed('TSAdmin.PlayerOptions.Freeze') then

        local playeroptions_freeze = playeroptions2:AddConfirm({
            icon = '🧊',
            label = 'Freeze Player',
            value = 'no'
        })

        playeroptions_freeze:On('confirm', function(item)
            FreezeEntityPosition(PlayerPedId(), true)
        end)
        playeroptions_freeze:On('deny', function(item)
            FreezeEntityPosition(PlayerPedId(), false)
        end)
    end
    ----------------------------------------------------------------------------

    -- NOCLIP
    if IsPlayerAllowed('TSAdmin.PlayerOptions.Noclip') then

        local playeroptions_noclip = playeroptions2:AddCheckbox({
            icon = '🪂',
            label = 'Toggle Noclip',
            value = 'no'
        })

        playeroptions_noclip:On('check', function(item)
            SetNoClip(true)
        end)

        playeroptions_noclip:On('uncheck', function(item)
            SetNoClip(false)
        end)
    end
    ----------------------------------------------------------------------------

    -- CHANGE SKIN
    if IsPlayerAllowed('TSAdmin.PlayerOptions.ChangeSkin') then

        local playeroptions_custom_changeskin = playeroptions_custom:AddButton({
            icon = '👕',
            label = "Change Appearance",
            description = "Change Ped Appearance",
            value = "pedappear",
            false,
            select = function(i)
                TriggerEvent("esx_skin:openSaveableMenu")
                selectedPlayer = 0
                MenuV:CloseAll()
            end
        })
    end
    ----------------------------------------------------------------------------

    -- CHANGE SKIN2
    if IsPlayerAllowed('TSAdmin.PlayerOptions.ChangeSkin') then

        local drawableName = { "Head", "Beard", "Hair", "Torso", "Legs", "Hands", "Foot", "Other", "Accessory 1",
            "Accessory 2", "Decals", "Torso Parts" }
        local currentDrawable_head = GetPedDrawableVariation(PlayerPedId(), 0)
        local maxVariation_head = GetNumberOfPedDrawableVariations(PlayerPedId(), 0)
        local currentTexture_head = GetPedTextureVariation(PlayerPedId(), 0)
        local maxTexture_head = GetNumberOfPedTextureVariations(PlayerPedId(), 0, 0)
        local drawableList_head = playeroptions_custom_customize:AddRange({
            icon = '👕',
            label = "Head",
            min = 0,
            max = maxVariation_head,
            value = currentDrawable_head,
            saveOnUpdate = true
        })

        drawableList_head:On('change', function(item, newValue, oldValue)
            SetPedComponentVariation(PlayerPedId(), 0, newValue, 0)
        end)
        if maxTexture_head > 0 then
            local drawableList_head2 = playeroptions_custom_customize:AddRange({
                icon = '👕',
                label = "Head Texture",
                min = 0,
                max = maxTexture_head,
                value = currentTexture_head,
                saveOnUpdate = true
            })

            drawableList_head2:On('change', function(item, newValue, oldValue)
                SetPedComponentVariation(PlayerPedId(), 0, currentDrawable_head, newValue)
            end)
        end
        local currentDrawable_Beard = GetPedDrawableVariation(PlayerPedId(), 1)
        local maxVariation_Beard = GetNumberOfPedDrawableVariations(PlayerPedId(), 1)
        local currentTexture_Beard = GetPedTextureVariation(PlayerPedId(), 1)
        local maxTexture_Beard = GetNumberOfPedTextureVariations(PlayerPedId(), 1, 1)
        local drawableList_beard = playeroptions_custom_customize:AddRange({
            icon = '👕',
            label = "Beard",
            min = 0,
            max = maxVariation_Beard,
            value = currentDrawable_Beard,
            saveOnUpdate = true
        })

        drawableList_beard:On('change', function(item, newValue, oldValue)
            -- print(currentDrawable_Beard, newValue)
            SetPedComponentVariation(PlayerPedId(), 1, newValue, 0)
        end)
        if maxTexture_Beard > 0 then
            local drawableList_beard2 = playeroptions_custom_customize:AddRange({
                icon = '👕',
                label = "Beard Texture",
                min = 0,
                max = maxTexture_Beard,
                value = currentTexture_Beard,
                saveOnUpdate = true
            })

            drawableList_beard2:On('change', function(item, newValue, oldValue)
                SetPedComponentVariation(PlayerPedId(), 1, currentDrawable_Beard, newValue)
            end)
        end
        local currentDrawable_Hair = GetPedDrawableVariation(PlayerPedId(), 2)
        local maxVariation_Hair = GetNumberOfPedDrawableVariations(PlayerPedId(), 2)
        local currentTexture_Hair = GetPedTextureVariation(PlayerPedId(), 2)
        local maxTexture_Hair = GetNumberOfPedTextureVariations(PlayerPedId(), 2, 2)
        local drawableList_Hair = playeroptions_custom_customize:AddRange({
            icon = '👕',
            label = "Hair",
            min = 0,
            max = maxVariation_Hair,
            value = currentDrawable_Hair,
            saveOnUpdate = true
        })

        drawableList_Hair:On('change', function(item, newValue, oldValue)
            -- print("HAIR",currentDrawable_Hair, newValue)
            SetPedComponentVariation(PlayerPedId(), 2, newValue, 0)
        end)
        if maxTexture_Hair > 0 then
            local drawableList_Hair2 = playeroptions_custom_customize:AddRange({
                icon = '👕',
                label = "Hair Texture",
                min = 0,
                max = maxTexture_Hair,
                value = currentTexture_Hair,
                saveOnUpdate = true
            })

            drawableList_Hair2:On('change', function(item, newValue, oldValue)
                SetPedComponentVariation(PlayerPedId(), 2, currentDrawable_Hair, newValue)
            end)
        end
        local currentDrawable_Torso = GetPedDrawableVariation(PlayerPedId(), 3)
        local maxVariation_Torso = GetNumberOfPedDrawableVariations(PlayerPedId(), 3)
        local currentTexture_Torso = GetPedTextureVariation(PlayerPedId(), 3)
        local maxTexture_Torso = GetNumberOfPedTextureVariations(PlayerPedId(), 3, 3)
        local drawableList_Torso = playeroptions_custom_customize:AddRange({
            icon = '👕',
            label = "Torso",
            min = 0,
            max = maxVariation_Torso,
            value = currentDrawable_Torso,
            saveOnUpdate = true
        })

        drawableList_Torso:On('change', function(item, newValue, oldValue)
            -- print(currentDrawable_Torso, newValue)
            SetPedComponentVariation(PlayerPedId(), 3, newValue, 0)
        end)
        if maxTexture_Torso > 0 then
            local drawableList_Torsot = playeroptions_custom_customize:AddRange({
                icon = '👕',
                label = "Torso Texture",
                min = 0,
                max = maxTexture_Torso,
                value = currentTexture_Torso,
                saveOnUpdate = true
            })

            drawableList_Torsot:On('change', function(item, newValue, oldValue)
                SetPedComponentVariation(PlayerPedId(), 3, currentDrawable_Torso, newValue)
            end)
        end
        local currentDrawable_Legs = GetPedDrawableVariation(PlayerPedId(), 4)
        local maxVariation_Legs = GetNumberOfPedDrawableVariations(PlayerPedId(), 4)
        local currentTexture_Legs = GetPedTextureVariation(PlayerPedId(), 4)
        local maxTexture_Legs = GetNumberOfPedTextureVariations(PlayerPedId(), 4, 4)
        local drawableList_Legs = playeroptions_custom_customize:AddRange({
            icon = '👕',
            label = "Legs",
            min = 0,
            max = maxVariation_Legs,
            value = currentDrawable_Legs,
            saveOnUpdate = true
        })

        drawableList_Legs:On('change', function(item, newValue, oldValue)
            -- print(currentDrawable_Legs, newValue)
            SetPedComponentVariation(PlayerPedId(), 4, newValue, 0)
        end)
        if maxTexture_Legs > 0 then
            local drawableList_Legs2 = playeroptions_custom_customize:AddRange({
                icon = '👕',
                label = "Legs Texture",
                min = 0,
                max = maxTexture_Legs,
                value = currentTexture_Legs,
                saveOnUpdate = true
            })

            drawableList_Legs2:On('change', function(item, newValue, oldValue)
                SetPedComponentVariation(PlayerPedId(), 4, currentDrawable_Legs, newValue)
            end)
        end
        local currentDrawable_Hands = GetPedDrawableVariation(PlayerPedId(), 5)
        local maxVariation_Hands = GetNumberOfPedDrawableVariations(PlayerPedId(), 5)
        local currentTexture_Hands = GetPedTextureVariation(PlayerPedId(), 5)
        local maxTexture_Hands = GetNumberOfPedTextureVariations(PlayerPedId(), 5, 5)
        local drawableList_Hands = playeroptions_custom_customize:AddRange({
            icon = '👕',
            label = "Hands",
            min = 0,
            max = maxVariation_Hands,
            value = currentDrawable_Hands,
            saveOnUpdate = true
        })

        drawableList_Hands:On('change', function(item, newValue, oldValue)
            -- print(currentDrawable_Hands, newValue)
            SetPedComponentVariation(PlayerPedId(), 5, newValue, 0)
        end)
        if maxTexture_Hands > 0 then
            local drawableList_Hands2 = playeroptions_custom_customize:AddRange({
                icon = '👕',
                label = "Hands Texture",
                min = 0,
                max = maxTexture_Hands,
                value = currentTexture_Hands,
                saveOnUpdate = true
            })

            drawableList_Hands2:On('change', function(item, newValue, oldValue)
                SetPedComponentVariation(PlayerPedId(), 5, currentDrawable_Hands, newValue)
            end)
        end
        local currentDrawable_Foot = GetPedDrawableVariation(PlayerPedId(), 6)
        local maxVariation_Foot = GetNumberOfPedDrawableVariations(PlayerPedId(), 6)
        local currentTexture_Foot = GetPedTextureVariation(PlayerPedId(), 6)
        local maxTexture_Foot = GetNumberOfPedTextureVariations(PlayerPedId(), 6, 6)
        local drawableList_Foot = playeroptions_custom_customize:AddRange({
            icon = '👕',
            label = "Foot",
            min = 0,
            max = maxVariation_Foot,
            value = currentDrawable_Foot,
            saveOnUpdate = true
        })

        drawableList_Foot:On('change', function(item, newValue, oldValue)
            -- print(currentDrawable_Foot, newValue)
            SetPedComponentVariation(PlayerPedId(), 6, newValue, 0)
        end)
        if maxTexture_Foot > 0 then
            local drawableList_Foot2 = playeroptions_custom_customize:AddRange({
                icon = '👕',
                label = "Foot Texture",
                min = 0,
                max = maxTexture_Foot,
                value = currentTexture_Foot,
                saveOnUpdate = true
            })

            drawableList_Foot2:On('change', function(item, newValue, oldValue)
                SetPedComponentVariation(PlayerPedId(), 6, currentDrawable_Foot, newValue)
            end)
        end
        local currentDrawable_Misc = GetPedDrawableVariation(PlayerPedId(), 7)
        local maxVariation_Misc = GetNumberOfPedDrawableVariations(PlayerPedId(), 7)
        local currentTexture_Misc = GetPedTextureVariation(PlayerPedId(), 7)
        local maxTexture_Misc = GetNumberOfPedTextureVariations(PlayerPedId(), 7, 7)
        local drawableList_Misc = playeroptions_custom_customize:AddRange({
            icon = '👕',
            label = "Misc",
            min = 0,
            max = maxVariation_Misc,
            value = currentDrawable_Misc,
            saveOnUpdate = true
        })

        drawableList_Misc:On('change', function(item, newValue, oldValue)
            -- print(currentDrawable_head, newValue)
            SetPedComponentVariation(PlayerPedId(), 7, newValue, 0)
        end)
        if maxTexture_Misc > 0 then
            local drawableList_Misc2 = playeroptions_custom_customize:AddRange({
                icon = '👕',
                label = "Misc Texture",
                min = 0,
                max = maxTexture_Misc,
                value = currentTexture_Misc,
                saveOnUpdate = true
            })

            drawableList_Misc2:On('change', function(item, newValue, oldValue)
                SetPedComponentVariation(PlayerPedId(), 7, currentDrawable_Misc, newValue)
            end)
        end
        local currentDrawable_Accs1 = GetPedDrawableVariation(PlayerPedId(), 8)
        local maxVariation_Accs1 = GetNumberOfPedDrawableVariations(PlayerPedId(), 8)
        local currentTexture_Accs1 = GetPedTextureVariation(PlayerPedId(), 8)
        local maxTexture_Accs1 = GetNumberOfPedTextureVariations(PlayerPedId(), 8, 8)
        local drawableList_Accs1 = playeroptions_custom_customize:AddRange({
            icon = '👕',
            label = "Accessory 1",
            min = 0,
            max = maxVariation_Accs1,
            value = currentDrawable_Accs1,
            saveOnUpdate = true
        })

        drawableList_Accs1:On('change', function(item, newValue, oldValue)
            -- print(currentDrawable_Accs1, newValue)
            SetPedComponentVariation(PlayerPedId(), 8, newValue, 0)
        end)
        if maxTexture_Accs1 > 0 then
            local drawableList_Accs1t = playeroptions_custom_customize:AddRange({
                icon = '👕',
                label = "Accessory 1 Texture",
                min = 0,
                max = maxTexture_Accs1,
                value = currentTexture_Accs1,
                saveOnUpdate = true
            })

            drawableList_Accs1t:On('change', function(item, newValue, oldValue)
                SetPedComponentVariation(PlayerPedId(), 8, currentDrawable_Accs1, newValue)
            end)
        end
        local currentDrawable_Accs2 = GetPedDrawableVariation(PlayerPedId(), 9)
        local maxVariation_Accs2 = GetNumberOfPedDrawableVariations(PlayerPedId(), 9)
        local currentTexture_Accs2 = GetPedTextureVariation(PlayerPedId(), 9)
        local maxTexture_Accs2 = GetNumberOfPedTextureVariations(PlayerPedId(), 9, 9)
        local drawableList_Accs2 = playeroptions_custom_customize:AddRange({
            icon = '👕',
            label = "Accessory 2",
            min = 0,
            max = maxVariation_Accs2,
            value = currentDrawable_Accs2,
            saveOnUpdate = true
        })

        drawableList_Accs2:On('change', function(item, newValue, oldValue)
            -- print(currentDrawable_Accs2, newValue)
            SetPedComponentVariation(PlayerPedId(), 9, newValue, 0)
        end)
        if maxTexture_Accs2 > 0 then
            local drawableList_Accs2t = playeroptions_custom_customize:AddRange({
                icon = '👕',
                label = "Accessory 2 Texture",
                min = 0,
                max = maxTexture_Accs2,
                value = currentTexture_Accs2,
                saveOnUpdate = true
            })

            drawableList_Accs2t:On('change', function(item, newValue, oldValue)
                SetPedComponentVariation(PlayerPedId(), 9, currentDrawable_Accs2, newValue)
            end)
        end
        local currentDrawable_Decals = GetPedDrawableVariation(PlayerPedId(), 10)
        local maxVariation_Decals = GetNumberOfPedDrawableVariations(PlayerPedId(), 10)
        local currentTexture_Decals = GetPedTextureVariation(PlayerPedId(), 10)
        local maxTexture_Decals = GetNumberOfPedTextureVariations(PlayerPedId(), 10, 10)
        local drawableList_Decals = playeroptions_custom_customize:AddRange({
            icon = '👕',
            label = "Decals",
            min = 0,
            max = maxVariation_Decals,
            value = currentDrawable_Decals,
            saveOnUpdate = true
        })

        drawableList_Decals:On('change', function(item, newValue, oldValue)
            -- print(currentDrawable_Decals, newValue)
            SetPedComponentVariation(PlayerPedId(), 10, newValue, 0)
        end)
        if maxTexture_Decals > 0 then
            local drawableList_Decals2 = playeroptions_custom_customize:AddRange({
                icon = '👕',
                label = "Decals Texture",
                min = 0,
                max = maxTexture_Decals,
                value = currentTexture_Decals,
                saveOnUpdate = true
            })

            drawableList_Decals2:On('change', function(item, newValue, oldValue)
                SetPedComponentVariation(PlayerPedId(), 10, currentDrawable_Decals, newValue)
            end)
        end
        local currentDrawable_Torso2 = GetPedDrawableVariation(PlayerPedId(), 11)
        local maxVariation_Torso2 = GetNumberOfPedDrawableVariations(PlayerPedId(), 11)
        local currentTexture_Torso2 = GetPedTextureVariation(PlayerPedId(), 10)
        local maxTexture_Torso2 = GetNumberOfPedTextureVariations(PlayerPedId(), 11, 11)
        local drawableList_Torso2 = playeroptions_custom_customize:AddRange({
            icon = '👕',
            label = "Torso 2",
            min = 0,
            max = maxVariation_Torso2,
            value = currentDrawable_Torso2,
            saveOnUpdate = true
        })

        drawableList_Torso2:On('change', function(item, newValue, oldValue)
            -- print(currentDrawable_Torso2, newValue)
            SetPedComponentVariation(PlayerPedId(), 11, newValue, 0)
        end)
        if maxTexture_Torso2 > 0 then
            local drawableList_Torso2t = playeroptions_custom_customize:AddRange({
                icon = '👕',
                label = "Torso 2 Texture",
                min = 0,
                max = maxTexture_Torso2,
                value = currentTexture_Torso2,
                saveOnUpdate = true
            })

            drawableList_Torso2t:On('change', function(item, newValue, oldValue)
                SetPedComponentVariation(PlayerPedId(), 11, currentDrawable_Torso2, newValue)
            end)
        end

        local playeroptions_custom_changeskin = playeroptions_custom:AddButton({
            icon = '👕',
            label = "Custom Appearance",
            description = "Change Ped Appearance",
            value = playeroptions_custom_customize,
            false
        })
    end

    ----------------------------------------------------------------------------
    -- CHANGE PED

    if IsPlayerAllowed('TSAdmin.PlayerOptions.ChangePed') then

        local playeroptions_custom_changeped = playeroptions_custom:AddButton({
            icon = '👦🏻',
            label = "Change To Addon Ped",
            description = "Change Ped Model",
            value = "pedaddon",
            false,
            select = function(i)
                TriggerEvent("ts-adminmenu:client:ChangePed")
                selectedPlayer = 0
                MenuV:CloseAll()
            end
        })
    end
end

local LoadMiscSettings = function()
    miscsettings:ClearItems()
    ----------------------------------------------------------------------------
    -- TELEPORT OPTIONS
    if IsPlayerAllowed('TSAdmin.MiscSettings.Teleport') then

        local misc_teleport = miscsettings:AddButton({
            icon = '🕹',
            label = 'Teleport To Marker',
            value = 'tpm',
            description = 'Teleport to Waypoint',
            select = function(i)
                local WaypointHandle = GetFirstBlipInfoId(8)
                if DoesBlipExist(WaypointHandle) then
                    local playerPed = PlayerPedId()
                    local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
                    for height = 1, 1000 do
                        SetPedCoordsKeepVehicle(playerPed, waypointCoords.x, waypointCoords.y, height + 0.0)
                        local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y,
                            height + 0.0)
                        if foundGround then
                            SetPedCoordsKeepVehicle(playerPed, waypointCoords.x, waypointCoords.y, height + 0.0)
                            break
                        end

                        Wait(5)
                    end
                    lib.notify({
                        title = 'TS Admin Menu',
                        description = 'Successfully Teleported',
                        type = 'success'
                    })
                else
                    lib.notify({
                        title = 'TS Admin Menu',
                        description = 'No Waypoint Set',
                        type = 'error'
                    })
                end
            end
        })

        local misc_teleportcoords = miscsettings:AddButton({
            icon = '🕹',
            label = 'Teleport To Coords',
            value = 'tpm',
            description = 'Teleport to Coords',
            select = function(i)
                local input = lib.inputDialog('Teleport To Coords', { 'X Coordinate', 'Y Coordinate', 'Z Coordinate' })
                if input then
                    local x = tonumber(input[1])
                    local y = tonumber(input[2])
                    local z = tonumber(input[2])
                    if x == nil or y == nil or z == nil then
                        return
                    end
                    SetPedCoordsKeepVehicle(PlayerPedId(), vec3(x, y, z))
                end
            end
        })
    end
    ----------------------------------------------------------------------------
    -- SHOW COORDS
    if IsPlayerAllowed('TSAdmin.MiscSettings.ShowCoords') then

        local DrawGenericText = function(text)
            SetTextColour(186, 186, 186, 255)
            SetTextFont(7)
            SetTextScale(0.378, 0.378)
            SetTextWrap(0.0, 1.0)
            SetTextCentre(false)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 205)
            SetTextEntry("STRING")
            AddTextComponentString(text)
            DrawText(0.40, 0.00)
        end
        local FormatCoord = function(coord)
            if coord == nil then
                return "unknown"
            end

            return tonumber(string.format("%.2f", coord))
        end

        local misc_showcoords = miscsettings:AddCheckbox({
            icon = '📲',
            label = 'Show Coords',
            value = 'n'
        })
        local showcoordsint = nil
        misc_showcoords:On('check', function(item)
            showcoordsint = SetInterval(function()
                local playerPed = PlayerPedId()
                local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
                local playerH = GetEntityHeading(playerPed)

                DrawGenericText(("~g~X~w~: %s ~g~Y~w~: %s ~g~Z~w~: %s ~g~H~w~: %s"):format(FormatCoord(playerX),
                    FormatCoord(playerY), FormatCoord(playerZ), FormatCoord(playerH)))
            end, 5)
        end)

        misc_showcoords:On('uncheck', function(item)
            if showcoordsint then
                ClearInterval(showcoordsint)
                showcoordsint = nil
            end
        end)
    end
    ----------------------------------------------------------------------------
    -- CLEAR AREA
    if IsPlayerAllowed('TSAdmin.MiscSettings.ClearArea') then

        local misc_cleararea = miscsettings:AddButton({
            icon = '🕹',
            label = 'Clear Area',
            value = 'clr',
            description = 'TClear Area',
            select = function(i)
                local coords = GetEntityCoords(PlayerPedId())
                ClearAreaLeaveVehicleHealth(coords.x, coords.y, coords.z, 100.0, false, false, false, false)
            end
        })
    end
    ----------------------------------------------------------------------------
    -- RELOG
    if IsPlayerAllowed('TSAdmin.MiscSettings.Relog') then

        local misc_cleararea = miscsettings:AddButton({
            icon = '🕹',
            label = 'Relog',
            value = 'clr',
            description = 'Relog from Server',
            select = function(i)
                MenuV:CloseAll()
                selectedPlayer = 0
                TriggerServerEvent('esx_multicharacter:relog')
            end
        })
    end
    ----------------------------------------------------------------------------
    -- PROP SPAWNER
    if IsPlayerAllowed('TSAdmin.MiscSettings.PropSpawn') then

        local misc_cleararea = miscsettings:AddButton({
            icon = '👷',
            label = 'Prop Spawner',
            value = 'prp',
            description = 'Prop Spawner',
            select = function(i)
                MenuV:CloseAll()
                selectedPlayer = 0
                TriggerServerEvent('ts-adminmenu:server:propspawner')
            end
        })
    end
    ----------------------------------------------------------------------------
    -- ANNOUNCEMENT
    if IsPlayerAllowed('TSAdmin.MiscSettings.Announce') then

        local misc_cleararea = miscsettings:AddButton({
            icon = '📣',
            label = 'Server Announcement',
            value = 'srvannc',
            description = 'Announcement',
            select = function(i)
                local input = lib.inputDialog('TS Announcer', { "Text" })

                if input then
                    local txt = input[1]
                    if txt == nil then
                        return
                    end
                    TriggerServerEvent('ts-adminmenu:server:Announce', txt)
                end
            end
        })
        RegisterCommand('ann', function()
            local input = lib.inputDialog('TS Announcer', { "Text" })

            if input then
                local txt = input[1]
                if txt == nil then
                    return
                end
                TriggerServerEvent('ts-adminmenu:server:Announce', txt)
            end
        end)
    end
    ----------------------------------------------------------------------------
    -- STAFFCHAT
    if IsPlayerAllowed('TSAdmin.MiscSettings.StaffChat') then

        local misc_staffchat = miscsettings:AddButton({
            icon = '📣',
            label = 'Send Staff Chat',
            value = 'staff',
            description = 'Staff Chat',
            select = function(i)
                local input = lib.inputDialog('TS Staff Chat', { "Text" })

                if input then
                    local txt = input[1]
                    if txt == nil then
                        return
                    end
                    TriggerServerEvent('ts-adminmenu:server:SendStaff', txt)
                end
            end
        })
    end
    ----------------------------------------------------------------------------
    -- THERMAL VISION
    if IsPlayerAllowed('TSAdmin.MiscSettings.ThermalVision') then

        local misc_thermalvision = miscsettings:AddCheckbox({
            icon = '🔍',
            label = 'Thermal Vision',
            value = 'n'
        })
        misc_thermalvision:On('check', function(item)
            SetSeethrough(true)
        end)

        misc_thermalvision:On('uncheck', function(item)
            SetSeethrough(false)
        end)
    end

    ----------------------------------------------------------------------------
    -- JOIN QUIT
    local shownotifjoin = false
    if IsPlayerAllowed('TSAdmin.MiscSettings.JoinQNotif') then


        local misc_joiunq = miscsettings:AddCheckbox({
            icon = '🔍',
            label = 'Join/Quit Notifications',
            value = 'n'
        })
        misc_joiunq:On('check', function(item)
            shownotifjoin = true
        end)

        misc_joiunq:On('uncheck', function(item)
            shownotifjoin = false
        end)
        RegisterNetEvent('ts-adminmenu:client:JoinQ', function(notif)
            if shownotifjoin then
                TSNotif(notif)
            end
        end)
    end

    ----------------------------------------------------------------------------
    -- KILL
    local ClientFunc = {}

    ClientFunc.IsMelee = function(Weapon)
        local Weapons = { 'WEAPON_UNARMED', 'WEAPON_CROWBAR', 'WEAPON_BAT', 'WEAPON_GOLFCLUB', 'WEAPON_HAMMER',
            'WEAPON_NIGHTSTICK' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.IsTorch = function(Weapon)
        local Weapons = { 'WEAPON_MOLOTOV' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.IsKnife = function(Weapon)
        local Weapons = { 'WEAPON_DAGGER', 'WEAPON_KNIFE', 'WEAPON_SWITCHBLADE', 'WEAPON_HATCHET', 'WEAPON_BOTTLE' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.IsPistol = function(Weapon)
        local Weapons = { 'WEAPON_SNSPISTOL', 'WEAPON_HEAVYPISTOL', 'WEAPON_VINTAGEPISTOL', 'WEAPON_PISTOL',
            'WEAPON_APPISTOL', 'WEAPON_COMBATPISTOL' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.IsSub = function(Weapon)
        local Weapons = { 'WEAPON_MICROSMG', 'WEAPON_SMG' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.IsRifle = function(Weapon)
        local Weapons = { 'WEAPON_CARBINERIFLE', 'WEAPON_MUSKET', 'WEAPON_ADVANCEDRIFLE', 'WEAPON_ASSAULTRIFLE',
            'WEAPON_SPECIALCARBINE', 'WEAPON_COMPACTRIFLE', 'WEAPON_BULLPUPRIFLE' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.IsLight = function(Weapon)
        local Weapons = { 'WEAPON_MG', 'WEAPON_COMBATMG' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.IsShotgun = function(Weapon)
        local Weapons = { 'WEAPON_BULLPUPSHOTGUN', 'WEAPON_ASSAULTSHOTGUN', 'WEAPON_DBSHOTGUN', 'WEAPON_PUMPSHOTGUN',
            'WEAPON_HEAVYSHOTGUN', 'WEAPON_SAWNOFFSHOTGUN' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.IsSniper = function(Weapon)
        local Weapons = { 'WEAPON_MARKSMANRIFLE', 'WEAPON_SNIPERRIFLE', 'WEAPON_HEAVYSNIPER', 'WEAPON_ASSAULTSNIPER',
            'WEAPON_REMOTESNIPER' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.IsHeavy = function(Weapon)
        local Weapons = { 'WEAPON_GRENADELAUNCHER', 'WEAPON_RPG', 'WEAPON_FLAREGUN', 'WEAPON_HOMINGLAUNCHER',
            'WEAPON_FIREWORK', 'VEHICLE_WEAPON_TANK' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.IsMinigun = function(Weapon)
        local Weapons = { 'WEAPON_MINIGUN' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.IsBomb = function(Weapon)
        local Weapons =
        { 'WEAPON_GRENADE', 'WEAPON_PROXMINE', 'WEAPON_EXPLOSION', 'WEAPON_STICKYBOMB', 'WEAPON_PIPEBOMB' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.IsVeh = function(Weapon)
        local Weapons = { 'VEHICLE_WEAPON_ROTORS' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.IsVK = function(Weapon)
        local Weapons = { 'WEAPON_RUN_OVER_BY_CAR', 'WEAPON_RAMMED_BY_CAR' }
        for i, CurrentWeapon in ipairs(Weapons) do
            if GetHashKey(CurrentWeapon) == Weapon then
                return true
            end
        end
        return false
    end

    ClientFunc.hashToWeapon = function(hash)
        return weapons[hash]
    end

    ClientFunc.has_value = function(tab, val)
        for i, v in ipairs(tab) do
            if (v == val) then
                return true
            end
        end
        return false
    end

    RegisterNetEvent('esx:onPlayerDeath', function(data)
        local info = data
        local killed = info.killedByPlayer
        local DeathCauseHash = info.deathCause
        local DeathReason
        info.victim = source
        if not killed then
            if ClientFunc.IsMelee(DeathCauseHash) then
                DeathReason = "Murdered"
            elseif ClientFunc.IsTorch(DeathCauseHash) then
                DeathReason = "Torched"
            elseif ClientFunc.IsKnife(DeathCauseHash) then
                DeathReason = "Knifed"
            elseif ClientFunc.IsPistol(DeathCauseHash) then
                DeathReason = "Pistoled"
            elseif ClientFunc.IsSub(DeathCauseHash) then
                DeathReason = "Riddled"
            elseif ClientFunc.IsRifle(DeathCauseHash) then
                DeathReason = "Rifled"
            elseif ClientFunc.IsLight(DeathCauseHash) then
                DeathReason = "MachineGunned"
            elseif ClientFunc.IsShotgun(DeathCauseHash) then
                DeathReason = "Pulverized"
            elseif ClientFunc.IsSniper(DeathCauseHash) then
                DeathReason = "Sniped"
            elseif ClientFunc.IsHeavy(DeathCauseHash) then
                DeathReason = "Obliterated"
            elseif ClientFunc.IsMinigun(DeathCauseHash) then
                DeathReason = "Shredded"
            elseif ClientFunc.IsBomb(DeathCauseHash) then
                DeathReason = "Bombed"
            elseif ClientFunc.IsVeh(DeathCauseHash) then
                DeathReason = "MowedOver"
            elseif ClientFunc.IsVK(DeathCauseHash) then
                DeathReason = "Flattened"
            else
                DeathReason = "Killed"
            end
            TriggerServerEvent('ts-adminmenu:server:playerDied', {
                player_id = GetPlayerServerId(PlayerId()),
                player_2_id = nil,
                death_reason = DeathReason
            })
        else
            if ClientFunc.IsMelee(DeathCauseHash) then
                DeathReason = "Murdered"
            elseif ClientFunc.IsTorch(DeathCauseHash) then
                DeathReason = "Torched"
            elseif ClientFunc.IsKnife(DeathCauseHash) then
                DeathReason = "Knifed"
            elseif ClientFunc.IsPistol(DeathCauseHash) then
                DeathReason = "Pistoled"
            elseif ClientFunc.IsSub(DeathCauseHash) then
                DeathReason = "Riddled"
            elseif ClientFunc.IsRifle(DeathCauseHash) then
                DeathReason = "Rifled"
            elseif ClientFunc.IsLight(DeathCauseHash) then
                DeathReason = "MachineGunned"
            elseif ClientFunc.IsShotgun(DeathCauseHash) then
                DeathReason = "Pulverized"
            elseif ClientFunc.IsSniper(DeathCauseHash) then
                DeathReason = "Sniped"
            elseif ClientFunc.IsHeavy(DeathCauseHash) then
                DeathReason = "Obliterated"
            elseif ClientFunc.IsMinigun(DeathCauseHash) then
                DeathReason = "Shredded"
            elseif ClientFunc.IsBomb(DeathCauseHash) then
                DeathReason = "Bombed"
            elseif ClientFunc.IsVeh(DeathCauseHash) then
                DeathReason = "MowedOver"
            elseif ClientFunc.IsVK(DeathCauseHash) then
                DeathReason = "Flattened"
            else
                DeathReason = "Killed"
            end
            TriggerServerEvent('ts-adminmenu:server:playerDied', {
                player_id = GetPlayerServerId(PlayerId()),
                player_2_id = info.killerServerId,
                death_reason = DeathReason
            })
        end
    end)

    local shownotifkill = false

    if IsPlayerAllowed('TSAdmin.MiscSettings.Kill') then

        local misc_kill = miscsettings:AddCheckbox({
            icon = '🔍',
            label = 'Kill Notifications',
            value = 'n'
        })
        misc_kill:On('check', function(item)
            shownotifkill = true
        end)

        misc_kill:On('uncheck', function(item)
            shownotifkill = false
        end)
        RegisterNetEvent('ts-adminmenu:client:killnotif', function(notif)
            if shownotifkill then
                TSNotif(notif)
            end
        end)
    end
    ----------------------------------------------------------------------------
    -- NIGHT VISION
    if IsPlayerAllowed('TSAdmin.MiscSettings.NightVision') then

        local misc_nightvision = miscsettings:AddCheckbox({
            icon = '🔍',
            label = 'Night Vision',
            value = 'n'
        })
        misc_nightvision:On('check', function(item)
            SetNightvision(true)
        end)

        misc_nightvision:On('uncheck', function(item)
            SetNightvision(false)
        end)
    end
    ----------------------------------------------------------------------------
    -- PLAYER BLIPS

    if IsPlayerAllowed('TSAdmin.MiscSettings.PlayerBlips') then

        local plyblips = {}
        local plyblipson = false
        local plyblipsint = SetInterval(function()

            if plyblipson then
                local ply = GetActivePlayers()
                for k, v in pairs(ply) do
                    local sid = GetPlayerServerId(v)
                    local coords = GetEntityCoords(GetPlayerPed(v))
                    local dist = #(coords - GetEntityCoords(PlayerPedId()))
                    if dist < 250 then

                        if v ~= PlayerId() then
                            if plyblips[sid] then
                                RemoveBlip(plyblips[sid])
                                plyblips[sid] = nil
                            end
                            local bliptony = AddBlipForEntity(GetPlayerPed(v))
                            SetBlipSprite(bliptony, 1)
                            SetBlipNameToPlayerName(bliptony, v)
                            SetBlipScale(bliptony, 1.0)
                            SetBlipAlpha(bliptony, 255)
                            SetBlipColour(bliptony, 0)
                            SetBlipCategory(bliptony, 7)
                            plyblips[sid] = bliptony
                        end

                    else
                        if plyblips[sid] then
                            RemoveBlip(plyblips[sid])
                            plyblips[sid] = nil
                        end
                    end
                end
            end
        end, 5000)

        local misc_playerblips = miscsettings:AddCheckbox({
            icon = '🔍',
            label = 'Player Blips',
            value = 'n'
        })

        misc_playerblips:On('check', function(item)

            plyblipson = true
            SetInterval(plyblipsint, 0)
        end)

        misc_playerblips:On('uncheck', function(item)
            plyblipson = false
            SetInterval(plyblipsint, 5000)

            for k, v in pairs(plyblips) do
                while DoesBlipExist(v) == 1 do
                    RemoveBlip(v)
                    Wait(0)
                end
            end

            plyblips = {}
        end)
    end
    ----------------------------------------------------------------------------
    -- PLAYER NAMES

    if IsPlayerAllowed('TSAdmin.MiscSettings.PlayerNames') then

        local plynameon = false
        local plynamet = {}
        local plynameint = SetInterval(function()
            if plynameon then
                local ply = GetActivePlayers()
                for k, v in pairs(ply) do
                    local dist = #(GetEntityCoords(GetPlayerPed(v)) - GetEntityCoords(PlayerPedId()))
                    if dist < 230 then
                        if not plynamet[k] or not IsMpGamerTagActive(plynamet[k]) then
                            plynamet[k] = CreateFakeMpGamerTag(GetPlayerPed(v),
                                GetPlayerName(v) .. ': ' .. GetPlayerServerId(v), false, false, "", 0)
                            SetMpGamerTagVisibility(plynamet[k], 2, 1) -- set the visibility of component 2(healthArmour) to true
                            SetMpGamerTagAlpha(plynamet[k], 2, 255) -- set the alpha of component 2(healthArmour) to 255
                            SetMpGamerTagHealthBarColor(plynamet[k], 129) -- set component 2(healthArmour) color to 129(HUD_COLOUR_YOGA)
                        end
                    else
                        if plynamet[k] then
                            RemoveMpGamerTag(plynamet[k])
                            plynamet[k] = nil
                        end
                    end
                end
            end
        end, 1000)
        local misc_playername = miscsettings:AddCheckbox({
            icon = '🔍',
            label = 'Player Names',
            value = 'n'
        })

        misc_playername:On('check', function(item)
            plynameon = true
            SetInterval(plynameint, 0)
        end)

        misc_playername:On('uncheck', function(item)
            plynameon = false
            SetInterval(plynameint, 1000)
            for k, v in pairs(plynamet) do
                RemoveMpGamerTag(plynamet[k])
                plynamet[k] = nil
            end
        end)
    end
    ----------------------------------------------------------------------------
    -- TIMECYCLE
    if IsPlayerAllowed('TSAdmin.MiscSettings.Timecycle') then

        local misc_timecycles = miscsettings:AddSlider({
            icon = '🎥',
            label = 'Timecycle',
            value = 'cinema',
            values = Timecycles
        })
        local misc_timecycles_intensity = miscsettings:AddRange({
            icon = '🎥',
            label = 'Timecycle Intensity',
            min = 0,
            max = 10,
            value = 0,
            saveOnUpdate = true
        })
        misc_timecycles_intensity:On('change', function(item, newValue, oldValue)
            SetTimecycleModifierStrength(newValue / 10.0)
        end)
        misc_timecycles:On('change', function(item, value)
            SetTimecycleModifier(item.data.Values[value].Value)
        end)
    end
end

local LoadTrollMenu = function()
    trollmenu:ClearItems()
    -- FART
    if IsPlayerAllowed('TSAdmin.TrollMenu.Fart') then

        local trollmenu_fart = trollmenu:AddSlider({
            icon = '🎥',
            label = 'Fart',
            value = 'bbfart',
            values = { {
                label = 'Bass Boosted Fart',
                value = 'bbfart',
                description = 'Play Bass Boosted Fart'
            }, {
                label = 'Common Fart',
                value = 'cmfart',
                description = 'Play Common Fart'
            }, {
                label = 'Powerful Fart',
                value = 'pwrfart',
                description = 'Play Powerful Fart'
            }, {
                label = 'Smelly Fart',
                value = 'smfart',
                description = 'Play Smelly Fart'
            } }
        })
        trollmenu_fart:On('select', function(item, newValue, oldValue)
            TriggerServerEvent('ts-adminmenu:server:PlayerFart', newValue)
        end)
    end

    -- TRUCK PUNCHLINE
    if IsPlayerAllowed('TSAdmin.TrollMenu.Truck') then

        local trollmenu_truck = trollmenu:AddButton({
            icon = '🚚',
            label = 'Truck Punchline',
            value = 'clr',
            description = 'Truck Punchline',
            select = function(i)
                TriggerEvent('ts-adminmenu:client:TruckPunchlinePly')
            end
        })
    end


    -- CLOWN ATTACK
    if IsPlayerAllowed('TSAdmin.TrollMenu.Clown') then

        local trollmenu_clown = trollmenu:AddButton({
            icon = '🧛',
            label = 'Clown Attack',
            value = 'clr',
            description = 'Clown Attack',
            select = function(i)
                TriggerEvent('ts-adminmenu:client:ClownAttackPly')
            end
        })
    end


    -- MERRY ATTACK
    if IsPlayerAllowed('TSAdmin.TrollMenu.Merry') then

        local trollmenu_merry = trollmenu:AddButton({
            icon = '👨‍🎤',
            label = 'Merryweather Attack',
            value = 'clr',
            description = 'MerryWeather Attack',
            select = function(i)
                TriggerEvent('ts-adminmenu:client:MerryAttackPly')
            end
        })
    end


    -- FLASHBANG
    if IsPlayerAllowed('TSAdmin.TrollMenu.Flash') then

        local trollmenu_flash = trollmenu:AddButton({
            icon = '👨‍🎤',
            label = 'Flashbang',
            value = 'clr',
            description = 'Flashbang',
            select = function(i)
                TriggerEvent('ts-adminmenu:client:Flashbangply')
            end
        })
    end


    -- FAKE SOUND
    if IsPlayerAllowed('TSAdmin.TrollMenu.FakeSound') then

        local trollmenu_fake = trollmenu:AddButton({
            icon = '🎙',
            label = 'Fake Sound',
            value = 'clr',
            description = 'Fake Sound',
            select = function(i)
                local count = 2
                local myMenu = {}
                for k, v in ipairs(fakeNotif) do
                    local t = count - 1
                    myMenu[v.name] = {
                        description = 'Play ' .. v.name,
                        arrow = true,
                        event = 'ts-adminmenu:client:FakeCallply',
                        args = {
                            type = t
                        }
                    }
                    count = count + 1
                end
                lib.registerContext({
                    id = 'fake_sounds',
                    title = 'Fake Sounds',
                    options = myMenu
                })
                lib.showContext('fake_sounds')
            end
        })
    end

    -- LAG GAME
    if IsPlayerAllowed('TSAdmin.TrollMenu.Lag') then

        local trollmenu_lag = trollmenu:AddButton({
            icon = '⚰️',
            label = 'Lag Game',
            value = 'clr',
            description = 'Lag Game',
            select = function(i)
                TriggerEvent('ts-adminmenu:client:Lagply')
            end
        })
    end

    -- BLOW TYRES
    if IsPlayerAllowed('TSAdmin.TrollMenu.BlowTyre') then

        local trollmenu_blow = trollmenu:AddButton({
            icon = '🕹',
            label = 'Blow Tyres',
            value = 'clr',
            description = 'Blow Tyres',
            select = function(i)
                TriggerEvent('ts-adminmenu:client:BlowPly')
            end
        })
    end

    -- EJECT FROM VEH
    if IsPlayerAllowed('TSAdmin.TrollMenu.Eject') then

        local trollmenu_eject = trollmenu:AddButton({
            icon = '🦵🏻',
            label = 'Eject From Veh',
            value = 'clr',
            description = 'Eject From Veh',
            select = function(i)
                TriggerEvent('ts-adminmenu:client:EjectPly')
            end
        })
    end

    -- CRASH GAME
    if IsPlayerAllowed('TSAdmin.TrollMenu.Crash') then

        local trollmenu_crash = trollmenu:AddButton({
            icon = '⚰️',
            label = 'Crash Game',
            value = 'clr',
            description = 'Crash Game',
            select = function(i)
                TriggerEvent('ts-adminmenu:client:Crashply')
            end
        })
    end
    if IsPlayerAllowed('TSAdmin.RockstarEditor') then

        local slider = rockstar:AddSlider({
            icon = '🎥',
            label = 'Option',
            value = 'option',
            values = { {
                label = "Start Recording",
                value = 'record',
                description = ''
            }, {
                label = "Save Recording",
                value = 'saveclip',
                description = ''
            }, {
                label = "Discard Recording",
                value = 'delclip',
                description = ''
            }, {
                label = "Open Editor",
                value = 'editor',
                description = ''
            } }
        })
        slider:On('select', function(item, value)
            TriggerEvent("ts-adminmenu:" .. value)
        end)
    end
end


RegisterCommand('tsadmin', function()
    if IsPlayerAllowed('TSAdmin.admin') then
        MenuV:CloseAll(function()
            selectedPlayer = 0
            MenuV:OpenMenu(menu)
        end)
    else
        lib.notify({
            title = 'TS Admin Menu',
            description = 'You are not an Admin',
            type = 'error'
        })
    end
end)

RegisterKeyMapping('tsadmin', 'TS Adminmenu', 'keyboard', 'f11')

RegisterCommand('tsgetmenu', function()
    TriggerEvent('table', menu)
end)

local OpenPlayersMenu = function(ply)
    local plyd = ply
    selectedPlayer = plyd.source
    onlineplayers_each.data.Subtitle = plyd.name .. " ID: " .. selectedPlayer
    MenuV:OpenMenu(onlineplayers_each)
end
local loadtimeout = false
local LoadAdminMenu = function()
    if not loadtimeout then
        loadtimeout = true
        if IsPlayerAllowed('TSAdmin.PlayerOptions.Noclip') then

            RegisterCommand("toggleNoClip", function(source, rawCommand)
                ToggleNoClipMode()
            end)
            RegisterKeyMapping('toggleNoClip', 'Noclip', 'keyboard', 'INSERT')
        end
        menu:ClearItems()
        LoadOnlinePlayersEach()
        LoadPlayerOptions()
        LoadVehicleOptions()
        LoadMiscSettings()
        LoadTrollMenu()

        onlineplayers_each:On('OnClose', function()
            selectedPlayer = 0
        end)
        menu:On('OnClose', function()
            selectedPlayer = 0
        end)
        onlineplayers:On('OnClose', function()
            selectedPlayer = 0
        end)


        local menu_onlineplayers = menu:AddButton({
            icon = '🧍‍♂️',
            label = 'Online Players',
            value = onlineplayers,
            description = 'Show Online Players',
            select = function(i)
                lib.callback('ts-adminmenu:server:GetOnlinePlayers', false, function(plyList)
                    onlineplayers:ClearItems()
                    for k, v in pairs(plyList) do
                        local tsplytable = { source = v.source, name = v.name }
                        onlineplayers:AddButton({
                            icon = v.source,
                            label = v.name,
                            description = v.name .. ' ID: ' .. v.source,
                            value = tsplytable,
                            false,
                            select = function(i)
                                local btnVal = i.Value
                                OpenPlayersMenu(btnVal)
                            end
                        })
                    end
                end)
            end
        })

        local menu_playerrelated = menu:AddButton({
            icon = '🧍‍♂️',
            label = 'Player Related Options',
            value = playeroptions,
            description = 'Show Player Related Options'
        })


        local menu_vehiclerelated = menu:AddButton({
            icon = '🚙',
            label = 'Vehicle Related Options',
            value = vehicleoptions,
            description = 'Show Vehicle Related Options'
        })


        local miscsettings_button = menu:AddButton({
            icon = '🚧',
            label = 'Misc Settings',
            value = miscsettings,
            description = 'Misc Settings'
        })
        local trolllmenu_button = menu:AddButton({
            icon = '🚧',
            label = 'Troll Menu',
            value = trollmenu,
            description = 'Open Troll Menu'
        })
        local rockstar_button = menu:AddButton({
            icon = '📸',
            label = 'Rockstar Editor',
            value = rockstar,
            description = 'Rockstar Settings'
        })
        -------------------------------------------------------------------------
        -- SPECTATE PLAYER
        if IsPlayerAllowed('TSAdmin.OnlinePlyOptions.Spectate') then

            local onlineplayers_each_spectate = menu:AddButton({
                icon = '🔬',
                label = "Spectate Player",
                description = "Spectate Player",
                value = "specp",
                false,
                select = function(i)
                    TriggerServerEvent('fl_spectate:server:openSpectateMenu')
                end
            })
        end

        Wait(5000)
        loadtimeout = false
    end


end



-- EVENTS / FUNC
RegisterNetEvent("ts-adminmenu:record", function()
    StartRecording(1)
    TSNotif("Started recording")
end)

RegisterNetEvent("ts-adminmenu:saveclip", function()
    StartRecording(0)
    StopRecordingAndSaveClip()
    TSNotif("Saved recording")
end)

RegisterNetEvent("ts-adminmenu:delclip", function()
    StopRecordingAndDiscardClip()
    TSNotif("Discarded recording")
end)

RegisterNetEvent("ts-adminmenu:editor", function()
    TSNotif("Opening Rockstar Editor")
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
end)
local SetPlayerSkin = function(ped)
    local modelHash = GetHashKey(ped)
    if IsModelInCdimage(modelHash) and IsModelValid(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(0)
        end
        if GetEntityModel(PlayerPedId()) ~= modelHash then
            SetPlayerModel(PlayerId(), modelHash)
            SetModelAsNoLongerNeeded(modelHash)
            SetPedDefaultComponentVariation(PlayerPedId())
            ClearAllPedProps(GPlayerPedId())
            ClearPedDecorations(GPlayerPedId())
            ClearPedFacialDecorations(GPlayerPedId())
        end
    end
end

RegisterNetEvent('ts-adminmenu:client:SetPed', function(ped)
    SetPlayerSkin(ped)
end)

RegisterNetEvent("ts-adminmenu:troll:BlowPly", function()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh and veh ~= 0 then
        for i = 0, 6 do
            SetVehicleTyreBurst(veh, i, true, 1000.0)
        end
    end
end)

RegisterNetEvent("ts-adminmenu:troll:EjectPly", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh and veh ~= 0 then
        ClearPedTasksImmediately(ped)
        local coords = GetEntityCoords(ped)
        local axis = GetEntityRotation(ped)
        SetEntityCoords(ped, coords.x, coords.y, coords.z + 0.1, 0, 0, axis, false)
        SetPedToRagdoll(ped, 10, 10, 2, true, true, true)
        SetEntityVelocity(ped, 0, 0, 10.0)
    end
end)

RegisterNetEvent("ts-adminmenu:troll:Crashply", function()
    -- rip, someone doesnt like us.
    repeat

    until false
end)

RegisterNetEvent('ts-adminmenu:troll:FakeCall', function(type)
    local notif = fakeNotif[type]
    print("REACHCL")
    local url = string.format("https://www.youtube.com/watch?v=%s", notif.youtube_id,
        math.min(notif.volume or 25, 75))
    local dui = CreateDui(url, 1024, 1024)
    duihandle = GetDuiHandle(dui)

    Wait(10000)
    DestroyDui(dui)

end)
RegisterNetEvent('ts-adminmenu:troll:FlashPly', function()
    SetTimecycleModifier("mp_corona_heist_bw");
    SetTimecycleModifierStrength(1.0)

    intensity = 1.0
    Wait(1000)
    repeat
        ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.5)
        SetTimecycleModifierStrength(intensity)
        intensity = intensity - 0.01
        Wait(50)
    until intensity <= 0.1

    ClearTimecycleModifier()

end)
RegisterNetEvent("ts-adminmenu:troll:TruckPunchline", function()

    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)
    local pRot = GetEntityRotation(playerPed)

    RequestModel("rubble")

    repeat
        Wait(10)
    until HasModelLoaded("rubble")

    FreezeEntityPosition(playerPed, true)
    if IsPedInAnyVehicle(playerPed, false) then
        FreezeEntityPosition(GetVehiclePedIsIn(playerPed, false), true)
    end

    local arrowSpawn = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 3.0, 0.0)
    local vehSpawn = GetOffsetFromEntityInWorldCoords(playerPed, -10.0, 0.0, 0.0)

    local veh = CreateVehicle("rubble", vehSpawn, pRot.z - 90, true, false)
    DisableVehicleWorldCollision(veh)
    SetEntityCoords(veh, vehSpawn, 0.0, 0.0, pRot.z - 90.0, true)
    FreezeEntityPosition(veh, true)

    local i = 1
    local loop = 0
    local draw = true
    repeat
        i = i + 1
        if i == 1 then
            draw = true
        elseif i == 80 then
            draw = false
        elseif i == 160 then
            draw = false
            loop = loop + 1
            i = 0
        end
        if draw then
            DrawMarker(21, arrowSpawn.x, arrowSpawn.y, arrowSpawn.z + 0.5, 0.0, 0.0, 0.0, 0.0, 270.0, 0.0, 2.0, 2.0,
                2.0, 255, 255, 255, 160, false, true, 2)
        end

        Wait(0)
    until (loop == 3)

    FreezeEntityPosition(veh, false)
    SetEntityRotation(veh, 0.0, 0.0, pRot.z - 90.0, 0, true)
    SetVehicleForwardSpeed(veh, 80.0)
    FreezeEntityPosition(playerPed, false)
    if IsPedInAnyVehicle(playerPed, false) then
        FreezeEntityPosition(GetVehiclePedIsIn(playerPed, false), false)
    end

    Wait(6000)
    SetEntityAsMissionEntity(veh, true, true)
    DeleteEntity(veh)
    FreezeEntityPosition(playerPed, false)
end)

RegisterNetEvent('ts-adminmenu:troll:ClownAttack', function()
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)

    RequestModel("speedo2")

    repeat
        Wait(10)
    until HasModelLoaded("speedo2")

    RequestModel("s_m_y_clown_01")

    repeat
        Wait(10)
    until HasModelLoaded("s_m_y_clown_01")

    repeat
        found, SpawnCoords = FindSpawnPointInDirection(pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, 100.0)
        Wait(100)
    until found

    local veh = CreateVehicle("speedo2", SpawnCoords, 0, true, false)
    SetVehicleModKit(veh, 0)
    SetVehicleMod(veh, 11, 3, false)
    SetVehicleMod(veh, 12, 3, false)
    SetVehicleMod(veh, 13, 3, false)
    ToggleVehicleMod(veh, 18, true)

    AddRelationshipGroup("CLOWNS")
    AddRelationshipGroup("ASSASINTARGET")
    SetPedRelationshipGroupHash(playerPed, "ASSASINTARGET")
    SetRelationshipBetweenGroups(5, "CLOWNS", "ASSASINTARGET")
    SetRelationshipBetweenGroups(0, "CLOWNS", "CLOWNS")
    local peds = {}
    for i = -1, 4 do
        local ped = CreatePedInsideVehicle(veh, "WHATEVER", "s_m_y_clown_01", i, true, false)
        table.insert(peds, ped)
        GiveWeaponToPed(ped, "weapon_microsmg", 999, false, true)
        SetPedRelationshipGroupDefaultHash(ped, "CLOWNS")
        SetPedRelationshipGroupHash(ped, "CLOWNS")
        SetPedCombatAbility(ped, 2)
        SetPedCombatMovement(ped, 3)
        SetPedCombatRange(ped, 2)
        SetPedCombatAttributes(ped, 46, true)
        SetPedCombatAttributes(ped, 2, true)
        SetPedCombatAttributes(ped, 3, false)
        SetPedCombatAttributes(ped, 20, false)
        TaskCombatPed(ped, playerPed, 0, 16)
    end

    local allPedsDead
    repeat
        Wait(100)
        local alivePeds = {}
        for i, ped in pairs(peds) do
            if not IsPedDeadOrDying(ped, true) then
                table.insert(alivePeds, ped)
            end
        end
        for i, ped in pairs(alivePeds) do
            local pedVeh = GetVehiclePedIsUsing(ped)
            if pedVeh ~= 0 and GetEntityHealth(pedVeh) < 100 then
                ClearPedTasks(ped)
                TaskLeaveVehicle(ped, pedVeh, 4160)
                Wait(5000)
                ClearPedTasks(ped)
                TaskCombatPed(ped, playerPed, 0, 16)
            end
        end
        if #alivePeds == 0 then
            allPedsDead = true
        end
    until (IsPedDeadOrDying(PlayerPedId(), true) or allPedsDead)
    for i, ped in pairs(peds) do
        if not IsPedDeadOrDying(ped, true) then
            ClearPedTasks(ped)
            TaskVehicleDriveWander(ped, veh, 60.0, 524860)
            SetPedAsNoLongerNeeded(ped)
        else
            SetPedAsNoLongerNeeded(ped)
        end
    end
    SetVehicleAsNoLongerNeeded(veh)
    SetModelAsNoLongerNeeded("speedo2")
    SetModelAsNoLongerNeeded("s_m_y_clown_01")

end)

RegisterNetEvent('ts-adminmenu:troll:MerryAttack', function()
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)

    RequestModel("mesa3")

    repeat
        Wait(10)
    until HasModelLoaded("mesa3")

    RequestModel("S_M_Y_BlackOps_01")

    repeat
        Wait(10)
    until HasModelLoaded("S_M_Y_BlackOps_01")

    repeat
        found, SpawnCoords = FindSpawnPointInDirection(pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, 100.0)
        Wait(100)
    until found

    local veh = CreateVehicle("mesa3", SpawnCoords, 0, true, false)
    SetVehicleModKit(veh, 0)
    SetVehicleMod(veh, 11, 3, false)
    SetVehicleMod(veh, 12, 3, false)
    SetVehicleMod(veh, 13, 3, false)
    ToggleVehicleMod(veh, 18, true)

    AddRelationshipGroup("CLOWNS")
    AddRelationshipGroup("ASSASINTARGET")
    SetPedRelationshipGroupHash(playerPed, "ASSASINTARGET")
    SetRelationshipBetweenGroups(5, "CLOWNS", "ASSASINTARGET")
    SetRelationshipBetweenGroups(0, "CLOWNS", "CLOWNS")
    local peds = {}
    for i = -1, 3 do
        local ped = CreatePedInsideVehicle(veh, "WHATEVER", "S_M_Y_BlackOps_01", i, true, false)
        table.insert(peds, ped)
        GiveWeaponToPed(ped, "weapon_machinepistol", 999, false, true)
        SetPedRelationshipGroupDefaultHash(ped, "CLOWNS")
        SetPedRelationshipGroupHash(ped, "CLOWNS")
        SetPedCombatAbility(ped, 2)
        SetPedCombatMovement(ped, 3)
        SetPedCombatRange(ped, 2)
        SetPedCombatAttributes(ped, 46, true)
        SetPedCombatAttributes(ped, 2, true)
        SetPedCombatAttributes(ped, 3, false)
        SetPedCombatAttributes(ped, 20, false)
        TaskCombatPed(ped, playerPed, 0, 16)
    end

    local allPedsDead
    repeat
        Wait(100)
        local alivePeds = {}
        for i, ped in pairs(peds) do
            if not IsPedDeadOrDying(ped, true) then
                table.insert(alivePeds, ped)
            end
        end
        for i, ped in pairs(alivePeds) do
            local pedVeh = GetVehiclePedIsUsing(ped)
            if pedVeh ~= 0 and GetEntityHealth(pedVeh) < 100 then
                ClearPedTasks(ped)
                TaskLeaveVehicle(ped, pedVeh, 4160)
                Wait(5000)
                ClearPedTasks(ped)
                TaskCombatPed(ped, playerPed, 0, 16)
            end
        end
        if #alivePeds == 0 then
            allPedsDead = true
        end
    until (IsPedDeadOrDying(PlayerPedId(), true) or allPedsDead)
    for i, ped in pairs(peds) do
        if not IsPedDeadOrDying(ped, true) then
            ClearPedTasks(ped)
            TaskVehicleDriveWander(ped, veh, 60.0, 524860)
            SetPedAsNoLongerNeeded(ped)
        else
            SetPedAsNoLongerNeeded(ped)
        end
    end
    SetVehicleAsNoLongerNeeded(veh)
    SetModelAsNoLongerNeeded("mesa3")
    SetModelAsNoLongerNeeded("S_M_Y_BlackOps_01")

end)

RegisterNetEvent('ts-adminmenu:client:TruckPunchlinePly', function()
    lib.callback('ts-adminmenu:server:GetOnlinePlayers', false, function(ply)
        local myMenu = {}
        for k, v in pairs(ply) do
            myMenu[v.name] = {
                description = 'Player ID: ' .. v.source,
                arrow = false,
                event = 'ts-adminmenu:client:TruckPunchlinePly2',
                args = {
                    plyid = v.source
                }
            }
        end
        lib.registerContext({
            id = 'truck_punch',
            title = 'Truck Punchline',
            options = myMenu
        })
        lib.showContext('truck_punch')
    end)
end)

RegisterNetEvent('ts-adminmenu:client:TruckPunchlinePly2', function(arg)
    TriggerServerEvent('ts-adminmenu:server:TruckPunchlinePly', arg)

end)

RegisterNetEvent('ts-adminmenu:client:ClownAttackPly', function()
    lib.callback('ts-adminmenu:server:GetOnlinePlayers', false, function(ply)
        local myMenu = {}
        for k, v in pairs(ply) do
            myMenu[v.name] = {
                description = 'Player ID: ' .. v.source,
                arrow = false,
                event = 'ts-adminmenu:client:ClownAttackPly2',
                args = {
                    plyid = v.source
                }
            }
        end
        lib.registerContext({
            id = 'clown_attack',
            title = 'Clown Attack',
            options = myMenu
        })
        lib.showContext('clown_attack')
    end)
end)

RegisterNetEvent('ts-adminmenu:client:ClownAttackPly2', function(arg)
    print(ESX.DumpTable(arg))
    TriggerServerEvent('ts-adminmenu:server:ClownAttackPly', arg)

end)

RegisterNetEvent('ts-adminmenu:client:MerryAttackPly', function()
    lib.callback('ts-adminmenu:server:GetOnlinePlayers', false, function(ply)
        local myMenu = {}
        for k, v in pairs(ply) do
            myMenu[v.name] = {
                description = 'Player ID: ' .. v.source,
                arrow = false,
                event = 'ts-adminmenu:client:MerryAttackPly2',
                args = {
                    plyid = v.source
                }
            }
        end
        lib.registerContext({
            id = 'merry_attack',
            title = 'Merryweather Attack',
            options = myMenu
        })
        lib.showContext('merry_attack')
    end)
end)

RegisterNetEvent('ts-adminmenu:client:MerryAttackPly2', function(arg)
    print(ESX.DumpTable(arg))
    TriggerServerEvent('ts-adminmenu:server:MerryAttackPly', arg)

end)

Citizen.CreateThread(function()
    local stopGrief = false
    local griefRunning = false
    RegisterNetEvent("ts-adminmenu:troll:LagGame", function()
        -- rip, someone doesnt like us.
        if griefRunning then
            stopGrief = true
            griefRunning = false
            return
        elseif stopGrief then
            stopGrief = false
        end
        griefRunning = true
        repeat
            for i = 1, 100000 do
                GetPlayerPed(PlayerId())
            end
            Wait(0)
        until stopGrief
    end)
end)

RegisterNetEvent('ts-adminmenu:client:FakeCallply', function(data)
    local type = data.type
    lib.callback('ts-adminmenu:server:GetOnlinePlayers', false, function(ply)
        local myMenu = {}
        for k, v in pairs(ply) do
            myMenu[v.name] = {
                description = 'Player ID: ' .. v.source,
                arrow = false,
                event = 'ts-adminmenu:client:FakeCallply2',
                args = {
                    plyid = v.source,
                    type = type
                }
            }
        end
        lib.registerContext({
            id = 'fakecall',
            title = 'Fake Call',
            options = myMenu
        })
        lib.showContext('fakecall')
    end)
end)


RegisterNetEvent('ts-adminmenu:client:FakeCallply2', function(arg)
    TriggerServerEvent('ts-adminmenu:server:FakeCallply', arg)

end)

RegisterNetEvent('ts-adminmenu:client:Lagply', function()
    lib.callback('ts-adminmenu:server:GetOnlinePlayers', false, function(ply)
        local myMenu = {}
        for k, v in pairs(ply) do
            myMenu[v.name] = {
                description = 'Player ID: ' .. v.source,
                arrow = false,
                event = 'ts-adminmenu:client:LagGame',
                args = {
                    plyid = v.source
                }
            }
        end
        lib.registerContext({
            id = 'lag_game',
            title = 'Lag Game',
            options = myMenu
        })
        lib.showContext('lag_game')
    end)
end)

RegisterNetEvent('ts-adminmenu:client:LagGame', function(arg)
    TriggerServerEvent('ts-adminmenu:server:LagGame', arg)

end)


RegisterNetEvent('ts-adminmenu:client:Flashbangply', function()
    lib.callback('ts-adminmenu:server:GetOnlinePlayers', false, function(ply)
        local myMenu = {}
        for k, v in pairs(ply) do
            myMenu[v.name] = {
                description = 'Player ID: ' .. v.source,
                arrow = false,
                event = 'ts-adminmenu:client:FlashPly',
                args = {
                    plyid = v.source
                }
            }
        end
        lib.registerContext({
            id = 'flash',
            title = 'Flash Player',
            options = myMenu
        })
        lib.showContext('flash')
    end)
end)

RegisterNetEvent('ts-adminmenu:client:FlashPly', function(arg)
    TriggerServerEvent('ts-adminmenu:server:FlashPly', arg)

end)


RegisterNetEvent('ts-adminmenu:client:BlowPly', function()
    lib.callback('ts-adminmenu:server:GetOnlinePlayers', false, function(ply)
        local myMenu = {}
        for k, v in pairs(ply) do
            myMenu[v.name] = {
                description = 'Player ID: ' .. v.source,
                arrow = false,
                event = 'ts-adminmenu:client:BlowPly2',
                args = {
                    plyid = v.source
                }
            }
        end
        lib.registerContext({
            id = 'blow',
            title = 'Blow Tyres',
            options = myMenu
        })
        lib.showContext('blow')
    end)
end)

RegisterNetEvent('ts-adminmenu:client:BlowPly2', function(arg)
    TriggerServerEvent('ts-adminmenu:server:BlowPly', arg)

end)


RegisterNetEvent('ts-adminmenu:client:EjectPly', function()
    lib.callback('ts-adminmenu:server:GetOnlinePlayers', false, function(ply)
        local myMenu = {}
        for k, v in pairs(ply) do
            myMenu[v.name] = {
                description = 'Player ID: ' .. v.source,
                arrow = false,
                event = 'ts-adminmenu:client:EjectPly2',
                args = {
                    plyid = v.source
                }
            }
        end
        lib.registerContext({
            id = 'ejectply',
            title = 'Eject Player From Vehicle',
            options = myMenu
        })
        lib.showContext('ejectply')
    end)
end)
RegisterNetEvent('ts-adminmenu:client:EjectPly2', function(arg)
    TriggerServerEvent('ts-adminmenu:server:EjectPly', arg)

end)

RegisterNetEvent('ts-adminmenu:client:Crashply', function()
    lib.callback('ts-adminmenu:server:GetOnlinePlayers', false, function(ply)
        local myMenu = {}
        for k, v in pairs(ply) do
            myMenu[v.name] = {
                description = 'Player ID: ' .. v.source,
                arrow = false,
                event = 'ts-adminmenu:client:CrashPly2',
                args = {
                    plyid = v.source
                }
            }
        end
        lib.registerContext({
            id = 'crash',
            title = 'Crash Player',
            options = myMenu
        })
        lib.showContext('crash')
    end)
end)

RegisterNetEvent('ts-adminmenu:client:CrashPly2', function(arg)
    TriggerServerEvent('ts-adminmenu:server:CrashPly', arg)

end)


RegisterNetEvent('ts-adminmenu:client:PlayFart', function(plyList, type)
    local players = plyList
    local fart = type
    local count = 2
    local myMenu = {}
        for k, v in pairs(plyList) do
            myMenu[v.name] = {
                description = 'Player ID: ' .. v.source,
                arrow = false,
                event = 'ts-adminmenu:client:PlayFartFromServer',
                args = {
                    ply = v.source,
                    type = fart
                }
            }
        end
        lib.registerContext({
            id = 'fart',
            title = 'Fart On Player',
            options = myMenu
        })
        lib.showContext('fart')
end)

RegisterNetEvent('ts-adminmenu:client:PlayFartFromServer', function(arg)
    TriggerServerEvent('ts-adminmenu:server:PlayFartFromServer', arg)

end)

RegisterCommand('loadadminmenu', function()
    LoadAdminMenu()
end)

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    LoadAdminMenu()
    TriggerServerEvent('ts-adminmenu:server:PlayerJoined')
end)

RegisterNetEvent('ts-adminmenu:client:TeleporttoVeh', function(ped)
    local yPlyPed = NetworkGetEntityFromNetworkId(ped)
    local yVeh = GetVehiclePedIsIn(yPlyPed)
    local maxPas = GetVehicleMaxNumberOfPassengers(yVeh) - 1
    for i = -1, maxPas, 1 do
        if IsVehicleSeatFree(yVeh, i) then
            TaskWarpPedIntoVehicle(PlayerPedId(), yVeh, i)
        end
    end

end)

RegisterNetEvent('ts-adminmenu:client:SetWaypoint', function(coords)
    local pos = coords
    SetNewWaypoint(pos.x, pos.y)
end)

RegisterNetEvent('ts-adminmenu:client:PrintID', function(steamid, license, xbl, ip, discord, liveid)
    print(steamid, license, xbl, ip, discord, liveid)
end)

RegisterNetEvent('ts-adminmenu:client:Kill', function()
    SetEntityHealth(PlayerPedId(), 0)
end)
RegisterNetEvent('ts-adminmenu:client:ChangePed', function()
    Wait(500)
    local input = lib.inputDialog('TS Admin Menu - Ped Changer', { "Player ID", "Model Name" })

    if input then
        local pid = tonumber(input[1])
        local model = input[2]
        if pid == nil or model == nil then
            return
        end
        if pid ~= GetPlayerServerId(PlayerId()) then
            TriggerServerEvent('ts-adminmenu:server:SetPed', pid, model)
        else
            SetPlayerSkin(model)
        end
    end
end)

RegisterNetEvent('ts-adminmenu:client:GiveItem', function(data)
    local player = data.plyid
    local item = data.item
    Wait(500)
    local input = lib.inputDialog('TS Admin Menu - Give Item', {"Count"})

    if input then
        local count = tonumber(input[1])
        if count == nil then
            return
        end
        TriggerServerEvent('ts-adminmenu:server:GiveItem', player, item, count)
    end

end)

RegisterNetEvent('ts-adminmenu:client:RemoveItemCount', function(data)
    local pid = data.plyid
    local item = data.item
    Wait(500)
    local input = lib.inputDialog('TS Admin Menu - Remove Item', { "Count"})

    if input then
        local count = tonumber(input[1])
        if count == nil then
            return
        end
        TriggerServerEvent('ts-adminmenu:server:RemoveItem', pid, item, count)
    end
end)

RegisterNetEvent('ts-adminmenu:client:RemoveItem', function(ply, list)
    local pid = ply
    local items = list
    local myMenu = {}
    for k, v in pairs(items) do
        if v then
            myMenu[v.label] = {
                description = 'Remove '..v.name,
                event = 'ts-adminmenu:client:RemoveItemCount',
                arrow = true,
                args = {
                    item = v.name,
                    plyid = pid
                }
            }
        end
    end
    lib.registerContext({
        id = 'remove_item',
        title = 'Remove Inventory Item',
        options = myMenu
    })
    lib.showContext('remove_item')
end)
