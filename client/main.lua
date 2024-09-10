local ESX = exports['es_extended']:getSharedObject()
local selectedPlayer = nil
local loaded = false
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
local Timecycles = { 
        {
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
local function CheckAllowed(obj,type)
    local AdminData = LocalPlayer.state.TSAdmin
    local hasPermission = false
    if AdminData and AdminData[type] then
        if AdminData[type].FullAccess or AdminData[type][obj] or AdminData.FullAccess then
            hasPermission = true
        end
    else
        if AdminData[obj] then
            hasPermission = true
        end
    end
return hasPermission
end
RegisterNetEvent('esx:playerLoaded',function()
    TriggerServerEvent('ts-adminmenu:server:LoadPerms')
    Wait(1500)
    LoadAdminMenu()
end)
function LoadOnlinePlayers()
    local values = {}
    if CheckAllowed('SendMessage','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Send Message', icon = "message", args={event='ts-adminmenu:client:SendMessage'}, description="Send Private Message to player"}
    end
    if CheckAllowed('ChangeSkin','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Change Skin', icon = "person-half-dress", args={serverEvent='ts-adminmenu:server:ChangeSkin'}, description="Give change skin option to player"}
    end
    if CheckAllowed('ChangePed','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Change Ped', icon = "people-arrows", args={event='ts-adminmenu:client:ChangePed'}, description="Change Ped of the player"}
    end
    if CheckAllowed('OpenInventory','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Show Inventory', icon = "warehouse", args={serverEvent='ts-adminmenu:server:ShowInventory'}, description="View Player Inventory"}
    end
    if CheckAllowed('SetJob','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Set Job', icon = "person-digging", args={event='ts-adminmenu:client:SetJob'}, description="Change Player's Job"}
    end
    if CheckAllowed('GiveItemList','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Give Item (List)', icon = "hand-holding-hand", args={event='ts-adminmenu:client:GiveItemList'}, description="Give player item from List"}
    end
    if CheckAllowed('GiveItemCode','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Give Item (Code)', icon = "hand-holding-dollar", args={event='ts-adminmenu:client:GiveItemCode'}, description="Give player item from Item Code"}
    end
    if CheckAllowed('RemoveInventoryItem','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Remove Item', icon = "trash", args={serverEvent='ts-adminmenu:server:GetItems'}, description="Remove Item from Player Inventory"}
    end
    if CheckAllowed('GiveAccountMoney','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Give Account Money', icon = "hand-holding-dollar", args={event='ts-adminmenu:client:GiveAccountMoney'}, description="Give money to player"}
    end
    if CheckAllowed('RemoveAccountMoney','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Remove Account Money', icon = "money-bill-transfer", args={event='ts-adminmenu:client:RemoveAccountMoney'}, description="Remove money from player"}
    end
    if CheckAllowed('ToggleLicense','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Add / Remove License', icon = "id-card", args={event='ts-adminmenu:client:ToggleLicense'}, description="Add or remove license of player"}
    end
    if CheckAllowed('GiveCar','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Give Car', icon = "car", args={event='ts-adminmenu:client:GiveCarSelected'}, description="Give car to player via spawn code"}
    end
    if CheckAllowed('GiveCar','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Give Current Car', icon = "car", args={event='ts-adminmenu:client:GiveCarSitting'}, description="Give the car you are sitting in"}
    end
    if CheckAllowed('HealPlayer','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Heal Player', icon = "kit-medical", args={serverEvent='ts-adminmenu:server:HealPlayer'},close=false}
    end
    if CheckAllowed('RevivePlayer','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Revive Player', icon = "heart-pulse", args={serverEvent='ts-adminmenu:server:RevivePlayer'},close=false}
    end
    if CheckAllowed('KillPlayer','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Kill Player', icon = "skull", args={serverEvent='ts-adminmenu:server:KillPlayer'},close=false}
    end
    if CheckAllowed('Goto','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Teleport To Player', icon = "paper-plane", args={serverEvent='ts-adminmenu:server:Goto'},close=false,description="Teleport To Player"}
    end
    if CheckAllowed('Bring','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Bring Player', icon = "street-view", args={serverEvent='ts-adminmenu:server:Bring'},close=false,description="Bring Player to you"}
    end
    if CheckAllowed('TPVeh','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Teleport To Vehicle', icon = "arrow-down", args={serverEvent='ts-adminmenu:server:TPVeh'},close=false,description="Teleport to player vehicle"}
    end
    if CheckAllowed('Waypoint','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Set Waypoint', icon = "location-dot", args={serverEvent='ts-adminmenu:server:SetWaypoint'},close=false,description="Set waypoint to player coords"}
    end
    if CheckAllowed('PrintID','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Copy/Print Identifier', icon = "id-badge", args={serverEvent='ts-adminmenu:server:PrintID'},close=false,description="Print and copy player identifier"}
    end
    if CheckAllowed('Kick','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Kick Player', icon = "crosshairs", args={serverEvent='ts-adminmenu:server:KickPlayer'},close=false}
    end
    if CheckAllowed('Screenshot','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Screenshot Player', icon = "display", args={serverEvent='ts-adminmenu:server:ScreenshotPlayer'},close=false}
    end
    if CheckAllowed('Spectate','OnlinePlayerOptions') then
        values[#values+1] = {label = 'Spectate Player', icon = "eye", args={event='ts-adminmenu:client:SpectatePlayer'}}
    end
    if #values == 0 then
        values = {
            {label = 'This menu is empty', icon = "eye", args={},close=false}
        }
    end
    lib.setMenuOptions('adminmenu_onlineplayerseach',values)
end
function LoadPlayerOptions()
    local values = {}
    local values2 = {}
    if CheckAllowed('ChangeSkin','PlayerOptions') then
        values[#values+1] = {label = 'Change Appearance', icon='person-half-dress', args={event='ts-adminmenu:client:ChangeSkinSelf'}}
    end
    if CheckAllowed('ChangePed','PlayerOptions') then
        values[#values+1] = {label = 'Change Ped', icon='people-arrows', args={event='ts-adminmenu:client:ChangePed'}}
    end
    if #values == 0 then
        values = {
            {label = 'This menu is empty', icon = "eye", args={},close=false}
        }
    end
    lib.setMenuOptions('adminmenu_pedoptions',values)
    if CheckAllowed('ChangePed','PlayerOptions') or CheckAllowed('ChangeSkin','PlayerOptions') then
        values2[#values2+1] = {label = 'Ped Options', icon = "people-arrows", args = {event='ts-adminmenu:open:PedOptions'},description="View Ped Options"}
    end
    if CheckAllowed('Godmode','PlayerOptions') then
        values2[#values2+1] = {label = 'Godmode', icon = "person-rays",values = {'Off', 'On'}, description = 'Toggle God Mode',args={event='ts-adminmenu:client:Godmode'},close=false}
    end
    if CheckAllowed('Invisible','PlayerOptions') then
        values2[#values2+1] = {label = 'Invisible', icon="user-large-slash",values = {'Off', 'On'}, description = 'Toggle Invisibilty',args={event='ts-adminmenu:client:Invisible'},close=false}
    end
    if CheckAllowed('UnlimitedStamina','PlayerOptions') then
        values2[#values2+1] = {label = 'Unlimited Stamina', icon="lungs",values = {'Off', 'On'}, description = 'Toggle Unlimited Stamina',args={event='ts-adminmenu:client:UnlimitedStamina'},close=false}
    end
    if CheckAllowed('FastRun','PlayerOptions') then
        values2[#values2+1] = {label = 'Fast Run', icon="person-running",values = {'Off', 'On'}, description = 'Toggle Fast Run',args={event='ts-adminmenu:client:FastRun'},close=false}
    end
    if CheckAllowed('FastSwim','PlayerOptions') then
        values2[#values2+1] = {label = 'Fast Swim', icon="person-swimming",values = {'Off', 'On'}, description = 'Toggle Fast Swim',args={event='ts-adminmenu:client:FastSwim'},close=false}
    end
    if CheckAllowed('SuperJump','PlayerOptions') then
        values2[#values2+1] = {label = 'Super Jump', icon="jet-fighter",values = {'Off', 'On'}, description = 'Toggle Super Jump',args={event='ts-adminmenu:client:SuperJump'},close=false}
    end
    if CheckAllowed('NoRagdoll','PlayerOptions') then
        values2[#values2+1] = {label = 'No Ragdoll', icon="person-circle-exclamation",values = {'Off', 'On'}, description = 'Toggle No Ragdoll',args={event='ts-adminmenu:client:NoRagdoll'},close=false}
    end
    if CheckAllowed('NeverWanted','PlayerOptions') then
        values2[#values2+1] = {label = 'Never Wanted', icon="handcuffs",values = {'Off', 'On'}, description = 'Toggle Never Wanted',args={event='ts-adminmenu:client:NeverWanted'},close=false}
    end
    if CheckAllowed('StayInVeh','PlayerOptions') then
        values2[#values2+1] = {label = 'Stay In Vehicle', icon="car-side",values = {'Off', 'On'}, description = 'Toggle Anti Dragout from Vehicle',args={event='ts-adminmenu:client:StayInVeh'},close=false}
    end
    if CheckAllowed('HealPlayer','PlayerOptions') then
        values2[#values2+1] = {label = 'Heal Player', icon='hand-holding-heart', description = 'Heal Yourself',args={event='ts-adminmenu:client:HealSelf'},close=false}
    end
    if CheckAllowed('RevivePlayer','PlayerOptions') then
        values2[#values2+1] = {label = 'Revive Player', icon='heart-pulse', description = 'Revive Yourself',args={event='ts-adminmenu:client:ReviveSelf'},close=false}
    end
    if CheckAllowed('SetArmor','PlayerOptions') then
        values2[#values2+1] = {label = 'Set Armor', icon='shield-halved', values = {'0% Armor','20% Armor', '40% Armor', '60% Armor', '80% Armor','100% Armor'}, description = 'Set your armor',args={event='ts-adminmenu:client:SetArmorSelf'},close=false}
    end
    if CheckAllowed('CleanClothes','PlayerOptions') then
        values2[#values2+1] = {label = 'Clean Clothes', icon='shower', description = 'Clean Your Clothes',args={event='ts-adminmenu:client:CleanSelf'},close=false}
    end
    if CheckAllowed('WetClothes','PlayerOptions') then
        values2[#values2+1] = {label = 'Wet Clothes', icon='cloud-showers-water', description = 'Wet Your Clothes',args={event='ts-adminmenu:client:WetSelf'},close=false}
    end
    if CheckAllowed('DryClothes','PlayerOptions') then
        values2[#values2+1] = {label = 'Dry Clothes', icon='droplet-slash', description = 'Dry Your Clothes',args={event='ts-adminmenu:client:DrySelf'},close=false}
    end
    if CheckAllowed('Suicide','PlayerOptions') then
        values2[#values2+1] = {label = 'Commit Suicide', icon='skull', description = 'Kill Yourself',args={event='ts-adminmenu:client:SuicideSelf'},close=false}
    end
    if CheckAllowed('FreezePlayer','PlayerOptions') then
        values2[#values2+1] = {label = 'Freeze Player', icon='icicles', values = {'Off', 'On'}, description = 'Freeze Yourself',args={event='ts-adminmenu:client:FreezeSelf'},close=false}
    end
    if CheckAllowed('Noclip','PlayerOptions') then
        values2[#values2+1] = {label = 'Toggle Noclip', icon='atom', values = {'Off', 'On'}, args={event='ts-adminmenu:client:Noclip'},close=false}
    end
    if #values2 == 0 then
        values2 = {
            {label = 'This menu is empty', icon = "eye", args={},close=false}
        }
    end
    lib.setMenuOptions('adminmenu_playerrelated',values2)
end
function LoadVehicleOptions()
    local values = {}
    local values2 = {}
    local classic = {}
    local metal = {}
    local matte = {}
    for k,v in ipairs(colors) do
        classic[#classic+1] = v.name
    end
    for k,v in ipairs(metalcolors) do
        metal[#metal+1] = v.name
    end
    for k,v in ipairs(mattecolors) do
        matte[#matte+1] = v.name
    end
    if CheckAllowed('Spawner','VehicleOptions') then
        values[#values+1] = {label = 'Vehicle Spawner', icon = "car-burst", args = {event='ts-adminmenu:open:VehicleSpawner'},description="Spawn Vehicle"}
    end
    values[#values+1] = {label = 'Vehicle Options', icon = "car", args = {event='ts-adminmenu:open:VehicleOptions'},description="Vehicle related options"}
    if CheckAllowed('DeleteVehicle','VehicleOptions') then
        values[#values+1] = {label = 'Delete Vehicle', icon = "trash", args = {event='ts-adminmenu:client:DeleteVehicle'},description="Delete vehicle in a radius"}
    end
    if CheckAllowed('UnlockVehicle','VehicleOptions') then
        values[#values+1] = {label = 'Unlock Vehicle', icon = "lock-open", args = {event='ts-adminmenu:client:UnlockVehicle'},description="Unlock the nearest vehicle",close=false}
    end
    if #values == 0 then
        values = {
            {label = 'This menu is empty', icon = "eye", args={},close=false}
        }
    end
    lib.setMenuOptions('adminmenu_vehiclerelated',values)
    if CheckAllowed('Modmenu','VehicleOptions') then
        lib.setMenuOptions('adminmenu_colormenu',{
            {label = 'Tyre Smoke Color', icon='palette', args={event='ts-adminmenu:client:TyreSmoke'}},
            {label = 'Neon Color', icon='palette', args={event='ts-adminmenu:client:NeonColor'}},
            {label = 'Toggle Neon', icon='lightbulb', values={'Left','Right','Front','Back'}, args={event='ts-adminmenu:client:ToggleNeon'},close=false},
            {label = 'Classic Colors',values = classic, icon='spray-can', args={event='ts-adminmenu:client:ClassicColor'},close=false},
            {label = 'Metal Colors',values = metal, icon='spray-can', args={event='ts-adminmenu:client:MetalColor'},close=false},
            {label = 'Matte Colors',values = matte, icon='spray-can', args={event='ts-adminmenu:client:MatteColor'},close=false},
            {label = 'Custom Color',icon='spray-can',args={event='ts-adminmenu:client:CustomColor'} },
            {label = 'Primary Color',icon='brush',values={'Off','On'},args={event='ts-adminmenu:client:TogglePrimary'},close=false },
            {label = 'Secondary Color',icon='brush',values={'Off','On'},args={event='ts-adminmenu:client:ToggleSecondary'},close=false },
            {label = 'Pearlescent Color',icon='brush',values={'Off','On'},args={event='ts-adminmenu:client:TogglePearlescent'},close=false },
            {label = 'Wheel Color',icon='brush',values={'Off','On'},args={event='ts-adminmenu:client:ToggleWheel'},close=false },
            {label = 'Dashboard Color',icon='brush',values={'Off','On'},args={event='ts-adminmenu:client:ToggleDashboard'},close=false },
            {label = 'Interior Color',icon='brush',values={'Off','On'},args={event='ts-adminmenu:client:ToggleInterior'},close=false },
        })
    end 
    if CheckAllowed('Modmenu','VehicleOptions') then
        values2[#values2+1] = {label = 'Mod Menu', icon = "wrench", args = {event='ts-adminmenu:open:Modmenu'},description="Vehicle Mods"}
    end
    if CheckAllowed('FreezeVehicle','VehicleOptions') then
        values2[#values2+1] = {label = 'Freeze Vehicle', icon = "wrench", values ={'Off','On'}, args = {event='ts-adminmenu:client:FreezeVehicle'},description="Freeze the vehicle at the position",close=false}
    end
    if CheckAllowed('ToggleEngine','VehicleOptions') then
        values2[#values2+1] = {label = 'Toggle Engine', icon = "car-on", values ={'Off','On'}, args = {event='ts-adminmenu:client:ToggleEngine'},description="Toggle the vehicle engine",close=false}
    end
    if CheckAllowed('ChangePlate','VehicleOptions') then
        values2[#values2+1] = {label = 'Change Numberplate', icon = "arrow-down-9-1", args = {event='ts-adminmenu:client:ChangePlate'},description="Change the number plate of the vehicle"}
    end
    if CheckAllowed('ToggleDoors','VehicleOptions') then
        values2[#values2+1] = {label = 'Toggle Doors', icon = "door-open", values ={'Left Front','Right Front','Left Rear','Right Rear','Hood','Trunk',}, args = {event='ts-adminmenu:client:ToggleDoor'},description="Open/Close the vehicle door",close=false}
    end
    if CheckAllowed('TorqueMultiplier','VehicleOptions') then
        values2[#values2+1] = {label = 'Torque Multiplier', icon = "gauge-high", values ={'Off','On'}, args = {event='ts-adminmenu:client:ToggleTorque'},description="Toggle Torque Multiplier",close=false}
        values2[#values2+1] = {label = 'Torque Value', icon = "gauge-high", values ={'x0','x2','x4','x8','x16','x32','x64','x128','x256','x512','x1024'}, args = {event='ts-adminmenu:client:TorqueMultiplier'},description="Torque Multiplier Value",close=false}
    end
    if CheckAllowed('EngineMultiplier','VehicleOptions') then
        values2[#values2+1] = {label = 'Engine Multiplier', icon = "gauge-high", values ={'Off','On'}, args = {event='ts-adminmenu:client:ToggleEngineMult'},description="Toggle Engine Multiplier",close=false}
        values2[#values2+1] = {label = 'Engine Value', icon = "gauge-high", values ={'x0','x2','x4','x8','x16','x32','x64','x128','x256','x512','x1024'}, args = {event='ts-adminmenu:client:EngineMultiplier'},description="Engine Multiplier Value",close=false}
    end
    if CheckAllowed('FlipVehicle','VehicleOptions') then
        values2[#values2+1] = {label = 'Flip Vehicle', icon = "car", args = {event='ts-adminmenu:client:FlipVehicle'},description="Flip vehicle if rolled",close=false}
    end
    if CheckAllowed('DeleteVehicle','VehicleOptions') then
        values2[#values2+1] = {label = 'Delete Vehicle', icon = "trash", args = {serverEvent='ts-adminmenu:server:DeleteVehicle'},description="Delete vehicle you are in",close=false}
    end
    if CheckAllowed('RefuelVehicle','VehicleOptions') then
        values2[#values2+1] = {label = 'Refuel Vehicle', icon = "gas-pump", args = {event='ts-adminmenu:client:RefuelVehicle'},description="Refill the fuel",close=false}
    end
    if CheckAllowed('BikeHelmet','VehicleOptions') then
        values2[#values2+1] = {label = 'No Bike Helmet', icon = "helmet-un", values ={'Off','On'}, args = {event='ts-adminmenu:client:NoHelmet'},description="Cancel wearing bike helmet",close=false}
    end
    if CheckAllowed('Godmode','VehicleOptions') then
        values2[#values2+1] = {label = 'Godmode', icon = "sun", values ={'Off','On'}, args = {event='ts-adminmenu:client:VehGodmode'},description="Toggle vehicle godmode",close=false}
    end
    if CheckAllowed('RepairVehicle','VehicleOptions') then
        values2[#values2+1] = {label = 'Repair Vehicle', icon = "screwdriver-wrench", args = {event='ts-adminmenu:client:RepairVeh'},description="Repair the vehicle",close=false}
    end
    if CheckAllowed('WashVehicle','VehicleOptions') then
        values2[#values2+1] = {label = 'Wash Vehicle', icon = "soap", args = {event='ts-adminmenu:client:WashVehicle'},description="Wash the vehicle",close=false}
    end
    if CheckAllowed('KeepClean','VehicleOptions') then
        values2[#values2+1] = {label = 'Keep Vehicle Clean', icon = "soap", values = {'Off','On'}, args = {event='ts-adminmenu:client:KeepClean'},description="Keeps the vehicle clean always",close=false}
    end
    if CheckAllowed('VehicleDirt','VehicleOptions') then
        values2[#values2+1] = {label = 'Set Vehicle Dirt', icon = "hill-rockslide", values = {'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15'}, args = {event='ts-adminmenu:client:SetDirt'},description="Set vehicle dirt level",close=false}
    end
    if #values2 == 0 then
        values2 = {
            {label = 'This menu is empty', icon = "eye", args={},close=false}
        }
    end
    lib.setMenuOptions('adminmenu_vehicleoptions',values2)
end
function LoadTrollMenu()
    local values = {}
    if CheckAllowed('Fart','TrollMenu') then
        values[#values+1] = {label = 'Fart', icon = "bomb", values = {"Bass Boosted Fart","Common Fart","Powerful Fart","Smelly Fart"}, args = {event='ts-adminmenu:client:Fart'},description="Troll with Fart sound"}
    end
    if CheckAllowed('TruckPunchline','TrollMenu') then
        values[#values+1] = {label = 'Truck Punchline', icon = "truck", args = {event='ts-adminmenu:client:TruckPunchlinePly'},description="Troll with truck attack"}
    end
    if CheckAllowed('ClownAttack','TrollMenu') then
        values[#values+1] ={label = 'Clown Attack', icon = "face-grin-tongue-wink", args = {event='ts-adminmenu:client:ClownAttackPly'},description="Troll with clown attack"}
    end
    if CheckAllowed('MerryweatherAttack','TrollMenu') then
        values[#values+1] ={label = 'Merryweather Attack', icon = "person-rifle", args = {event='ts-adminmenu:client:MerryAttackPly'},description="Troll with merryweather attack"}
    end
    if CheckAllowed('Flashbang','TrollMenu') then
        values[#values+1] ={label = 'Flashbang', icon = "face-flushed", args = {event='ts-adminmenu:client:Flashbangply'},description="Troll with flashbang"}
    end
    if CheckAllowed('FakeSound','TrollMenu') then
        values[#values+1] ={label = 'Fake Sound', icon = "music", args = {event='ts-adminmenu:client:FakeSound'},description="Troll with Fake sound"}
    end
    if CheckAllowed('LagGame','TrollMenu') then
        values[#values+1] = {label = 'Lag Game', icon = "spinner", args = {event='ts-adminmenu:client:Lagply'},description="Troll with Lag game"}
    end
    if CheckAllowed('BlowTyres','TrollMenu') then
        values[#values+1] = {label = 'Blow Tyres', icon = "car-burst", args = {event='ts-adminmenu:client:BlowPly'},description="Troll with Burst Tyre"}
    end
    if CheckAllowed('Eject','TrollMenu') then
        values[#values+1] = {label = 'Eject', icon = "car-burst", args = {event='ts-adminmenu:client:EjectPly'},description="Troll with eject from vehicle"}
    end
    if CheckAllowed('CrashGame','TrollMenu') then
        values[#values+1] = {label = 'Crash Game', icon = "explosion", args = {event='ts-adminmenu:client:Crashply'},description="Troll with crash player"}
    end
    if #values == 0 then
        values = {
            {label = 'This menu is empty', icon = "eye", args={},close=false}
        }
    end
    lib.setMenuOptions('adminmenu_trollmenu',values)
end
function LoadMiscSettings()
    local values = {}
    local timecyclevalue = {}
    for k,v in ipairs(Timecycles) do
        timecyclevalue[#timecyclevalue+1] = v.value
    end
    if CheckAllowed('TPM','MiscSettings') then
        values[#values+1] = {label = 'Teleport to Marker', icon = "location-dot", args = {event='ts-adminmenu:client:TPM'},description="Teleport to waypoint marked",close=false}
    end
    if CheckAllowed('TPC','MiscSettings') then
        values[#values+1] = {label = 'Teleport to Coords', icon = "location-crosshairs", args = {event='ts-adminmenu:client:TPC'},description="Teleport to given coords",close=false}
    end
    if CheckAllowed('ShowCoords','MiscSettings') then
        values[#values+1] = {label = 'Show Coords', icon = "location-crosshairs", values ={'Off','On'}, args = {event='ts-adminmenu:client:ShowCoords'},description="Show player coords",close=false}
    end
    if CheckAllowed('CopyCoords','MiscSettings') then
        values[#values+1] = {label = 'Copy Coords (vec3)', icon = "globe", args = {event='ts-adminmenu:client:CopyVec3'},description="Copy coords in Vector 3",close=false}
    end
    if CheckAllowed('CopyCoords','MiscSettings') then
        values[#values+1] = {label = 'Copy Coords (vec4)', icon = "globe", args = {event='ts-adminmenu:client:CopyVec4'},description="Copy coords in Vector 4",close=false}
    end
    if CheckAllowed('BanPlayer','MiscSettings') then
        values[#values+1] = {label = 'Ban Player', icon = "ban", args = {event='ts-adminmenu:client:BanPlayer'},description="Ban player from server"}
    end
    if CheckAllowed('UnbanPlayer','MiscSettings') then
        values[#values+1] = {label = 'Unban Player', icon = "circle-check", args = {event='ts-adminmenu:client:UnbanPlayer'},description="Unban player from server"}
    end
    if CheckAllowed('ClearArea','MiscSettings') then
        values[#values+1] = {label = 'Clear Area', icon = "broom", args = {event='ts-adminmenu:client:ClearArea'},description="Reset area",close=false}
    end
    if CheckAllowed('Relog','MiscSettings') then
        values[#values+1] = {label = 'Relog', icon = "spinner", args = {serverEvent='esx_multicharacter:relog'},description="Relog from Server"}
    end
    if CheckAllowed('PropSpawner','MiscSettings') then
        values[#values+1] = {label = 'Prop Spawner', icon = "umbrella", args = {event='ts-adminmenu:server:ObjectSpawner'},description="Open Prop spawner"}
    end
    if CheckAllowed('Announcement','MiscSettings') then
        values[#values+1] = {label = 'Announcement', icon = "bell", args = {event='ts-adminmenu:client:Announce'},description="Send a server announcement"}
    end
    if CheckAllowed('StaffChat','MiscSettings') then
        values[#values+1] = {label = 'Send Staff Chat', icon = "comment", args = {event='ts-adminmenu:client:StaffChat'},description="Send a staff chat"}
    end
    if CheckAllowed('ThermalVision','MiscSettings') then
        values[#values+1] = {label = 'Thermal Vision', icon = "eye", values = {'Off','On'}, args = {event='ts-adminmenu:client:ThermalVision'},description="Toggle Thermal Vision",close=false}
    end
    if CheckAllowed('JoinQuitNotif','MiscSettings') then
        values[#values+1] = {label = 'Join/Quit Notifications', icon = "circle-exclamation", values = {'Off','On'}, args = {event='ts-adminmenu:client:ToggleJoinQ'},description="Toggle Join and Quit Notifications",close=false}
    end
    if CheckAllowed('KillNotif','MiscSettings') then
        values[#values+1] = {label = 'Kill Notifications', icon = "circle-exclamation", values = {'Off','On'}, args = {event='ts-adminmenu:client:KillNotif'},description="Toggle Kill Notifications",close=false}
    end
    if CheckAllowed('NightVision','MiscSettings') then
        values[#values+1] = {label = 'Night Vision', icon = "eye", values = {'Off','On'}, args = {event='ts-adminmenu:client:ToggleNightVision'},description="Toggle Night Vision",close=false}
    end
    if CheckAllowed('PlayerBlips','MiscSettings') then
        values[#values+1] = {label = 'Player Blips', icon = "location-arrow", values = {'Off','On'}, args = {event='ts-adminmenu:client:PlayerBlips'},description="Toggle Player Blips",close=false}
    end
    if CheckAllowed('PlayerNames','MiscSettings') then
        values[#values+1] = {label = 'Player Names', icon = "id-card-clip", values = {'Off','On'}, args = {event='ts-adminmenu:client:PlayerNames'},description="Toggle Player Names",close=false}
    end
    if CheckAllowed('DeleteLaser','MiscSettings') then
        values[#values+1] = {label = 'Delete Laser', icon = "eraser", values = {'Off','On'}, args = {event='ts-adminmenu:client:DeleteLaser'},description="Toggle Delete Laser",close=false}
    end
    if CheckAllowed('Timecycle','MiscSettings') then
        values[#values+1] = {label = 'Timecycle', icon = "eraser", values = timecyclevalue, args = {event='ts-adminmenu:client:Timecycle'},description="Change Timecycle",close=false}
        values[#values+1] = {label = 'Timecycle Intensity', icon = "eraser", values = {0,1,2,3,4,5,6,7,8,9,10}, args = {event='ts-adminmenu:client:TimecycleIntensity'},description="Change Timecycle Intensity",close=false}
    end
    if #values == 0 then
        values = {
            {label = 'This menu is empty', icon = "eye", args={},close=false}
        }
    end
    lib.setMenuOptions('adminmenu_miscsettings',values)
end
function LoadAdminMenu()
    local values = {
        {label = 'Online Players', icon = "person", args={event='ts-adminmenu:open:OnlinePlayers'}},
        {label = 'Player Related Options', icon = "person-rays", args = {event='ts-adminmenu:open:PlayerRelatedOptions'},description="View Self Related Options"},
        {label = 'Vehicle Related Options', icon = "car", args = {event='ts-adminmenu:open:VehicleRelatedOptions'},description="View Vehicle Options"},
        {label = 'Misc Settings', icon = "list", args = {event='ts-adminmenu:open:MiscSettings'},description="View Other Options"},
        {label = 'Troll Menu', icon = "list", args = {event='ts-adminmenu:open:TrollMenu'},description="View player troll menu"},
    }
    if CheckAllowed('RockstarEditor') then
        values[#values+1] = {label = 'Rockstar Editor', icon = "camera", values = {'Start Recording','Save Recording','Discard Recording','Open Editor'}, args = {event='ts-adminmenu:client:Rockstar'},close=false}
    end
    lib.setMenuOptions('adminmenu_main',values)
    LoadOnlinePlayers()
    LoadPlayerOptions()
    LoadVehicleOptions()
    LoadTrollMenu()
    LoadMiscSettings()
    loaded = true
end
-------------------------------------------------------------------------
-----------------------------------MENUS---------------------------------
-------------------------------------------------------------------------
lib.registerMenu({
    id = 'adminmenu_main',
    title = 'TS Admin Menu',
    position = 'top-right',
    onSideScroll = function(selected, scrollIndex, args)
        if args.sideScroll then
            if args.event then
                TriggerEvent(args.event,scrollIndex)
            end
        end
    end,
    options = {
        {label = 'This menu is empty', icon = "eye", args={},close=false}
    }
}, function(selected, scrollIndex, args)
    if args.event then
        TriggerEvent(args.event,scrollIndex)
    end
end)
lib.registerMenu({
    id = 'adminmenu_onlineplayers',
    title = 'Online Players',
    position = 'top-right',
    onClose = function()
        lib.showMenu('adminmenu_main')
    end,
    options = {
        {label = 'This menu is empty', icon = "eye", args={},close=false}
    }
}, function(selected, scrollIndex, args)
    if args.source then
        selectedPlayer = args.source
        lib.showMenu('adminmenu_onlineplayerseach')
    end
end)
lib.registerMenu({
    id = 'adminmenu_vehicleoptions',
    title = 'Vehicle Options',
    position = 'top-right',
    onSideScroll = function(selected, scrollIndex, args)
        if args.sideScroll then
            if args.event then
                TriggerEvent(args.event,scrollIndex)
            end
            if args.serverEvent then
                TriggerServerEvent(args.serverEvent,scrollIndex)
            end
        end
    end,
    onClose = function()
        TriggerEvent('ts-adminmenu:open:VehicleRelatedOptions')
    end,
    options = {
        {label = 'This menu is empty', icon = "eye", args={},close=false}
    }
}, function(selected, scrollIndex, args)
    if args.event then
        TriggerEvent(args.event,scrollIndex)
    end
    if args.serverEvent then
        TriggerServerEvent(args.serverEvent,scrollIndex)
    end
end)
lib.registerMenu({
    id = 'adminmenu_modmenu',
    title = 'Mod Menu',
    position = 'top-right',
    onClose = function()
        TriggerEvent('ts-adminmenu:open:VehicleOptions')
    end,
    onSideScroll = function(selected, scrollIndex, args)
        if args.sideScroll then
            if args.event then
                if args.modType then
                    TriggerEvent(args.event,scrollIndex,args.modType)
                else
                    TriggerEvent(args.event,scrollIndex)
                end
            end
            if args.serverEvent then
                TriggerServerEvent(args.serverEvent,scrollIndex)
            end
        end
    end,
    options = {
        {label = 'This menu is empty', icon = "eye", args={},close=false}
    }
}, function(selected, scrollIndex, args)
    if args.event then
        if args.modType then
            TriggerEvent(args.event,scrollIndex,args.modType)
        else
            TriggerEvent(args.event,scrollIndex)
        end
    end
    if args.serverEvent then
        TriggerServerEvent(args.serverEvent,scrollIndex)
    end
end)
lib.registerMenu({
    id = 'adminmenu_colormenu',
    title = 'Color Menu',
    position = 'top-right',
    onSideScroll = function(selected, scrollIndex, args)
        if args.sideScroll then
            if args.event then
                TriggerEvent(args.event,scrollIndex)
            end
            if args.serverEvent then
                TriggerServerEvent(args.serverEvent,scrollIndex)
            end
        end
    end,
    onClose = function()
        TriggerEvent('ts-adminmenu:open:VehicleRelatedOptions')
    end,
    options = {
        {label = 'This menu is empty', icon = "eye", args={},close=false}
    }
}, function(selected, scrollIndex, args)
    if args.event then
        TriggerEvent(args.event,scrollIndex)
    end
    if args.serverEvent then
        TriggerServerEvent(args.serverEvent,scrollIndex)
    end
end)
lib.registerMenu({
    id = 'adminmenu_miscsettings',
    title = 'Misc Settings',
    onSideScroll = function(selected, scrollIndex, args)
        if args.sideScroll then
            if args.event then
                TriggerEvent(args.event,scrollIndex)
            end
            if args.serverEvent then
                TriggerServerEvent(args.serverEvent,scrollIndex)
            end
        end
    end,
    position = 'top-right',
    onClose = function()
        lib.showMenu('adminmenu_main')
    end,
    options = {
        {label = 'This menu is empty', icon = "eye", args={},close=false}
    }
}, function(selected, scrollIndex, args)
    if args.event then
        TriggerEvent(args.event,scrollIndex)
    end
    if args.serverEvent then
        TriggerServerEvent(args.serverEvent,scrollIndex)
    end
end)
lib.registerMenu({
    id = 'adminmenu_playerrelated',
    title = 'Player Related Options',
    position = 'top-right',
    onSideScroll = function(selected, scrollIndex, args)
        if args.sideScroll then
            if args.event then
                TriggerEvent(args.event,scrollIndex)
            end
            if args.serverEvent then
                TriggerServerEvent(args.serverEvent,scrollIndex)
            end
        end
    end,
    onClose = function()
        lib.showMenu('adminmenu_main')
    end,
    options = { 
        {label = 'This menu is empty', icon = "eye", args={},close=false}
    }
}, function(selected, scrollIndex, args)
    if args.event then
        TriggerEvent(args.event,scrollIndex)
    end
    if args.serverEvent then
        TriggerServerEvent(args.serverEvent,scrollIndex)
    end
end)
lib.registerMenu({
    id = 'adminmenu_trollmenu',
    title = 'Troll Menu',
    position = 'top-right',
    onSideScroll = function(selected, scrollIndex, args)
        if args.sideScroll then
            if args.event then
                TriggerEvent(args.event,scrollIndex)
            end
            if args.serverEvent then
                TriggerServerEvent(args.serverEvent,scrollIndex)
            end
        end
    end,
    onClose = function()
        lib.showMenu('adminmenu_main')
    end,
    options = {
        {label = 'This menu is empty', icon = "eye", args={},close=false} 
    }
}, function(selected, scrollIndex, args)
    if args.event then
        TriggerEvent(args.event,scrollIndex)
    end
    if args.serverEvent then
        TriggerServerEvent(args.serverEvent,scrollIndex)
    end
end)
lib.registerMenu({
    id = 'adminmenu_vehiclerelated',
    title = 'Vehicle Related Options',
    position = 'top-right',
    onSideScroll = function(selected, scrollIndex, args)
        if args.sideScroll then
            if args.event then
                TriggerEvent(args.event,scrollIndex)
            end
            if args.serverEvent then
                TriggerServerEvent(args.serverEvent,scrollIndex)
            end
        end
    end,
    onClose = function()
        lib.showMenu('adminmenu_main')
    end,
    options = { 
        {label = 'This menu is empty', icon = "eye", args={},close=false}
    }
}, function(selected, scrollIndex, args)
    if args.event then
        TriggerEvent(args.event,scrollIndex)
    end
    if args.serverEvent then
        TriggerServerEvent(args.serverEvent,scrollIndex)
    end
end)
lib.registerMenu({
    id = 'adminmenu_pedoptions',
    title = 'Ped Related Options',
    position = 'top-right',
    onSideScroll = function(selected, scrollIndex, args)
        if args.sideScroll then
            if args.event then
                TriggerEvent(args.event,scrollIndex)
            end
            if args.serverEvent then
                TriggerServerEvent(args.serverEvent,scrollIndex)
            end
        end
    end,
    onClose = function()
        TriggerEvent('ts-adminmenu:open:PlayerRelatedOptions')
    end,
    options = { 
        {label = 'This menu is empty', icon = "eye", args={},close=false}
    }
}, function(selected, scrollIndex, args)
    if args.event then
        TriggerEvent(args.event,scrollIndex)
    end
    if args.serverEvent then
        TriggerServerEvent(args.serverEvent,scrollIndex)
    end
end)
local spawneroptions = {
    {label = 'Spawn with Code', icon='car', description = 'Spawn vehicle with spawn name',args={event='ts-adminmenu:client:SpawnCode'}},
}
for k,v in pairs(vehicleslist) do
    spawneroptions[#spawneroptions+1] = {label = k, icon='car', values = v, args={serverEvent='ts-adminmenu:server:SpawnVehicle',category=k},close=false}
end
lib.registerMenu({
    id = 'adminmenu_vehiclespawner',
    title = 'Vehicle Spawner',
    position = 'top-right',
    onClose = function()
        TriggerEvent('ts-adminmenu:open:VehicleRelatedOptions')
    end,
    options = spawneroptions
}, function(selected, scrollIndex, args)
    if args.event then
        TriggerEvent(args.event)
    end
    if args.serverEvent then
        local veh = vehicleslist[args.category][scrollIndex]
        TriggerServerEvent(args.serverEvent,veh)
    end
end)
lib.registerMenu({
    id = 'adminmenu_onlineplayerseach',
    title = 'Player Options',
    position = 'top-right',
    onClose = function()
        TriggerEvent('ts-adminmenu:open:OnlinePlayers')
    end,
    options = {
        {label = 'This menu is empty', icon = "eye", args={},close=false}
    }
}, function(selected, scrollIndex, args)
    if args.event then
        TriggerEvent(args.event)
    end
    if args.serverEvent then
        TriggerServerEvent(args.serverEvent,selectedPlayer)
    end
end)
-------------------------------------------------------------------------
-----------------------------------MENUS---------------------------------
-------------------------------------------------------------------------
local TSNotif = function(msg)
    lib.notify({
        title = 'TS Admin Menu',
        description = msg,
        type = 'inform'
    })
end
RegisterCommand('addtsperms', function(source, args, raw)
    if IsPlayerAllowed('FullAccess') then
        local input = lib.inputDialog('TS Permission Manager', {
            { type = "input", label = "Player ID" },
            { type = 'select', label = 'Permission', options = {
                { value = "none", label = "None" },
                { value = "admin", label = "Admin" },
                { value = "FullAccess", label = "FullAccess" },
                { value = "OnlinePlayerOptions", label = "Online Player Options" },
                { value = "OnlinePlayerOptions.SendMessage", label = "Send Message" },
                { value = "OnlinePlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "OnlinePlayerOptions.ChangePed", label = "Change Ped" },
                { value = "OnlinePlayerOptions.OpenInventory", label = "Open Inventory" },
                { value = "OnlinePlayerOptions.SetJob", label = "Set Job" },
                { value = "OnlinePlayerOptions.GiveItemList", label = "Give Item(List)" },
                { value = "OnlinePlayerOptions.GiveItemCode", label = "Give Item(Code)" },
                { value = "OnlinePlayerOptions.GiveCar", label = "Give Car" },
                { value = "OnlinePlayerOptions.RemoveInventoryItem", label = "Remove Inventory Item" },
                { value = "OnlinePlayerOptions.HealPlayer", label = "Heal" },
                { value = "OnlinePlayerOptions.GiveAccountMoney", label = "Give Money" },
                { value = "OnlinePlayerOptions.RemoveAccountMoney", label = "Remove Money" },
                { value = "OnlinePlayerOptions.TPVeh", label = "TP Into Vehicle" }, 
                { value = "OnlinePlayerOptions.RevivePlayer", label = "Revive" },
                { value = "OnlinePlayerOptions.Goto", label = "Goto" },
                { value = "OnlinePlayerOptions.ToggleLicense", label = "Toggle License" },
                { value = "OnlinePlayerOptions.Bring", label = "Bring" },
                { value = "OnlinePlayerOptions.Waypoint", label = "Set Waypoint" },
                { value = "OnlinePlayerOptions.PrintID", label = "Print Identifiers" },
                { value = "OnlinePlayerOptions.KillPlayer", label = "Kill Player" },
                { value = "OnlinePlayerOptions.Kick", label = "Kick Player" },
                { value = "OnlinePlayerOptions.Spectate", label = "Spectate" },
                { value = "OnlinePlayerOptions.Screenshot", label = "Screenshot" },
                { value = "PlayerOptions", label = "Self Options" },
                { value = "PlayerOptions.Godmode", label = "God Mode" },
                { value = "PlayerOptions.Invisible", label = "Invisible" },
                { value = "PlayerOptions.UnlimitedStamina", label = "Unlimited Stamina" },
                { value = "PlayerOptions.FastRun", label = "Fast Run" },
                { value = "PlayerOptions.FastSwim", label = "Fast Swim" },
                { value = "PlayerOptions.SuperJump", label = "Super Jump" },
                { value = "PlayerOptions.NoRagdoll", label = "No Ragdoll" },
                { value = "PlayerOptions.NeverWanted", label = "Never Wanted" },
                { value = "PlayerOptions.StayInVeh", label = "Stay In Veh" },
                { value = "PlayerOptions.HealPlayer", label = "Heal" },
                { value = "PlayerOptions.RevivePlayer", label = "Revive" },
                { value = "PlayerOptions.SetArmor", label = "Armor" },
                { value = "PlayerOptions.CleanClothes", label = "Clean Clothes" },
                { value = "PlayerOptions.WetClothes", label = "Wet Clothes" },
                { value = "PlayerOptions.DryClothes", label = "Dry Clothes" },
                { value = "PlayerOptions.Suicide", label = "Suicide" },
                { value = "PlayerOptions.FreezePlayer", label = "Freeze Player" },
                { value = "PlayerOptions.Noclip", label = "Noclip" },
                { value = "PlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "PlayerOptions.ChangePed", label = "Change Ped" },
                { value = "VehicleOptions", label = "Vehicle Related Options" },
                { value = "VehicleOptions.Spawner", label = "Vehicle Spawner" },
                { value = "VehicleOptions.SpawnerCode", label = "Vehicle Spawner(Code)" },
                { value = "VehicleOptions.Modmenu", label = "Modmenu" },
                { value = "VehicleOptions.FreezeVehicle", label = "Freeze Vehicle" },
                { value = "VehicleOptions.ChangePlate", label = "Change Plate" },
                { value = "VehicleOptions.ToggleEngine", label = "Toggle Engine" },
                { value = "VehicleOptions.ToggleDoors", label = "Door Menu" },
                { value = "VehicleOptions.TorqueMultiplier", label = "Torque Multiplier" },
                { value = "VehicleOptions.EngineMultiplier", label = "Engine Multiplier" },
                { value = "VehicleOptions.FlipVehicle", label = "Flip Vehicle" },
                { value = "VehicleOptions.DeleteVehicle", label = "Delete Vehicle" },
                { value = "VehicleOptions.RefuelVehicle", label = "Refuel Vehicle" },
                { value = "VehicleOptions.BikeHelmet", label = "No Bike Helmet" },
                { value = "VehicleOptions.Godmode", label = "Vehicle Godmode" },
                { value = "VehicleOptions.RepairVehicle", label = "Repair Vehicle" },
                { value = "VehicleOptions.WashVehicle", label = "Wash Vehicle" },
                { value = "VehicleOptions.KeepClean", label = "Keep Vehicle Clean" },
                { value = "VehicleOptions.VehicleDirt", label = "Set Dirt" },
                { value = "VehicleOptions.UnlockVehicle", label = "Unlock Vehicle" },
                { value = "VehicleOptions.DeletePlate", label = "Delete Plate" },
                { value = "MiscSettings", label = "Misc Settings" },
                { value = "MiscSettings.TPM", label = "TPM" },
                { value = "MiscSettings.TPC", label = "TP Coords" },
                { value = "MiscSettings.ShowCoords", label = "Show Coords" },
                { value = "MiscSettings.CopyCoords", label = "Show Coords" },
                { value = "MiscSettings.PropSpawner", label = "Prop spawner" },
                { value = "MiscSettings.ClearArea", label = "Clear Area" },
                { value = "MiscSettings.ThermalVision", label = "Thermal Vision" },
                { value = "MiscSettings.NightVision", label = "Night Vision" },
                { value = "MiscSettings.PlayerBlips", label = "Player Blips" },
                { value = "MiscSettings.PlayerNames", label = "Player Names" },
                { value = "MiscSettings.Timecycle", label = "Timecycle" },
                { value = "MiscSettings.JoinQuitNotif", label = "Join-Quit Notification" },
                { value = "MiscSettings.KillNotif", label = "Death Notification" },
                { value = "MiscSettings.Announcement", label = "Announce" },
                { value = "MiscSettings.StaffChat", label = "Staff Chat" },
                { value = "MiscSettings.Relog", label = "Relog" },
                { value = "MiscSettings.BanPlayer", label = "Ban Player" },
                { value = "MiscSettings.UnbanPlayer", label = "Unban Player" },
                { value = "MiscSettings.DeleteLaser", label = "Delete Laser" },
                { value = "TrollMenu", label = "Troll Menu" },
                { value = "TrollMenu.Fart", label = "Fart" },
                { value = "TrollMenu.TruckPunchline", label = "Truck" },
                { value = "TrollMenu.ClownAttack", label = "Clown" },
                { value = "TrollMenu.MerryweatherAttack", label = "Merry" },
                { value = "TrollMenu.Flashbang", label = "Flash" },
                { value = "TrollMenu.FakeSound", label = "Fake Sound" },
                { value = "TrollMenu.LagGame", label = "Lag" },
                { value = "TrollMenu.BlowTyres", label = "Blow Tyre" },
                { value = "TrollMenu.Eject", label = "Eject" },
                { value = "TrollMenu.CrashGame", label = "Crash" },
                { value = "RockstarEditor", label = "Rockstar Editor" },
            } },
            { type = 'select', label = 'Permission', options = {
                { value = "none", label = "None" },
                { value = "admin", label = "Admin" },
                { value = "FullAccess", label = "FullAccess" },
                { value = "OnlinePlayerOptions", label = "Online Player Options" },
                { value = "OnlinePlayerOptions.SendMessage", label = "Send Message" },
                { value = "OnlinePlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "OnlinePlayerOptions.ChangePed", label = "Change Ped" },
                { value = "OnlinePlayerOptions.OpenInventory", label = "Open Inventory" },
                { value = "OnlinePlayerOptions.SetJob", label = "Set Job" },
                { value = "OnlinePlayerOptions.GiveItemList", label = "Give Item(List)" },
                { value = "OnlinePlayerOptions.GiveItemCode", label = "Give Item(Code)" },
                { value = "OnlinePlayerOptions.GiveCar", label = "Give Car" },
                { value = "OnlinePlayerOptions.RemoveInventoryItem", label = "Remove Inventory Item" },
                { value = "OnlinePlayerOptions.HealPlayer", label = "Heal" },
                { value = "OnlinePlayerOptions.GiveAccountMoney", label = "Give Money" },
                { value = "OnlinePlayerOptions.RemoveAccountMoney", label = "Remove Money" },
                { value = "OnlinePlayerOptions.TPVeh", label = "TP Into Vehicle" },
                
                { value = "OnlinePlayerOptions.RevivePlayer", label = "Revive" },
                { value = "OnlinePlayerOptions.Goto", label = "Goto" },
                { value = "OnlinePlayerOptions.ToggleLicense", label = "Toggle License" },
                { value = "OnlinePlayerOptions.Bring", label = "Bring" },
                { value = "OnlinePlayerOptions.Waypoint", label = "Set Waypoint" },
                { value = "OnlinePlayerOptions.PrintID", label = "Print Identifiers" },
                { value = "OnlinePlayerOptions.KillPlayer", label = "Kill Player" },
                { value = "OnlinePlayerOptions.Kick", label = "Kick Player" },
                { value = "OnlinePlayerOptions.Spectate", label = "Spectate" },
                { value = "OnlinePlayerOptions.Screenshot", label = "Screenshot" },
                { value = "PlayerOptions", label = "Self Options" },
                { value = "PlayerOptions.Godmode", label = "God Mode" },
                { value = "PlayerOptions.Invisible", label = "Invisible" },
                { value = "PlayerOptions.UnlimitedStamina", label = "Unlimited Stamina" },
                { value = "PlayerOptions.FastRun", label = "Fast Run" },
                { value = "PlayerOptions.FastSwim", label = "Fast Swim" },
                { value = "PlayerOptions.SuperJump", label = "Super Jump" },
                { value = "PlayerOptions.NoRagdoll", label = "No Ragdoll" },
                { value = "PlayerOptions.NeverWanted", label = "Never Wanted" },
                { value = "PlayerOptions.StayInVeh", label = "Stay In Veh" },
                { value = "PlayerOptions.HealPlayer", label = "Heal" },
                { value = "PlayerOptions.RevivePlayer", label = "Revive" },
                { value = "PlayerOptions.SetArmor", label = "Armor" },
                { value = "PlayerOptions.CleanClothes", label = "Clean Clothes" },
                { value = "PlayerOptions.WetClothes", label = "Wet Clothes" },
                { value = "PlayerOptions.DryClothes", label = "Dry Clothes" },
                { value = "PlayerOptions.Suicide", label = "Suicide" },
                { value = "PlayerOptions.FreezePlayer", label = "Freeze Player" },
                { value = "PlayerOptions.Noclip", label = "Noclip" },
                { value = "PlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "PlayerOptions.ChangePed", label = "Change Ped" },
                { value = "VehicleOptions", label = "Vehicle Related Options" },
                { value = "VehicleOptions.Spawner", label = "Vehicle Spawner" },
                { value = "VehicleOptions.SpawnerCode", label = "Vehicle Spawner(Code)" },
                { value = "VehicleOptions.Modmenu", label = "Modmenu" },
                { value = "VehicleOptions.FreezeVehicle", label = "Freeze Vehicle" },
                { value = "VehicleOptions.ChangePlate", label = "Change Plate" },
                { value = "VehicleOptions.ToggleEngine", label = "Toggle Engine" },
                { value = "VehicleOptions.ToggleDoors", label = "Door Menu" },
                { value = "VehicleOptions.TorqueMultiplier", label = "Torque Multiplier" },
                { value = "VehicleOptions.EngineMultiplier", label = "Engine Multiplier" },
                { value = "VehicleOptions.FlipVehicle", label = "Flip Vehicle" },
                { value = "VehicleOptions.DeleteVehicle", label = "Delete Vehicle" },
                { value = "VehicleOptions.RefuelVehicle", label = "Refuel Vehicle" },
                { value = "VehicleOptions.BikeHelmet", label = "No Bike Helmet" },
                { value = "VehicleOptions.Godmode", label = "Vehicle Godmode" },
                { value = "VehicleOptions.RepairVehicle", label = "Repair Vehicle" },
                { value = "VehicleOptions.WashVehicle", label = "Wash Vehicle" },
                { value = "VehicleOptions.KeepClean", label = "Keep Vehicle Clean" },
                { value = "VehicleOptions.VehicleDirt", label = "Set Dirt" },
                { value = "VehicleOptions.UnlockVehicle", label = "Unlock Vehicle" },
                { value = "VehicleOptions.DeletePlate", label = "Delete Plate" },
                { value = "MiscSettings", label = "Misc Settings" },
                { value = "MiscSettings.TPM", label = "TPM" },
                { value = "MiscSettings.TPC", label = "TP Coords" },
                { value = "MiscSettings.ShowCoords", label = "Show Coords" },
                { value = "MiscSettings.CopyCoords", label = "Show Coords" },
                { value = "MiscSettings.PropSpawner", label = "Prop spawner" },
                { value = "MiscSettings.ClearArea", label = "Clear Area" },
                { value = "MiscSettings.ThermalVision", label = "Thermal Vision" },
                { value = "MiscSettings.NightVision", label = "Night Vision" },
                { value = "MiscSettings.PlayerBlips", label = "Player Blips" },
                { value = "MiscSettings.PlayerNames", label = "Player Names" },
                { value = "MiscSettings.Timecycle", label = "Timecycle" },
                { value = "MiscSettings.JoinQuitNotif", label = "Join-Quit Notification" },
                { value = "MiscSettings.KillNotif", label = "Death Notification" },
                { value = "MiscSettings.Announcement", label = "Announce" },
                { value = "MiscSettings.StaffChat", label = "Staff Chat" },
                { value = "MiscSettings.Relog", label = "Relog" },
                { value = "MiscSettings.BanPlayer", label = "Ban Player" },
                { value = "MiscSettings.UnbanPlayer", label = "Unban Player" },
                { value = "MiscSettings.DeleteLaser", label = "Delete Laser" },
                { value = "TrollMenu", label = "Troll Menu" },
                { value = "TrollMenu.Fart", label = "Fart" },
                { value = "TrollMenu.TruckPunchline", label = "Truck" },
                { value = "TrollMenu.ClownAttack", label = "Clown" },
                { value = "TrollMenu.MerryweatherAttack", label = "Merry" },
                { value = "TrollMenu.Flashbang", label = "Flash" },
                { value = "TrollMenu.FakeSound", label = "Fake Sound" },
                { value = "TrollMenu.LagGame", label = "Lag" },
                { value = "TrollMenu.BlowTyres", label = "Blow Tyre" },
                { value = "TrollMenu.Eject", label = "Eject" },
                { value = "TrollMenu.CrashGame", label = "Crash" },
                { value = "RockstarEditor", label = "Rockstar Editor" },
            } },
            { type = 'select', label = 'Permission', options = {
                { value = "none", label = "None" },
                { value = "admin", label = "Admin" },
                { value = "FullAccess", label = "FullAccess" },
                { value = "OnlinePlayerOptions", label = "Online Player Options" },
                { value = "OnlinePlayerOptions.SendMessage", label = "Send Message" },
                { value = "OnlinePlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "OnlinePlayerOptions.ChangePed", label = "Change Ped" },
                { value = "OnlinePlayerOptions.OpenInventory", label = "Open Inventory" },
                { value = "OnlinePlayerOptions.SetJob", label = "Set Job" },
                { value = "OnlinePlayerOptions.GiveItemList", label = "Give Item(List)" },
                { value = "OnlinePlayerOptions.GiveItemCode", label = "Give Item(Code)" },
                { value = "OnlinePlayerOptions.GiveCar", label = "Give Car" },
                { value = "OnlinePlayerOptions.RemoveInventoryItem", label = "Remove Inventory Item" },
                { value = "OnlinePlayerOptions.HealPlayer", label = "Heal" },
                { value = "OnlinePlayerOptions.GiveAccountMoney", label = "Give Money" },
                { value = "OnlinePlayerOptions.RemoveAccountMoney", label = "Remove Money" },
                { value = "OnlinePlayerOptions.TPVeh", label = "TP Into Vehicle" },
                
                { value = "OnlinePlayerOptions.RevivePlayer", label = "Revive" },
                { value = "OnlinePlayerOptions.Goto", label = "Goto" },
                { value = "OnlinePlayerOptions.ToggleLicense", label = "Toggle License" },
                { value = "OnlinePlayerOptions.Bring", label = "Bring" },
                { value = "OnlinePlayerOptions.Waypoint", label = "Set Waypoint" },
                { value = "OnlinePlayerOptions.PrintID", label = "Print Identifiers" },
                { value = "OnlinePlayerOptions.KillPlayer", label = "Kill Player" },
                { value = "OnlinePlayerOptions.Kick", label = "Kick Player" },
                { value = "OnlinePlayerOptions.Spectate", label = "Spectate" },
                { value = "OnlinePlayerOptions.Screenshot", label = "Screenshot" },
                { value = "PlayerOptions", label = "Self Options" },
                { value = "PlayerOptions.Godmode", label = "God Mode" },
                { value = "PlayerOptions.Invisible", label = "Invisible" },
                { value = "PlayerOptions.UnlimitedStamina", label = "Unlimited Stamina" },
                { value = "PlayerOptions.FastRun", label = "Fast Run" },
                { value = "PlayerOptions.FastSwim", label = "Fast Swim" },
                { value = "PlayerOptions.SuperJump", label = "Super Jump" },
                { value = "PlayerOptions.NoRagdoll", label = "No Ragdoll" },
                { value = "PlayerOptions.NeverWanted", label = "Never Wanted" },
                { value = "PlayerOptions.StayInVeh", label = "Stay In Veh" },
                { value = "PlayerOptions.HealPlayer", label = "Heal" },
                { value = "PlayerOptions.RevivePlayer", label = "Revive" },
                { value = "PlayerOptions.SetArmor", label = "Armor" },
                { value = "PlayerOptions.CleanClothes", label = "Clean Clothes" },
                { value = "PlayerOptions.WetClothes", label = "Wet Clothes" },
                { value = "PlayerOptions.DryClothes", label = "Dry Clothes" },
                { value = "PlayerOptions.Suicide", label = "Suicide" },
                { value = "PlayerOptions.FreezePlayer", label = "Freeze Player" },
                { value = "PlayerOptions.Noclip", label = "Noclip" },
                { value = "PlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "PlayerOptions.ChangePed", label = "Change Ped" },
                { value = "VehicleOptions", label = "Vehicle Related Options" },
                { value = "VehicleOptions.Spawner", label = "Vehicle Spawner" },
                { value = "VehicleOptions.SpawnerCode", label = "Vehicle Spawner(Code)" },
                { value = "VehicleOptions.Modmenu", label = "Modmenu" },
                { value = "VehicleOptions.FreezeVehicle", label = "Freeze Vehicle" },
                { value = "VehicleOptions.ChangePlate", label = "Change Plate" },
                { value = "VehicleOptions.ToggleEngine", label = "Toggle Engine" },
                { value = "VehicleOptions.ToggleDoors", label = "Door Menu" },
                { value = "VehicleOptions.TorqueMultiplier", label = "Torque Multiplier" },
                { value = "VehicleOptions.EngineMultiplier", label = "Engine Multiplier" },
                { value = "VehicleOptions.FlipVehicle", label = "Flip Vehicle" },
                { value = "VehicleOptions.DeleteVehicle", label = "Delete Vehicle" },
                { value = "VehicleOptions.RefuelVehicle", label = "Refuel Vehicle" },
                { value = "VehicleOptions.BikeHelmet", label = "No Bike Helmet" },
                { value = "VehicleOptions.Godmode", label = "Vehicle Godmode" },
                { value = "VehicleOptions.RepairVehicle", label = "Repair Vehicle" },
                { value = "VehicleOptions.WashVehicle", label = "Wash Vehicle" },
                { value = "VehicleOptions.KeepClean", label = "Keep Vehicle Clean" },
                { value = "VehicleOptions.VehicleDirt", label = "Set Dirt" },
                { value = "VehicleOptions.UnlockVehicle", label = "Unlock Vehicle" },
                { value = "VehicleOptions.DeletePlate", label = "Delete Plate" },
                { value = "MiscSettings", label = "Misc Settings" },
                { value = "MiscSettings.TPM", label = "TPM" },
                { value = "MiscSettings.TPC", label = "TP Coords" },
                { value = "MiscSettings.ShowCoords", label = "Show Coords" },
                { value = "MiscSettings.CopyCoords", label = "Show Coords" },
                { value = "MiscSettings.PropSpawner", label = "Prop spawner" },
                { value = "MiscSettings.ClearArea", label = "Clear Area" },
                { value = "MiscSettings.ThermalVision", label = "Thermal Vision" },
                { value = "MiscSettings.NightVision", label = "Night Vision" },
                { value = "MiscSettings.PlayerBlips", label = "Player Blips" },
                { value = "MiscSettings.PlayerNames", label = "Player Names" },
                { value = "MiscSettings.Timecycle", label = "Timecycle" },
                { value = "MiscSettings.JoinQuitNotif", label = "Join-Quit Notification" },
                { value = "MiscSettings.KillNotif", label = "Death Notification" },
                { value = "MiscSettings.Announcement", label = "Announce" },
                { value = "MiscSettings.StaffChat", label = "Staff Chat" },
                { value = "MiscSettings.Relog", label = "Relog" },
                { value = "MiscSettings.BanPlayer", label = "Ban Player" },
                { value = "MiscSettings.UnbanPlayer", label = "Unban Player" },
                { value = "MiscSettings.DeleteLaser", label = "Delete Laser" },
                { value = "TrollMenu", label = "Troll Menu" },
                { value = "TrollMenu.Fart", label = "Fart" },
                { value = "TrollMenu.TruckPunchline", label = "Truck" },
                { value = "TrollMenu.ClownAttack", label = "Clown" },
                { value = "TrollMenu.MerryweatherAttack", label = "Merry" },
                { value = "TrollMenu.Flashbang", label = "Flash" },
                { value = "TrollMenu.FakeSound", label = "Fake Sound" },
                { value = "TrollMenu.LagGame", label = "Lag" },
                { value = "TrollMenu.BlowTyres", label = "Blow Tyre" },
                { value = "TrollMenu.Eject", label = "Eject" },
                { value = "TrollMenu.CrashGame", label = "Crash" },
                { value = "RockstarEditor", label = "Rockstar Editor" },
            } },
            { type = 'select', label = 'Permission', options = {
                { value = "none", label = "None" },
                { value = "admin", label = "Admin" },
                { value = "FullAccess", label = "FullAccess" },
                { value = "OnlinePlayerOptions", label = "Online Player Options" },
                { value = "OnlinePlayerOptions.SendMessage", label = "Send Message" },
                { value = "OnlinePlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "OnlinePlayerOptions.ChangePed", label = "Change Ped" },
                { value = "OnlinePlayerOptions.OpenInventory", label = "Open Inventory" },
                { value = "OnlinePlayerOptions.SetJob", label = "Set Job" },
                { value = "OnlinePlayerOptions.GiveItemList", label = "Give Item(List)" },
                { value = "OnlinePlayerOptions.GiveItemCode", label = "Give Item(Code)" },
                { value = "OnlinePlayerOptions.GiveCar", label = "Give Car" },
                { value = "OnlinePlayerOptions.RemoveInventoryItem", label = "Remove Inventory Item" },
                { value = "OnlinePlayerOptions.HealPlayer", label = "Heal" },
                { value = "OnlinePlayerOptions.GiveAccountMoney", label = "Give Money" },
                { value = "OnlinePlayerOptions.RemoveAccountMoney", label = "Remove Money" },
                { value = "OnlinePlayerOptions.TPVeh", label = "TP Into Vehicle" },
                
                { value = "OnlinePlayerOptions.RevivePlayer", label = "Revive" },
                { value = "OnlinePlayerOptions.Goto", label = "Goto" },
                { value = "OnlinePlayerOptions.ToggleLicense", label = "Toggle License" },
                { value = "OnlinePlayerOptions.Bring", label = "Bring" },
                { value = "OnlinePlayerOptions.Waypoint", label = "Set Waypoint" },
                { value = "OnlinePlayerOptions.PrintID", label = "Print Identifiers" },
                { value = "OnlinePlayerOptions.KillPlayer", label = "Kill Player" },
                { value = "OnlinePlayerOptions.Kick", label = "Kick Player" },
                { value = "OnlinePlayerOptions.Spectate", label = "Spectate" },
                { value = "OnlinePlayerOptions.Screenshot", label = "Screenshot" },
                { value = "PlayerOptions", label = "Self Options" },
                { value = "PlayerOptions.Godmode", label = "God Mode" },
                { value = "PlayerOptions.Invisible", label = "Invisible" },
                { value = "PlayerOptions.UnlimitedStamina", label = "Unlimited Stamina" },
                { value = "PlayerOptions.FastRun", label = "Fast Run" },
                { value = "PlayerOptions.FastSwim", label = "Fast Swim" },
                { value = "PlayerOptions.SuperJump", label = "Super Jump" },
                { value = "PlayerOptions.NoRagdoll", label = "No Ragdoll" },
                { value = "PlayerOptions.NeverWanted", label = "Never Wanted" },
                { value = "PlayerOptions.StayInVeh", label = "Stay In Veh" },
                { value = "PlayerOptions.HealPlayer", label = "Heal" },
                { value = "PlayerOptions.RevivePlayer", label = "Revive" },
                { value = "PlayerOptions.SetArmor", label = "Armor" },
                { value = "PlayerOptions.CleanClothes", label = "Clean Clothes" },
                { value = "PlayerOptions.WetClothes", label = "Wet Clothes" },
                { value = "PlayerOptions.DryClothes", label = "Dry Clothes" },
                { value = "PlayerOptions.Suicide", label = "Suicide" },
                { value = "PlayerOptions.FreezePlayer", label = "Freeze Player" },
                { value = "PlayerOptions.Noclip", label = "Noclip" },
                { value = "PlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "PlayerOptions.ChangePed", label = "Change Ped" },
                { value = "VehicleOptions", label = "Vehicle Related Options" },
                { value = "VehicleOptions.Spawner", label = "Vehicle Spawner" },
                { value = "VehicleOptions.SpawnerCode", label = "Vehicle Spawner(Code)" },
                { value = "VehicleOptions.Modmenu", label = "Modmenu" },
                { value = "VehicleOptions.FreezeVehicle", label = "Freeze Vehicle" },
                { value = "VehicleOptions.ChangePlate", label = "Change Plate" },
                { value = "VehicleOptions.ToggleEngine", label = "Toggle Engine" },
                { value = "VehicleOptions.ToggleDoors", label = "Door Menu" },
                { value = "VehicleOptions.TorqueMultiplier", label = "Torque Multiplier" },
                { value = "VehicleOptions.EngineMultiplier", label = "Engine Multiplier" },
                { value = "VehicleOptions.FlipVehicle", label = "Flip Vehicle" },
                { value = "VehicleOptions.DeleteVehicle", label = "Delete Vehicle" },
                { value = "VehicleOptions.RefuelVehicle", label = "Refuel Vehicle" },
                { value = "VehicleOptions.BikeHelmet", label = "No Bike Helmet" },
                { value = "VehicleOptions.Godmode", label = "Vehicle Godmode" },
                { value = "VehicleOptions.RepairVehicle", label = "Repair Vehicle" },
                { value = "VehicleOptions.WashVehicle", label = "Wash Vehicle" },
                { value = "VehicleOptions.KeepClean", label = "Keep Vehicle Clean" },
                { value = "VehicleOptions.VehicleDirt", label = "Set Dirt" },
                { value = "VehicleOptions.UnlockVehicle", label = "Unlock Vehicle" },
                { value = "VehicleOptions.DeletePlate", label = "Delete Plate" },
                { value = "MiscSettings", label = "Misc Settings" },
                { value = "MiscSettings.TPM", label = "TPM" },
                { value = "MiscSettings.TPC", label = "TP Coords" },
                { value = "MiscSettings.ShowCoords", label = "Show Coords" },
                { value = "MiscSettings.CopyCoords", label = "Show Coords" },
                { value = "MiscSettings.PropSpawner", label = "Prop spawner" },
                { value = "MiscSettings.ClearArea", label = "Clear Area" },
                { value = "MiscSettings.ThermalVision", label = "Thermal Vision" },
                { value = "MiscSettings.NightVision", label = "Night Vision" },
                { value = "MiscSettings.PlayerBlips", label = "Player Blips" },
                { value = "MiscSettings.PlayerNames", label = "Player Names" },
                { value = "MiscSettings.Timecycle", label = "Timecycle" },
                { value = "MiscSettings.JoinQuitNotif", label = "Join-Quit Notification" },
                { value = "MiscSettings.KillNotif", label = "Death Notification" },
                { value = "MiscSettings.Announcement", label = "Announce" },
                { value = "MiscSettings.StaffChat", label = "Staff Chat" },
                { value = "MiscSettings.Relog", label = "Relog" },
                { value = "MiscSettings.BanPlayer", label = "Ban Player" },
                { value = "MiscSettings.UnbanPlayer", label = "Unban Player" },
                { value = "MiscSettings.DeleteLaser", label = "Delete Laser" },
                { value = "TrollMenu", label = "Troll Menu" },
                { value = "TrollMenu.Fart", label = "Fart" },
                { value = "TrollMenu.TruckPunchline", label = "Truck" },
                { value = "TrollMenu.ClownAttack", label = "Clown" },
                { value = "TrollMenu.MerryweatherAttack", label = "Merry" },
                { value = "TrollMenu.Flashbang", label = "Flash" },
                { value = "TrollMenu.FakeSound", label = "Fake Sound" },
                { value = "TrollMenu.LagGame", label = "Lag" },
                { value = "TrollMenu.BlowTyres", label = "Blow Tyre" },
                { value = "TrollMenu.Eject", label = "Eject" },
                { value = "TrollMenu.CrashGame", label = "Crash" },
                { value = "RockstarEditor", label = "Rockstar Editor" },
            } },
            { type = 'select', label = 'Permission', options = {
                { value = "none", label = "None" },
                { value = "admin", label = "Admin" },
                { value = "FullAccess", label = "FullAccess" },
                { value = "OnlinePlayerOptions", label = "Online Player Options" },
                { value = "OnlinePlayerOptions.SendMessage", label = "Send Message" },
                { value = "OnlinePlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "OnlinePlayerOptions.ChangePed", label = "Change Ped" },
                { value = "OnlinePlayerOptions.OpenInventory", label = "Open Inventory" },
                { value = "OnlinePlayerOptions.SetJob", label = "Set Job" },
                { value = "OnlinePlayerOptions.GiveItemList", label = "Give Item(List)" },
                { value = "OnlinePlayerOptions.GiveItemCode", label = "Give Item(Code)" },
                { value = "OnlinePlayerOptions.GiveCar", label = "Give Car" },
                { value = "OnlinePlayerOptions.RemoveInventoryItem", label = "Remove Inventory Item" },
                { value = "OnlinePlayerOptions.HealPlayer", label = "Heal" },
                { value = "OnlinePlayerOptions.GiveAccountMoney", label = "Give Money" },
                { value = "OnlinePlayerOptions.RemoveAccountMoney", label = "Remove Money" },
                { value = "OnlinePlayerOptions.TPVeh", label = "TP Into Vehicle" },
                
                { value = "OnlinePlayerOptions.RevivePlayer", label = "Revive" },
                { value = "OnlinePlayerOptions.Goto", label = "Goto" },
                { value = "OnlinePlayerOptions.ToggleLicense", label = "Toggle License" },
                { value = "OnlinePlayerOptions.Bring", label = "Bring" },
                { value = "OnlinePlayerOptions.Waypoint", label = "Set Waypoint" },
                { value = "OnlinePlayerOptions.PrintID", label = "Print Identifiers" },
                { value = "OnlinePlayerOptions.KillPlayer", label = "Kill Player" },
                { value = "OnlinePlayerOptions.Kick", label = "Kick Player" },
                { value = "OnlinePlayerOptions.Spectate", label = "Spectate" },
                { value = "OnlinePlayerOptions.Screenshot", label = "Screenshot" },
                { value = "PlayerOptions", label = "Self Options" },
                { value = "PlayerOptions.Godmode", label = "God Mode" },
                { value = "PlayerOptions.Invisible", label = "Invisible" },
                { value = "PlayerOptions.UnlimitedStamina", label = "Unlimited Stamina" },
                { value = "PlayerOptions.FastRun", label = "Fast Run" },
                { value = "PlayerOptions.FastSwim", label = "Fast Swim" },
                { value = "PlayerOptions.SuperJump", label = "Super Jump" },
                { value = "PlayerOptions.NoRagdoll", label = "No Ragdoll" },
                { value = "PlayerOptions.NeverWanted", label = "Never Wanted" },
                { value = "PlayerOptions.StayInVeh", label = "Stay In Veh" },
                { value = "PlayerOptions.HealPlayer", label = "Heal" },
                { value = "PlayerOptions.RevivePlayer", label = "Revive" },
                { value = "PlayerOptions.SetArmor", label = "Armor" },
                { value = "PlayerOptions.CleanClothes", label = "Clean Clothes" },
                { value = "PlayerOptions.WetClothes", label = "Wet Clothes" },
                { value = "PlayerOptions.DryClothes", label = "Dry Clothes" },
                { value = "PlayerOptions.Suicide", label = "Suicide" },
                { value = "PlayerOptions.FreezePlayer", label = "Freeze Player" },
                { value = "PlayerOptions.Noclip", label = "Noclip" },
                { value = "PlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "PlayerOptions.ChangePed", label = "Change Ped" },
                { value = "VehicleOptions", label = "Vehicle Related Options" },
                { value = "VehicleOptions.Spawner", label = "Vehicle Spawner" },
                { value = "VehicleOptions.SpawnerCode", label = "Vehicle Spawner(Code)" },
                { value = "VehicleOptions.Modmenu", label = "Modmenu" },
                { value = "VehicleOptions.FreezeVehicle", label = "Freeze Vehicle" },
                { value = "VehicleOptions.ChangePlate", label = "Change Plate" },
                { value = "VehicleOptions.ToggleEngine", label = "Toggle Engine" },
                { value = "VehicleOptions.ToggleDoors", label = "Door Menu" },
                { value = "VehicleOptions.TorqueMultiplier", label = "Torque Multiplier" },
                { value = "VehicleOptions.EngineMultiplier", label = "Engine Multiplier" },
                { value = "VehicleOptions.FlipVehicle", label = "Flip Vehicle" },
                { value = "VehicleOptions.DeleteVehicle", label = "Delete Vehicle" },
                { value = "VehicleOptions.RefuelVehicle", label = "Refuel Vehicle" },
                { value = "VehicleOptions.BikeHelmet", label = "No Bike Helmet" },
                { value = "VehicleOptions.Godmode", label = "Vehicle Godmode" },
                { value = "VehicleOptions.RepairVehicle", label = "Repair Vehicle" },
                { value = "VehicleOptions.WashVehicle", label = "Wash Vehicle" },
                { value = "VehicleOptions.KeepClean", label = "Keep Vehicle Clean" },
                { value = "VehicleOptions.VehicleDirt", label = "Set Dirt" },
                { value = "VehicleOptions.UnlockVehicle", label = "Unlock Vehicle" },
                { value = "VehicleOptions.DeletePlate", label = "Delete Plate" },
                { value = "MiscSettings", label = "Misc Settings" },
                { value = "MiscSettings.TPM", label = "TPM" },
                { value = "MiscSettings.TPC", label = "TP Coords" },
                { value = "MiscSettings.ShowCoords", label = "Show Coords" },
                { value = "MiscSettings.CopyCoords", label = "Show Coords" },
                { value = "MiscSettings.PropSpawner", label = "Prop spawner" },
                { value = "MiscSettings.ClearArea", label = "Clear Area" },
                { value = "MiscSettings.ThermalVision", label = "Thermal Vision" },
                { value = "MiscSettings.NightVision", label = "Night Vision" },
                { value = "MiscSettings.PlayerBlips", label = "Player Blips" },
                { value = "MiscSettings.PlayerNames", label = "Player Names" },
                { value = "MiscSettings.Timecycle", label = "Timecycle" },
                { value = "MiscSettings.JoinQuitNotif", label = "Join-Quit Notification" },
                { value = "MiscSettings.KillNotif", label = "Death Notification" },
                { value = "MiscSettings.Announcement", label = "Announce" },
                { value = "MiscSettings.StaffChat", label = "Staff Chat" },
                { value = "MiscSettings.Relog", label = "Relog" },
                { value = "MiscSettings.BanPlayer", label = "Ban Player" },
                { value = "MiscSettings.UnbanPlayer", label = "Unban Player" },
                { value = "MiscSettings.DeleteLaser", label = "Delete Laser" },
                { value = "TrollMenu", label = "Troll Menu" },
                { value = "TrollMenu.Fart", label = "Fart" },
                { value = "TrollMenu.TruckPunchline", label = "Truck" },
                { value = "TrollMenu.ClownAttack", label = "Clown" },
                { value = "TrollMenu.MerryweatherAttack", label = "Merry" },
                { value = "TrollMenu.Flashbang", label = "Flash" },
                { value = "TrollMenu.FakeSound", label = "Fake Sound" },
                { value = "TrollMenu.LagGame", label = "Lag" },
                { value = "TrollMenu.BlowTyres", label = "Blow Tyre" },
                { value = "TrollMenu.Eject", label = "Eject" },
                { value = "TrollMenu.CrashGame", label = "Crash" },
                { value = "RockstarEditor", label = "Rockstar Editor" },
            } },
        })
        TriggerServerEvent('ts-adminmenu:server:AddPerms', input)
    end
end)
RegisterCommand('removetsperms', function(source, args, raw)
    if IsPlayerAllowed('FullAccess') then
        local input = lib.inputDialog('TS Permission Manager', {
            { type = "input", label = "Player ID" },
            { type = 'select', label = 'Permission', options = {
                { value = "none", label = "None" },
                { value = "admin", label = "Admin" },
                { value = "FullAccess", label = "FullAccess" },
                { value = "OnlinePlayerOptions", label = "Online Player Options" },
                { value = "OnlinePlayerOptions.SendMessage", label = "Send Message" },
                { value = "OnlinePlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "OnlinePlayerOptions.ChangePed", label = "Change Ped" },
                { value = "OnlinePlayerOptions.OpenInventory", label = "Open Inventory" },
                { value = "OnlinePlayerOptions.SetJob", label = "Set Job" },
                { value = "OnlinePlayerOptions.GiveItemList", label = "Give Item(List)" },
                { value = "OnlinePlayerOptions.GiveItemCode", label = "Give Item(Code)" },
                { value = "OnlinePlayerOptions.GiveCar", label = "Give Car" },
                { value = "OnlinePlayerOptions.RemoveInventoryItem", label = "Remove Inventory Item" },
                { value = "OnlinePlayerOptions.HealPlayer", label = "Heal" },
                { value = "OnlinePlayerOptions.GiveAccountMoney", label = "Give Money" },
                { value = "OnlinePlayerOptions.RemoveAccountMoney", label = "Remove Money" },
                { value = "OnlinePlayerOptions.TPVeh", label = "TP Into Vehicle" },
                
                { value = "OnlinePlayerOptions.RevivePlayer", label = "Revive" },
                { value = "OnlinePlayerOptions.Goto", label = "Goto" },
                { value = "OnlinePlayerOptions.ToggleLicense", label = "Toggle License" },
                { value = "OnlinePlayerOptions.Bring", label = "Bring" },
                { value = "OnlinePlayerOptions.Waypoint", label = "Set Waypoint" },
                { value = "OnlinePlayerOptions.PrintID", label = "Print Identifiers" },
                { value = "OnlinePlayerOptions.KillPlayer", label = "Kill Player" },
                { value = "OnlinePlayerOptions.Kick", label = "Kick Player" },
                { value = "OnlinePlayerOptions.Spectate", label = "Spectate" },
                { value = "OnlinePlayerOptions.Screenshot", label = "Screenshot" },
                { value = "PlayerOptions", label = "Self Options" },
                { value = "PlayerOptions.Godmode", label = "God Mode" },
                { value = "PlayerOptions.Invisible", label = "Invisible" },
                { value = "PlayerOptions.UnlimitedStamina", label = "Unlimited Stamina" },
                { value = "PlayerOptions.FastRun", label = "Fast Run" },
                { value = "PlayerOptions.FastSwim", label = "Fast Swim" },
                { value = "PlayerOptions.SuperJump", label = "Super Jump" },
                { value = "PlayerOptions.NoRagdoll", label = "No Ragdoll" },
                { value = "PlayerOptions.NeverWanted", label = "Never Wanted" },
                { value = "PlayerOptions.StayInVeh", label = "Stay In Veh" },
                { value = "PlayerOptions.HealPlayer", label = "Heal" },
                { value = "PlayerOptions.RevivePlayer", label = "Revive" },
                { value = "PlayerOptions.SetArmor", label = "Armor" },
                { value = "PlayerOptions.CleanClothes", label = "Clean Clothes" },
                { value = "PlayerOptions.WetClothes", label = "Wet Clothes" },
                { value = "PlayerOptions.DryClothes", label = "Dry Clothes" },
                { value = "PlayerOptions.Suicide", label = "Suicide" },
                { value = "PlayerOptions.FreezePlayer", label = "Freeze Player" },
                { value = "PlayerOptions.Noclip", label = "Noclip" },
                { value = "PlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "PlayerOptions.ChangePed", label = "Change Ped" },
                { value = "VehicleOptions", label = "Vehicle Related Options" },
                { value = "VehicleOptions.Spawner", label = "Vehicle Spawner" },
                { value = "VehicleOptions.SpawnerCode", label = "Vehicle Spawner(Code)" },
                { value = "VehicleOptions.Modmenu", label = "Modmenu" },
                { value = "VehicleOptions.FreezeVehicle", label = "Freeze Vehicle" },
                { value = "VehicleOptions.ChangePlate", label = "Change Plate" },
                { value = "VehicleOptions.ToggleEngine", label = "Toggle Engine" },
                { value = "VehicleOptions.ToggleDoors", label = "Door Menu" },
                { value = "VehicleOptions.TorqueMultiplier", label = "Torque Multiplier" },
                { value = "VehicleOptions.EngineMultiplier", label = "Engine Multiplier" },
                { value = "VehicleOptions.FlipVehicle", label = "Flip Vehicle" },
                { value = "VehicleOptions.DeleteVehicle", label = "Delete Vehicle" },
                { value = "VehicleOptions.RefuelVehicle", label = "Refuel Vehicle" },
                { value = "VehicleOptions.BikeHelmet", label = "No Bike Helmet" },
                { value = "VehicleOptions.Godmode", label = "Vehicle Godmode" },
                { value = "VehicleOptions.RepairVehicle", label = "Repair Vehicle" },
                { value = "VehicleOptions.WashVehicle", label = "Wash Vehicle" },
                { value = "VehicleOptions.KeepClean", label = "Keep Vehicle Clean" },
                { value = "VehicleOptions.VehicleDirt", label = "Set Dirt" },
                { value = "VehicleOptions.UnlockVehicle", label = "Unlock Vehicle" },
                { value = "VehicleOptions.DeletePlate", label = "Delete Plate" },
                { value = "MiscSettings", label = "Misc Settings" },
                { value = "MiscSettings.TPM", label = "TPM" },
                { value = "MiscSettings.TPC", label = "TP Coords" },
                { value = "MiscSettings.ShowCoords", label = "Show Coords" },
                { value = "MiscSettings.CopyCoords", label = "Show Coords" },
                { value = "MiscSettings.PropSpawner", label = "Prop spawner" },
                { value = "MiscSettings.ClearArea", label = "Clear Area" },
                { value = "MiscSettings.ThermalVision", label = "Thermal Vision" },
                { value = "MiscSettings.NightVision", label = "Night Vision" },
                { value = "MiscSettings.PlayerBlips", label = "Player Blips" },
                { value = "MiscSettings.PlayerNames", label = "Player Names" },
                { value = "MiscSettings.Timecycle", label = "Timecycle" },
                { value = "MiscSettings.JoinQuitNotif", label = "Join-Quit Notification" },
                { value = "MiscSettings.KillNotif", label = "Death Notification" },
                { value = "MiscSettings.Announcement", label = "Announce" },
                { value = "MiscSettings.StaffChat", label = "Staff Chat" },
                { value = "MiscSettings.Relog", label = "Relog" },
                { value = "MiscSettings.BanPlayer", label = "Ban Player" },
                { value = "MiscSettings.UnbanPlayer", label = "Unban Player" },
                { value = "MiscSettings.DeleteLaser", label = "Delete Laser" },
                { value = "TrollMenu", label = "Troll Menu" },
                { value = "TrollMenu.Fart", label = "Fart" },
                { value = "TrollMenu.TruckPunchline", label = "Truck" },
                { value = "TrollMenu.ClownAttack", label = "Clown" },
                { value = "TrollMenu.MerryweatherAttack", label = "Merry" },
                { value = "TrollMenu.Flashbang", label = "Flash" },
                { value = "TrollMenu.FakeSound", label = "Fake Sound" },
                { value = "TrollMenu.LagGame", label = "Lag" },
                { value = "TrollMenu.BlowTyres", label = "Blow Tyre" },
                { value = "TrollMenu.Eject", label = "Eject" },
                { value = "TrollMenu.CrashGame", label = "Crash" },
                { value = "RockstarEditor", label = "Rockstar Editor" },
            } },
            { type = 'select', label = 'Permission', options = {
                { value = "none", label = "None" },
                { value = "admin", label = "Admin" },
                { value = "FullAccess", label = "FullAccess" },
                { value = "OnlinePlayerOptions", label = "Online Player Options" },
                { value = "OnlinePlayerOptions.SendMessage", label = "Send Message" },
                { value = "OnlinePlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "OnlinePlayerOptions.ChangePed", label = "Change Ped" },
                { value = "OnlinePlayerOptions.OpenInventory", label = "Open Inventory" },
                { value = "OnlinePlayerOptions.SetJob", label = "Set Job" },
                { value = "OnlinePlayerOptions.GiveItemList", label = "Give Item(List)" },
                { value = "OnlinePlayerOptions.GiveItemCode", label = "Give Item(Code)" },
                { value = "OnlinePlayerOptions.GiveCar", label = "Give Car" },
                { value = "OnlinePlayerOptions.RemoveInventoryItem", label = "Remove Inventory Item" },
                { value = "OnlinePlayerOptions.HealPlayer", label = "Heal" },
                { value = "OnlinePlayerOptions.GiveAccountMoney", label = "Give Money" },
                { value = "OnlinePlayerOptions.RemoveAccountMoney", label = "Remove Money" },
                { value = "OnlinePlayerOptions.TPVeh", label = "TP Into Vehicle" },
                
                { value = "OnlinePlayerOptions.RevivePlayer", label = "Revive" },
                { value = "OnlinePlayerOptions.Goto", label = "Goto" },
                { value = "OnlinePlayerOptions.ToggleLicense", label = "Toggle License" },
                { value = "OnlinePlayerOptions.Bring", label = "Bring" },
                { value = "OnlinePlayerOptions.Waypoint", label = "Set Waypoint" },
                { value = "OnlinePlayerOptions.PrintID", label = "Print Identifiers" },
                { value = "OnlinePlayerOptions.KillPlayer", label = "Kill Player" },
                { value = "OnlinePlayerOptions.Kick", label = "Kick Player" },
                { value = "OnlinePlayerOptions.Spectate", label = "Spectate" },
                { value = "OnlinePlayerOptions.Screenshot", label = "Screenshot" },
                { value = "PlayerOptions", label = "Self Options" },
                { value = "PlayerOptions.Godmode", label = "God Mode" },
                { value = "PlayerOptions.Invisible", label = "Invisible" },
                { value = "PlayerOptions.UnlimitedStamina", label = "Unlimited Stamina" },
                { value = "PlayerOptions.FastRun", label = "Fast Run" },
                { value = "PlayerOptions.FastSwim", label = "Fast Swim" },
                { value = "PlayerOptions.SuperJump", label = "Super Jump" },
                { value = "PlayerOptions.NoRagdoll", label = "No Ragdoll" },
                { value = "PlayerOptions.NeverWanted", label = "Never Wanted" },
                { value = "PlayerOptions.StayInVeh", label = "Stay In Veh" },
                { value = "PlayerOptions.HealPlayer", label = "Heal" },
                { value = "PlayerOptions.RevivePlayer", label = "Revive" },
                { value = "PlayerOptions.SetArmor", label = "Armor" },
                { value = "PlayerOptions.CleanClothes", label = "Clean Clothes" },
                { value = "PlayerOptions.WetClothes", label = "Wet Clothes" },
                { value = "PlayerOptions.DryClothes", label = "Dry Clothes" },
                { value = "PlayerOptions.Suicide", label = "Suicide" },
                { value = "PlayerOptions.FreezePlayer", label = "Freeze Player" },
                { value = "PlayerOptions.Noclip", label = "Noclip" },
                { value = "PlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "PlayerOptions.ChangePed", label = "Change Ped" },
                { value = "VehicleOptions", label = "Vehicle Related Options" },
                { value = "VehicleOptions.Spawner", label = "Vehicle Spawner" },
                { value = "VehicleOptions.SpawnerCode", label = "Vehicle Spawner(Code)" },
                { value = "VehicleOptions.Modmenu", label = "Modmenu" },
                { value = "VehicleOptions.FreezeVehicle", label = "Freeze Vehicle" },
                { value = "VehicleOptions.ChangePlate", label = "Change Plate" },
                { value = "VehicleOptions.ToggleEngine", label = "Toggle Engine" },
                { value = "VehicleOptions.ToggleDoors", label = "Door Menu" },
                { value = "VehicleOptions.TorqueMultiplier", label = "Torque Multiplier" },
                { value = "VehicleOptions.EngineMultiplier", label = "Engine Multiplier" },
                { value = "VehicleOptions.FlipVehicle", label = "Flip Vehicle" },
                { value = "VehicleOptions.DeleteVehicle", label = "Delete Vehicle" },
                { value = "VehicleOptions.RefuelVehicle", label = "Refuel Vehicle" },
                { value = "VehicleOptions.BikeHelmet", label = "No Bike Helmet" },
                { value = "VehicleOptions.Godmode", label = "Vehicle Godmode" },
                { value = "VehicleOptions.RepairVehicle", label = "Repair Vehicle" },
                { value = "VehicleOptions.WashVehicle", label = "Wash Vehicle" },
                { value = "VehicleOptions.KeepClean", label = "Keep Vehicle Clean" },
                { value = "VehicleOptions.VehicleDirt", label = "Set Dirt" },
                { value = "VehicleOptions.UnlockVehicle", label = "Unlock Vehicle" },
                { value = "VehicleOptions.DeletePlate", label = "Delete Plate" },
                { value = "MiscSettings", label = "Misc Settings" },
                { value = "MiscSettings.TPM", label = "TPM" },
                { value = "MiscSettings.TPC", label = "TP Coords" },
                { value = "MiscSettings.ShowCoords", label = "Show Coords" },
                { value = "MiscSettings.CopyCoords", label = "Show Coords" },
                { value = "MiscSettings.PropSpawner", label = "Prop spawner" },
                { value = "MiscSettings.ClearArea", label = "Clear Area" },
                { value = "MiscSettings.ThermalVision", label = "Thermal Vision" },
                { value = "MiscSettings.NightVision", label = "Night Vision" },
                { value = "MiscSettings.PlayerBlips", label = "Player Blips" },
                { value = "MiscSettings.PlayerNames", label = "Player Names" },
                { value = "MiscSettings.Timecycle", label = "Timecycle" },
                { value = "MiscSettings.JoinQuitNotif", label = "Join-Quit Notification" },
                { value = "MiscSettings.KillNotif", label = "Death Notification" },
                { value = "MiscSettings.Announcement", label = "Announce" },
                { value = "MiscSettings.StaffChat", label = "Staff Chat" },
                { value = "MiscSettings.Relog", label = "Relog" },
                { value = "MiscSettings.BanPlayer", label = "Ban Player" },
                { value = "MiscSettings.UnbanPlayer", label = "Unban Player" },
                { value = "MiscSettings.DeleteLaser", label = "Delete Laser" },
                { value = "TrollMenu", label = "Troll Menu" },
                { value = "TrollMenu.Fart", label = "Fart" },
                { value = "TrollMenu.TruckPunchline", label = "Truck" },
                { value = "TrollMenu.ClownAttack", label = "Clown" },
                { value = "TrollMenu.MerryweatherAttack", label = "Merry" },
                { value = "TrollMenu.Flashbang", label = "Flash" },
                { value = "TrollMenu.FakeSound", label = "Fake Sound" },
                { value = "TrollMenu.LagGame", label = "Lag" },
                { value = "TrollMenu.BlowTyres", label = "Blow Tyre" },
                { value = "TrollMenu.Eject", label = "Eject" },
                { value = "TrollMenu.CrashGame", label = "Crash" },
                { value = "RockstarEditor", label = "Rockstar Editor" },
            } },
            { type = 'select', label = 'Permission', options = {
                { value = "none", label = "None" },
                { value = "admin", label = "Admin" },
                { value = "FullAccess", label = "FullAccess" },
                { value = "OnlinePlayerOptions", label = "Online Player Options" },
                { value = "OnlinePlayerOptions.SendMessage", label = "Send Message" },
                { value = "OnlinePlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "OnlinePlayerOptions.ChangePed", label = "Change Ped" },
                { value = "OnlinePlayerOptions.OpenInventory", label = "Open Inventory" },
                { value = "OnlinePlayerOptions.SetJob", label = "Set Job" },
                { value = "OnlinePlayerOptions.GiveItemList", label = "Give Item(List)" },
                { value = "OnlinePlayerOptions.GiveItemCode", label = "Give Item(Code)" },
                { value = "OnlinePlayerOptions.GiveCar", label = "Give Car" },
                { value = "OnlinePlayerOptions.RemoveInventoryItem", label = "Remove Inventory Item" },
                { value = "OnlinePlayerOptions.HealPlayer", label = "Heal" },
                { value = "OnlinePlayerOptions.GiveAccountMoney", label = "Give Money" },
                { value = "OnlinePlayerOptions.RemoveAccountMoney", label = "Remove Money" },
                { value = "OnlinePlayerOptions.TPVeh", label = "TP Into Vehicle" },
                
                { value = "OnlinePlayerOptions.RevivePlayer", label = "Revive" },
                { value = "OnlinePlayerOptions.Goto", label = "Goto" },
                { value = "OnlinePlayerOptions.ToggleLicense", label = "Toggle License" },
                { value = "OnlinePlayerOptions.Bring", label = "Bring" },
                { value = "OnlinePlayerOptions.Waypoint", label = "Set Waypoint" },
                { value = "OnlinePlayerOptions.PrintID", label = "Print Identifiers" },
                { value = "OnlinePlayerOptions.KillPlayer", label = "Kill Player" },
                { value = "OnlinePlayerOptions.Kick", label = "Kick Player" },
                { value = "OnlinePlayerOptions.Spectate", label = "Spectate" },
                { value = "OnlinePlayerOptions.Screenshot", label = "Screenshot" },
                { value = "PlayerOptions", label = "Self Options" },
                { value = "PlayerOptions.Godmode", label = "God Mode" },
                { value = "PlayerOptions.Invisible", label = "Invisible" },
                { value = "PlayerOptions.UnlimitedStamina", label = "Unlimited Stamina" },
                { value = "PlayerOptions.FastRun", label = "Fast Run" },
                { value = "PlayerOptions.FastSwim", label = "Fast Swim" },
                { value = "PlayerOptions.SuperJump", label = "Super Jump" },
                { value = "PlayerOptions.NoRagdoll", label = "No Ragdoll" },
                { value = "PlayerOptions.NeverWanted", label = "Never Wanted" },
                { value = "PlayerOptions.StayInVeh", label = "Stay In Veh" },
                { value = "PlayerOptions.HealPlayer", label = "Heal" },
                { value = "PlayerOptions.RevivePlayer", label = "Revive" },
                { value = "PlayerOptions.SetArmor", label = "Armor" },
                { value = "PlayerOptions.CleanClothes", label = "Clean Clothes" },
                { value = "PlayerOptions.WetClothes", label = "Wet Clothes" },
                { value = "PlayerOptions.DryClothes", label = "Dry Clothes" },
                { value = "PlayerOptions.Suicide", label = "Suicide" },
                { value = "PlayerOptions.FreezePlayer", label = "Freeze Player" },
                { value = "PlayerOptions.Noclip", label = "Noclip" },
                { value = "PlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "PlayerOptions.ChangePed", label = "Change Ped" },
                { value = "VehicleOptions", label = "Vehicle Related Options" },
                { value = "VehicleOptions.Spawner", label = "Vehicle Spawner" },
                { value = "VehicleOptions.SpawnerCode", label = "Vehicle Spawner(Code)" },
                { value = "VehicleOptions.Modmenu", label = "Modmenu" },
                { value = "VehicleOptions.FreezeVehicle", label = "Freeze Vehicle" },
                { value = "VehicleOptions.ChangePlate", label = "Change Plate" },
                { value = "VehicleOptions.ToggleEngine", label = "Toggle Engine" },
                { value = "VehicleOptions.ToggleDoors", label = "Door Menu" },
                { value = "VehicleOptions.TorqueMultiplier", label = "Torque Multiplier" },
                { value = "VehicleOptions.EngineMultiplier", label = "Engine Multiplier" },
                { value = "VehicleOptions.FlipVehicle", label = "Flip Vehicle" },
                { value = "VehicleOptions.DeleteVehicle", label = "Delete Vehicle" },
                { value = "VehicleOptions.RefuelVehicle", label = "Refuel Vehicle" },
                { value = "VehicleOptions.BikeHelmet", label = "No Bike Helmet" },
                { value = "VehicleOptions.Godmode", label = "Vehicle Godmode" },
                { value = "VehicleOptions.RepairVehicle", label = "Repair Vehicle" },
                { value = "VehicleOptions.WashVehicle", label = "Wash Vehicle" },
                { value = "VehicleOptions.KeepClean", label = "Keep Vehicle Clean" },
                { value = "VehicleOptions.VehicleDirt", label = "Set Dirt" },
                { value = "VehicleOptions.UnlockVehicle", label = "Unlock Vehicle" },
                { value = "VehicleOptions.DeletePlate", label = "Delete Plate" },
                { value = "MiscSettings", label = "Misc Settings" },
                { value = "MiscSettings.TPM", label = "TPM" },
                { value = "MiscSettings.TPC", label = "TP Coords" },
                { value = "MiscSettings.ShowCoords", label = "Show Coords" },
                { value = "MiscSettings.CopyCoords", label = "Show Coords" },
                { value = "MiscSettings.PropSpawner", label = "Prop spawner" },
                { value = "MiscSettings.ClearArea", label = "Clear Area" },
                { value = "MiscSettings.ThermalVision", label = "Thermal Vision" },
                { value = "MiscSettings.NightVision", label = "Night Vision" },
                { value = "MiscSettings.PlayerBlips", label = "Player Blips" },
                { value = "MiscSettings.PlayerNames", label = "Player Names" },
                { value = "MiscSettings.Timecycle", label = "Timecycle" },
                { value = "MiscSettings.JoinQuitNotif", label = "Join-Quit Notification" },
                { value = "MiscSettings.KillNotif", label = "Death Notification" },
                { value = "MiscSettings.Announcement", label = "Announce" },
                { value = "MiscSettings.StaffChat", label = "Staff Chat" },
                { value = "MiscSettings.Relog", label = "Relog" },
                { value = "MiscSettings.BanPlayer", label = "Ban Player" },
                { value = "MiscSettings.UnbanPlayer", label = "Unban Player" },
                { value = "MiscSettings.DeleteLaser", label = "Delete Laser" },
                { value = "TrollMenu", label = "Troll Menu" },
                { value = "TrollMenu.Fart", label = "Fart" },
                { value = "TrollMenu.TruckPunchline", label = "Truck" },
                { value = "TrollMenu.ClownAttack", label = "Clown" },
                { value = "TrollMenu.MerryweatherAttack", label = "Merry" },
                { value = "TrollMenu.Flashbang", label = "Flash" },
                { value = "TrollMenu.FakeSound", label = "Fake Sound" },
                { value = "TrollMenu.LagGame", label = "Lag" },
                { value = "TrollMenu.BlowTyres", label = "Blow Tyre" },
                { value = "TrollMenu.Eject", label = "Eject" },
                { value = "TrollMenu.CrashGame", label = "Crash" },
                { value = "RockstarEditor", label = "Rockstar Editor" },
            } },
            { type = 'select', label = 'Permission', options = {
                { value = "none", label = "None" },
                { value = "admin", label = "Admin" },
                { value = "FullAccess", label = "FullAccess" },
                { value = "OnlinePlayerOptions", label = "Online Player Options" },
                { value = "OnlinePlayerOptions.SendMessage", label = "Send Message" },
                { value = "OnlinePlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "OnlinePlayerOptions.ChangePed", label = "Change Ped" },
                { value = "OnlinePlayerOptions.OpenInventory", label = "Open Inventory" },
                { value = "OnlinePlayerOptions.SetJob", label = "Set Job" },
                { value = "OnlinePlayerOptions.GiveItemList", label = "Give Item(List)" },
                { value = "OnlinePlayerOptions.GiveItemCode", label = "Give Item(Code)" },
                { value = "OnlinePlayerOptions.GiveCar", label = "Give Car" },
                { value = "OnlinePlayerOptions.RemoveInventoryItem", label = "Remove Inventory Item" },
                { value = "OnlinePlayerOptions.HealPlayer", label = "Heal" },
                { value = "OnlinePlayerOptions.GiveAccountMoney", label = "Give Money" },
                { value = "OnlinePlayerOptions.RemoveAccountMoney", label = "Remove Money" },
                { value = "OnlinePlayerOptions.TPVeh", label = "TP Into Vehicle" },
                
                { value = "OnlinePlayerOptions.RevivePlayer", label = "Revive" },
                { value = "OnlinePlayerOptions.Goto", label = "Goto" },
                { value = "OnlinePlayerOptions.ToggleLicense", label = "Toggle License" },
                { value = "OnlinePlayerOptions.Bring", label = "Bring" },
                { value = "OnlinePlayerOptions.Waypoint", label = "Set Waypoint" },
                { value = "OnlinePlayerOptions.PrintID", label = "Print Identifiers" },
                { value = "OnlinePlayerOptions.KillPlayer", label = "Kill Player" },
                { value = "OnlinePlayerOptions.Kick", label = "Kick Player" },
                { value = "OnlinePlayerOptions.Spectate", label = "Spectate" },
                { value = "OnlinePlayerOptions.Screenshot", label = "Screenshot" },
                { value = "PlayerOptions", label = "Self Options" },
                { value = "PlayerOptions.Godmode", label = "God Mode" },
                { value = "PlayerOptions.Invisible", label = "Invisible" },
                { value = "PlayerOptions.UnlimitedStamina", label = "Unlimited Stamina" },
                { value = "PlayerOptions.FastRun", label = "Fast Run" },
                { value = "PlayerOptions.FastSwim", label = "Fast Swim" },
                { value = "PlayerOptions.SuperJump", label = "Super Jump" },
                { value = "PlayerOptions.NoRagdoll", label = "No Ragdoll" },
                { value = "PlayerOptions.NeverWanted", label = "Never Wanted" },
                { value = "PlayerOptions.StayInVeh", label = "Stay In Veh" },
                { value = "PlayerOptions.HealPlayer", label = "Heal" },
                { value = "PlayerOptions.RevivePlayer", label = "Revive" },
                { value = "PlayerOptions.SetArmor", label = "Armor" },
                { value = "PlayerOptions.CleanClothes", label = "Clean Clothes" },
                { value = "PlayerOptions.WetClothes", label = "Wet Clothes" },
                { value = "PlayerOptions.DryClothes", label = "Dry Clothes" },
                { value = "PlayerOptions.Suicide", label = "Suicide" },
                { value = "PlayerOptions.FreezePlayer", label = "Freeze Player" },
                { value = "PlayerOptions.Noclip", label = "Noclip" },
                { value = "PlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "PlayerOptions.ChangePed", label = "Change Ped" },
                { value = "VehicleOptions", label = "Vehicle Related Options" },
                { value = "VehicleOptions.Spawner", label = "Vehicle Spawner" },
                { value = "VehicleOptions.SpawnerCode", label = "Vehicle Spawner(Code)" },
                { value = "VehicleOptions.Modmenu", label = "Modmenu" },
                { value = "VehicleOptions.FreezeVehicle", label = "Freeze Vehicle" },
                { value = "VehicleOptions.ChangePlate", label = "Change Plate" },
                { value = "VehicleOptions.ToggleEngine", label = "Toggle Engine" },
                { value = "VehicleOptions.ToggleDoors", label = "Door Menu" },
                { value = "VehicleOptions.TorqueMultiplier", label = "Torque Multiplier" },
                { value = "VehicleOptions.EngineMultiplier", label = "Engine Multiplier" },
                { value = "VehicleOptions.FlipVehicle", label = "Flip Vehicle" },
                { value = "VehicleOptions.DeleteVehicle", label = "Delete Vehicle" },
                { value = "VehicleOptions.RefuelVehicle", label = "Refuel Vehicle" },
                { value = "VehicleOptions.BikeHelmet", label = "No Bike Helmet" },
                { value = "VehicleOptions.Godmode", label = "Vehicle Godmode" },
                { value = "VehicleOptions.RepairVehicle", label = "Repair Vehicle" },
                { value = "VehicleOptions.WashVehicle", label = "Wash Vehicle" },
                { value = "VehicleOptions.KeepClean", label = "Keep Vehicle Clean" },
                { value = "VehicleOptions.VehicleDirt", label = "Set Dirt" },
                { value = "VehicleOptions.UnlockVehicle", label = "Unlock Vehicle" },
                { value = "VehicleOptions.DeletePlate", label = "Delete Plate" },
                { value = "MiscSettings", label = "Misc Settings" },
                { value = "MiscSettings.TPM", label = "TPM" },
                { value = "MiscSettings.TPC", label = "TP Coords" },
                { value = "MiscSettings.ShowCoords", label = "Show Coords" },
                { value = "MiscSettings.CopyCoords", label = "Show Coords" },
                { value = "MiscSettings.PropSpawner", label = "Prop spawner" },
                { value = "MiscSettings.ClearArea", label = "Clear Area" },
                { value = "MiscSettings.ThermalVision", label = "Thermal Vision" },
                { value = "MiscSettings.NightVision", label = "Night Vision" },
                { value = "MiscSettings.PlayerBlips", label = "Player Blips" },
                { value = "MiscSettings.PlayerNames", label = "Player Names" },
                { value = "MiscSettings.Timecycle", label = "Timecycle" },
                { value = "MiscSettings.JoinQuitNotif", label = "Join-Quit Notification" },
                { value = "MiscSettings.KillNotif", label = "Death Notification" },
                { value = "MiscSettings.Announcement", label = "Announce" },
                { value = "MiscSettings.StaffChat", label = "Staff Chat" },
                { value = "MiscSettings.Relog", label = "Relog" },
                { value = "MiscSettings.BanPlayer", label = "Ban Player" },
                { value = "MiscSettings.UnbanPlayer", label = "Unban Player" },
                { value = "MiscSettings.DeleteLaser", label = "Delete Laser" },
                { value = "TrollMenu", label = "Troll Menu" },
                { value = "TrollMenu.Fart", label = "Fart" },
                { value = "TrollMenu.TruckPunchline", label = "Truck" },
                { value = "TrollMenu.ClownAttack", label = "Clown" },
                { value = "TrollMenu.MerryweatherAttack", label = "Merry" },
                { value = "TrollMenu.Flashbang", label = "Flash" },
                { value = "TrollMenu.FakeSound", label = "Fake Sound" },
                { value = "TrollMenu.LagGame", label = "Lag" },
                { value = "TrollMenu.BlowTyres", label = "Blow Tyre" },
                { value = "TrollMenu.Eject", label = "Eject" },
                { value = "TrollMenu.CrashGame", label = "Crash" },
                { value = "RockstarEditor", label = "Rockstar Editor" },
            } },
            { type = 'select', label = 'Permission', options = {
                { value = "none", label = "None" },
                { value = "admin", label = "Admin" },
                { value = "FullAccess", label = "FullAccess" },
                { value = "OnlinePlayerOptions", label = "Online Player Options" },
                { value = "OnlinePlayerOptions.SendMessage", label = "Send Message" },
                { value = "OnlinePlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "OnlinePlayerOptions.ChangePed", label = "Change Ped" },
                { value = "OnlinePlayerOptions.OpenInventory", label = "Open Inventory" },
                { value = "OnlinePlayerOptions.SetJob", label = "Set Job" },
                { value = "OnlinePlayerOptions.GiveItemList", label = "Give Item(List)" },
                { value = "OnlinePlayerOptions.GiveItemCode", label = "Give Item(Code)" },
                { value = "OnlinePlayerOptions.GiveCar", label = "Give Car" },
                { value = "OnlinePlayerOptions.RemoveInventoryItem", label = "Remove Inventory Item" },
                { value = "OnlinePlayerOptions.HealPlayer", label = "Heal" },
                { value = "OnlinePlayerOptions.GiveAccountMoney", label = "Give Money" },
                { value = "OnlinePlayerOptions.RemoveAccountMoney", label = "Remove Money" },
                { value = "OnlinePlayerOptions.TPVeh", label = "TP Into Vehicle" },
                
                { value = "OnlinePlayerOptions.RevivePlayer", label = "Revive" },
                { value = "OnlinePlayerOptions.Goto", label = "Goto" },
                { value = "OnlinePlayerOptions.ToggleLicense", label = "Toggle License" },
                { value = "OnlinePlayerOptions.Bring", label = "Bring" },
                { value = "OnlinePlayerOptions.Waypoint", label = "Set Waypoint" },
                { value = "OnlinePlayerOptions.PrintID", label = "Print Identifiers" },
                { value = "OnlinePlayerOptions.KillPlayer", label = "Kill Player" },
                { value = "OnlinePlayerOptions.Kick", label = "Kick Player" },
                { value = "OnlinePlayerOptions.Spectate", label = "Spectate" },
                { value = "OnlinePlayerOptions.Screenshot", label = "Screenshot" },
                { value = "PlayerOptions", label = "Self Options" },
                { value = "PlayerOptions.Godmode", label = "God Mode" },
                { value = "PlayerOptions.Invisible", label = "Invisible" },
                { value = "PlayerOptions.UnlimitedStamina", label = "Unlimited Stamina" },
                { value = "PlayerOptions.FastRun", label = "Fast Run" },
                { value = "PlayerOptions.FastSwim", label = "Fast Swim" },
                { value = "PlayerOptions.SuperJump", label = "Super Jump" },
                { value = "PlayerOptions.NoRagdoll", label = "No Ragdoll" },
                { value = "PlayerOptions.NeverWanted", label = "Never Wanted" },
                { value = "PlayerOptions.StayInVeh", label = "Stay In Veh" },
                { value = "PlayerOptions.HealPlayer", label = "Heal" },
                { value = "PlayerOptions.RevivePlayer", label = "Revive" },
                { value = "PlayerOptions.SetArmor", label = "Armor" },
                { value = "PlayerOptions.CleanClothes", label = "Clean Clothes" },
                { value = "PlayerOptions.WetClothes", label = "Wet Clothes" },
                { value = "PlayerOptions.DryClothes", label = "Dry Clothes" },
                { value = "PlayerOptions.Suicide", label = "Suicide" },
                { value = "PlayerOptions.FreezePlayer", label = "Freeze Player" },
                { value = "PlayerOptions.Noclip", label = "Noclip" },
                { value = "PlayerOptions.ChangeSkin", label = "Change Skin" },
                { value = "PlayerOptions.ChangePed", label = "Change Ped" },
                { value = "VehicleOptions", label = "Vehicle Related Options" },
                { value = "VehicleOptions.Spawner", label = "Vehicle Spawner" },
                { value = "VehicleOptions.SpawnerCode", label = "Vehicle Spawner(Code)" },
                { value = "VehicleOptions.Modmenu", label = "Modmenu" },
                { value = "VehicleOptions.FreezeVehicle", label = "Freeze Vehicle" },
                { value = "VehicleOptions.ChangePlate", label = "Change Plate" },
                { value = "VehicleOptions.ToggleEngine", label = "Toggle Engine" },
                { value = "VehicleOptions.ToggleDoors", label = "Door Menu" },
                { value = "VehicleOptions.TorqueMultiplier", label = "Torque Multiplier" },
                { value = "VehicleOptions.EngineMultiplier", label = "Engine Multiplier" },
                { value = "VehicleOptions.FlipVehicle", label = "Flip Vehicle" },
                { value = "VehicleOptions.DeleteVehicle", label = "Delete Vehicle" },
                { value = "VehicleOptions.RefuelVehicle", label = "Refuel Vehicle" },
                { value = "VehicleOptions.BikeHelmet", label = "No Bike Helmet" },
                { value = "VehicleOptions.Godmode", label = "Vehicle Godmode" },
                { value = "VehicleOptions.RepairVehicle", label = "Repair Vehicle" },
                { value = "VehicleOptions.WashVehicle", label = "Wash Vehicle" },
                { value = "VehicleOptions.KeepClean", label = "Keep Vehicle Clean" },
                { value = "VehicleOptions.VehicleDirt", label = "Set Dirt" },
                { value = "VehicleOptions.UnlockVehicle", label = "Unlock Vehicle" },
                { value = "VehicleOptions.DeletePlate", label = "Delete Plate" },
                { value = "MiscSettings", label = "Misc Settings" },
                { value = "MiscSettings.TPM", label = "TPM" },
                { value = "MiscSettings.TPC", label = "TP Coords" },
                { value = "MiscSettings.ShowCoords", label = "Show Coords" },
                { value = "MiscSettings.CopyCoords", label = "Show Coords" },
                { value = "MiscSettings.PropSpawner", label = "Prop spawner" },
                { value = "MiscSettings.ClearArea", label = "Clear Area" },
                { value = "MiscSettings.ThermalVision", label = "Thermal Vision" },
                { value = "MiscSettings.NightVision", label = "Night Vision" },
                { value = "MiscSettings.PlayerBlips", label = "Player Blips" },
                { value = "MiscSettings.PlayerNames", label = "Player Names" },
                { value = "MiscSettings.Timecycle", label = "Timecycle" },
                { value = "MiscSettings.JoinQuitNotif", label = "Join-Quit Notification" },
                { value = "MiscSettings.KillNotif", label = "Death Notification" },
                { value = "MiscSettings.Announcement", label = "Announce" },
                { value = "MiscSettings.StaffChat", label = "Staff Chat" },
                { value = "MiscSettings.Relog", label = "Relog" },
                { value = "MiscSettings.BanPlayer", label = "Ban Player" },
                { value = "MiscSettings.UnbanPlayer", label = "Unban Player" },
                { value = "MiscSettings.DeleteLaser", label = "Delete Laser" },
                { value = "TrollMenu", label = "Troll Menu" },
                { value = "TrollMenu.Fart", label = "Fart" },
                { value = "TrollMenu.TruckPunchline", label = "Truck" },
                { value = "TrollMenu.ClownAttack", label = "Clown" },
                { value = "TrollMenu.MerryweatherAttack", label = "Merry" },
                { value = "TrollMenu.Flashbang", label = "Flash" },
                { value = "TrollMenu.FakeSound", label = "Fake Sound" },
                { value = "TrollMenu.LagGame", label = "Lag" },
                { value = "TrollMenu.BlowTyres", label = "Blow Tyre" },
                { value = "TrollMenu.Eject", label = "Eject" },
                { value = "TrollMenu.CrashGame", label = "Crash" },
                { value = "RockstarEditor", label = "Rockstar Editor" },
            } },
        })
        TriggerServerEvent('ts-adminmenu:server:RemovePerms', input)
    end
end)
RegisterNetEvent('ts-adminmenu:client:SpawnCode',function ()
    local input = lib.inputDialog('TS Spawner', {'Spawn Code'})

    if input and input[1] then
        local spawnCode = input[1]
        TriggerServerEvent('ts-adminmenu:server:SpawnVehicle', spawnCode)
    end
end)
RegisterNetEvent('ts-adminmenu:client:SendMessage', function ()
    local input = lib.inputDialog('TS Spawner', {'Send Message'})

    if input and input[1] then
        local message = input[1]
        TriggerServerEvent('ts-adminmenu:server:SendMessage', selectedPlayer, message)
    end
end)
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
RegisterNetEvent('ts-adminmenu:client:SetJob',function()
    lib.callback('ts-adminmenu:server:GetJobs', false, function(jobs)
        local myMenu = {}
        for k, v in pairs(jobs) do
            local grade = 0
            for i, j in pairs(v.grades) do
                grade = grade + 1
            end
            myMenu[v.label .. ' - ' .. v.name] = {
                description = 'Grades = ' .. grade - 1,
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
end)
RegisterNetEvent('ts-adminmenu:client:GiveItemList',function ()
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
end)
RegisterNetEvent('ts-adminmenu:client:GiveItem', function(data)
    local player = data.plyid
    local item = data.item
    Wait(500)
    local input = lib.inputDialog('TS Admin Menu - Give Item', { "Count" })

    if input then
        local count = tonumber(input[1])
        if count == nil then
            return
        end
        TriggerServerEvent('ts-adminmenu:server:GiveItem', player, item, count)
    end

end)
RegisterNetEvent('ts-adminmenu:client:GiveItemCode',function()
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
end)
RegisterNetEvent('ts-adminmenu:client:RemoveItem', function(ply, list)
    local pid = ply
    local items = list
    local myMenu = {}
    for k, v in pairs(items) do
        if v then
            myMenu[v.label] = {
                description = 'Remove ' .. v.name,
                event = 'ts-adminmenu:client:RemoveItemCount',
                arrow = false,
                args = {
                    item = v.name,
                    plyid = pid
                },
                metadata = {
                    {label = 'Count', value = v.count},
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
RegisterNetEvent('ts-adminmenu:client:RemoveItemCount', function(data)
    local pid = data.plyid
    local item = data.item
    Wait(500)
    local input = lib.inputDialog('TS Admin Menu - Remove Item', { "Count" })

    if input then
        local count = tonumber(input[1])
        if count == nil then
            return
        end
        TriggerServerEvent('ts-adminmenu:server:RemoveItem', pid, item, count)
    end
end)
RegisterNetEvent('ts-adminmenu:client:GiveAccountMoney',function()
    local input = lib.inputDialog('Add Account Money - TSAdmin', { "Account Name (money, bank, black_money)", "Amount" })

    if input then
        local acc = input[1]
        local amount = tonumber(input[2])
        if acc == nil or amount == nil then
            return
        end
        TriggerServerEvent('ts-adminmenu:server:GiveAccMoney', selectedPlayer, acc, amount)
    end
end)
RegisterNetEvent('ts-adminmenu:client:GiveAccountMoney',function()
    local input = lib.inputDialog('Add Account Money - TSAdmin', { "Account Name (money, bank, black_money)", "Amount" })

    if input then
        local acc = input[1]
        local amount = tonumber(input[2])
        if acc == nil or amount == nil then
            return
        end
        TriggerServerEvent('ts-adminmenu:server:GiveAccMoney', selectedPlayer, acc, amount)
    end
end)
RegisterNetEvent('ts-adminmenu:client:RemoveAccountMoney',function()
    local input = lib.inputDialog('Remove Account Money - TSAdmin', { "Account Name (money, bank, black_money)", "Amount" })

    if input then
        local acc = input[1]
        local amount = tonumber(input[2])
        if acc == nil or amount == nil then
            return
        end
        TriggerServerEvent('ts-adminmenu:server:RemoveAccMoney', selectedPlayer, acc, amount)
    end
end)
RegisterNetEvent('ts-adminmenu:client:ToggleLicense',function ()
    local input = lib.inputDialog('TS Admin Menu - License Manager', { "License Name" })

    if input then
        local license = input[1]
        if license == nil then
            return
        end
        TriggerServerEvent('ts-adminmenu:server:ToggleLicense', selectedPlayer, license)
    end
end)
local currentVehProps = nil
RegisterNetEvent('ts-adminmenu:client:GiveCarSitting',function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped,false)
    if veh ~= 0 then
        currentVehProps = ESX.Game.GetVehicleProperties(veh)
        TriggerServerEvent('ts-adminmenu:server:giveCar', selectedPlayer,currentVehProps)
    else
        ESX.ShowNotification("You are not in a vehicle")
    end
end)
RegisterNetEvent('ts-adminmenu:client:VehicleExists',function(plate)
    local alert = lib.alertDialog({
        header = 'TS Admin Menu',
        content = 'A Vehicle with Plate:'..plate..' already exists. Do you wish to force give the vehicle (This will remove the vehicle from that player!)',
        centered = true,
        cancel = true
    })
    if alert == 'confirm' then
        TriggerServerEvent('ts-adminmenu:server:giveCarForce', selectedPlayer,currentVehProps)
        currentVehProps = nil
    end
end)
RegisterNetEvent('ts-adminmenu:client:GiveCarSelected',function()
    local input = lib.inputDialog('TS Admin Menu - Give Car', { "Spawn Code" })
    if input then
        if input[1] then
            ESX.Game.SpawnVehicle(input[1], vector3(120.0, -200.0, 30.0), 100.0, function(vehicle)
                if DoesEntityExist(vehicle) then
                    SetEntityVisible(vehicle, false, false)
					SetEntityCollision(vehicle, false)
                    local props = ESX.Game.GetVehicleProperties(vehicle)
                    ESX.Game.DeleteVehicle(vehicle)
                    TriggerServerEvent('ts-adminmenu:server:giveCar', selectedPlayer,props)
                else
                    ESX.ShowNotification("This model doesn't exist")
                end
              end)
        end
    end
end)
RegisterNetEvent('ts-adminmenu:client:GetScreenshot',function()
    exports['screenshot-basic']:requestScreenshotUpload("https://discord.com/api/webhooks/973118499708878858/Vr4-l5nGcryiuepegC_5g9hTw54zWUSSqUpVDeHQufjOnans8eun9--xILNLJwqt6rKz", "files[]", function(data)
    end)
end)
local spectating = false
local lastPos = nil
local HelpNotification = function(msg)
    AddTextEntry('HelpNotification', msg)
    BeginTextCommandDisplayHelp('HelpNotification')
    EndTextCommandDisplayHelp(0, false, true, -1)
end
RegisterNetEvent('ts-adminmenu:client:PrintID', function(steamid, license, xbl, ip, discord, liveid)
    print(steamid, license, xbl, ip, discord, liveid)
    lib.setClipboard('STEAM:'..steamid..'LICENSE:'..license..'XBL:'..xbl..'ip:'..ip..discord..liveid)
end)
RegisterNetEvent('ts-adminmenu:client:SpectatePlayer',function ()
    lib.callback('ts-adminmenu:server:GetSpectateData', false, function(data)
        local ped = PlayerPedId()
        local targetPly = nil
        local targetPed = nil

        if not spectating then
            lastPos = GetEntityCoords(ped)
            spectating = true
            DoScreenFadeOut(500)
            Wait(500)
            RequestCollisionAtCoord(data)
            SetEntityVisible(ped, false)
            SetEntityCoords(ped, data + vector3(0, 0, 10))
            FreezeEntityPosition(ped, true)
            Wait(1500)
            SetEntityCoords(ped, data - vector3(0, 0, 10))
            targetPly = GetPlayerFromServerId(selectedPlayer)
            targetPed = GetPlayerPed(targetPly)
            DoScreenFadeIn(500)
            NetworkSetInSpectatorMode(true, targetPed)
            while spectating do
                local god = tostring(GetPlayerInvincible(targetPly))
                local ragdoll = tostring(not CanPedRagdoll(targetPed))
                local health = tostring(GetEntityHealth(targetPed))
                local armor = tostring(GetPedArmour(targetPed))
                if god == "1" then
                    god = "true"
                end
                local msg = 'Godmode: ' .. god .. '  \nAntiRagdoll: ' .. ragdoll .. '  \nHealth: ' .. health .. '  \nArmor: ' .. armor
                HelpNotification(msg)
                DisableControlAction(0, 38, true)
                if IsDisabledControlJustPressed(0, 38) then
                    spectating = false
                    targetPly = nil
                    targetPed = nil
                    RequestCollisionAtCoord(lastPos)
                    NetworkSetInSpectatorMode(false, ped)
                    SetEntityCoords(ped, lastPos)
                    SetEntityVisible(ped, true)
                    FreezeEntityPosition(ped, false)
                end
                Wait(0)
            end
        else
            spectating = false
            targetPly = nil
            targetPed = nil
            RequestCollisionAtCoord(lastPos)
            FreezeEntityPosition(ped, false)
            SetEntityCoords(ped, lastPos)
            SetEntityVisible(ped, true)
            FreezeEntityPosition(ped, false)
        end
    end, selectedPlayer)
end)
RegisterNetEvent('ts-adminmenu:client:Kill', function()
    SetEntityHealth(PlayerPedId(), 0)
end)
RegisterNetEvent('ts-adminmenu:open:OnlinePlayers', function()
    lib.callback('ts-adminmenu:server:GetOnlinePlayers', false, function(plyList)
        local options = {}
        for k, v in pairs(plyList) do
            local icon = 'person'
            if v.gender == 'f' or v.gender == 'F' then
                icon = 'person-dress'
            end
            options[1] = {
                label = 'ID: '..v.source..' '..v.name,
                icon = icon,
                args = { source = v.source, name = v.name },
                description = "Name: "..v.ign
            }
        end
        if #options == 0 then
            options = {
                {label = 'This menu is empty', icon = "eye", args={},close=false}
            }
        end
        lib.setMenuOptions('adminmenu_onlineplayers', options)
        lib.showMenu('adminmenu_onlineplayers')
    end)
end)
RegisterNetEvent('ts-adminmenu:client:ChangeSkinSelf',function ()
    TriggerEvent('vms_charcreator:openCreator')
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
RegisterNetEvent('ts-adminmenu:client:ChangeSelfPed', function()
    local input = lib.inputDialog('TS Admin Menu - Ped Changer', {"Model Name" })

    if input then
        local model = input[1]
        if model == nil then
            return
        end
        SetPlayerSkin(model)
    end
end)
RegisterNetEvent('ts-adminmenu:client:SetPed', function(ped)
    SetPlayerSkin(ped)
end)
RegisterNetEvent('ts-adminmenu:client:ChangePed', function()
    local input = lib.inputDialog('TS Admin Menu - Ped Changer', {"Model Name" })

    if input then
        local model = input[1]
        if model == nil then
            return
        end
        TriggerServerEvent('ts-adminmenu:server:SetPed', selectedPlayer, model)
    end
end)
RegisterNetEvent('ts-adminmenu:open:PedOptions', function ()
    lib.showMenu('adminmenu_pedoptions')
end)
local godmode = false
RegisterNetEvent('ts-adminmenu:client:Godmode',function (toggle)
    if toggle == 2 then
        godmode = true
        local ped = PlayerPedId()
        local maxh = GetEntityMaxHealth(ped)
        SetPedCanRagdoll(ped, false)
        SetPedDiesWhenInjured(ped, false)
        SetPedDiesInstantlyInWater(ped, false)
        SetPedDiesInVehicle(ped, false)
        SetPedDiesInSinkingVehicle(ped, false)
        while godmode do
            if CanPedRagdoll(PlayerPedId()) then
                SetPedCanRagdoll(PlayerPedId(), false)
            end
            if GetEntityHealth(ped) < maxh then
                SetEntityHealth(PlayerPedId(), maxh)
            end
            Wait(0)
        end
    elseif toggle == 1 then
        SetPedCanRagdoll(PlayerPedId(), true)
        SetPedDiesWhenInjured(PlayerPedId(), true)
        SetPedDiesInstantlyInWater(PlayerPedId(), true)
        SetPedDiesInVehicle(PlayerPedId(), true)
        SetPedDiesInSinkingVehicle(PlayerPedId(), true)
        godmode = false
    end
end)

RegisterNetEvent('ts-adminmenu:client:Invisible',function (toggle)
    if toggle == 2 then
        SetEntityVisible(PlayerPedId(), false, 0)
        SetPedAudioFootstepLoud(PlayerPedId(), false)
        SetPedAudioFootstepQuiet(PlayerPedId(), false)
    elseif toggle == 1 then
        SetEntityVisible(PlayerPedId(), true, 0)
        SetPedAudioFootstepLoud(PlayerPedId(), true)
        SetPedAudioFootstepQuiet(PlayerPedId(), true)
    end
end)
local unlimitedStamina = false
RegisterNetEvent('ts-adminmenu:client:UnlimitedStamina',function(toggle)
    if toggle == 2 then
        unlimitedStamina = true
        while unlimitedStamina do
            RestorePlayerStamina(PlayerId(), 1.0)
            Wait(0)
        end
    elseif toggle == 1 then
        unlimitedStamina = false
    end
end)

RegisterNetEvent('ts-adminmenu:client:FastRun',function(toggle)
    if toggle == 2 then
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    elseif toggle == 1 then
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    end
end)
RegisterNetEvent('ts-adminmenu:client:FastSwim',function(toggle)
    if toggle == 2 then
        SetSwimMultiplierForPlayer(PlayerId(), 1.49)
    elseif toggle == 1 then
        SetSwimMultiplierForPlayer(PlayerId(), 1.0)
    end
end)
local superJump = false
RegisterNetEvent('ts-adminmenu:client:SuperJump',function(toggle)
    if toggle == 2 then
        superJump = true
        while superJump do
            Wait(0)
            SetSuperJumpThisFrame(PlayerId())
        end
    elseif toggle == 1 then
        superJump = false
        SetPedCanBeDraggedOut(PlayerPedId(), true)
    end
end)
local noRagdoll = false
RegisterNetEvent('ts-adminmenu:client:NoRagdoll',function(toggle)
    if toggle == 2 then
        noRagdoll = true
        while noRagdoll do
            Wait(0)
            SetPedCanRagdoll(PlayerPedId(), false)
            SetPedCanRagdollFromPlayerImpact(PlayerPedId(), false)
        end
    elseif toggle == 1 then
        noRagdoll = false
        SetPedCanRagdollFromPlayerImpact(PlayerPedId(), true)
        SetPedCanRagdoll(PlayerPedId(), true)
    end
end)
local neverWanted = false
RegisterNetEvent('ts-adminmenu:client:NeverWanted',function(toggle)
    if toggle == 2 then
        neverWanted = true
        while neverWanted do
            Wait(0)
            if GetPlayerWantedLevel(PlayerId()) > 0 then
                ClearPlayerWantedLevel(PlayerId())
            end
        end
    elseif toggle == 1 then
        neverWanted = false
    end
end)
local stayInVeh = false
RegisterNetEvent('ts-adminmenu:client:StayInVeh',function (toggle)
    if toggle == 2 then
        stayInVeh = true
        while stayInVeh do
            Wait(0)
            SetPedCanBeDraggedOut(PlayerPedId(), false)
        end
    elseif toggle == 1 then
        stayInVeh = false
        SetPedCanBeDraggedOut(PlayerPedId(), true)
    end
end)
RegisterNetEvent('ts-adminmenu:client:HealSelf',function()
    TriggerServerEvent('ts-adminmenu:server:HealPlayer', GetPlayerServerId(PlayerId()))
end)
RegisterNetEvent('ts-adminmenu:client:ReviveSelf',function ()
    TriggerServerEvent('ts-adminmenu:server:RevivePlayer', GetPlayerServerId(PlayerId()))
end)
RegisterNetEvent('ts-adminmenu:client:SetArmorSelf',function(scroll)
    if scroll == 1 then
        SetPedArmour(PlayerPedId(), 0)
    elseif scroll == 2 then
        SetPedArmour(PlayerPedId(), 20)
    elseif scroll == 3 then
        SetPedArmour(PlayerPedId(), 40)
    elseif scroll == 4 then
        SetPedArmour(PlayerPedId(), 60)
    elseif scroll == 5 then
        SetPedArmour(PlayerPedId(), 80)
    elseif scroll == 6 then
        SetPedArmour(PlayerPedId(), 100)
    end
end)
RegisterNetEvent('ts-adminmenu:client:CleanSelf',function ()
    ClearPedBloodDamage(PlayerPedId())
end)
RegisterNetEvent('ts-adminmenu:client:WetSelf',function ()
    SetPedWetnessHeight(PlayerPedId(), 2.0)
end)
RegisterNetEvent('ts-adminmenu:client:DrySelf',function ()
    ClearPedWetness(PlayerPedId())
end)
RegisterNetEvent('ts-adminmenu:client:SuicideSelf',function ()
    SetEntityHealth(PlayerPedId(), 0.0)
end)
RegisterNetEvent('ts-adminmenu:client:FreezeSelf',function (toggle)
    if toggle == 2 then
        FreezeEntityPosition(PlayerPedId(), true)
    elseif toggle == 1 then
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)
RegisterNetEvent('ts-adminmenu:client:Noclip',function(toggle)
    if toggle == 1 then
        SetNoClip(false)
    elseif toggle == 2 then
        SetNoClip(true)
    end
end)
RegisterNetEvent('ts-adminmenu:open:PlayerRelatedOptions', function ()
    lib.showMenu('adminmenu_playerrelated')
end)
RegisterNetEvent('ts-adminmenu:open:VehicleSpawner', function ()
    lib.showMenu('adminmenu_vehiclespawner')
end)
RegisterNetEvent('ts-adminmenu:client:TyreSmoke',function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped,false)
    if veh == 0 then return end
    exports['ex-colorpicker']:ColorPicker({
        onSelect = function (data)
            ToggleVehicleMod(veh, 20, true)
            SetVehicleTyreSmokeColor(veh,data.color.rgb.r,data.color.rgb.g,data.color.rgb.b)
        end,
    })
end)
RegisterNetEvent('ts-adminmenu:client:NeonColor',function ()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped,false)
    if veh == 0 then return end
    exports['ex-colorpicker']:ColorPicker({
        onUpdate = function (data)
            SetVehicleNeonLightsColour(veh,data.color.rgb.r,data.color.rgb.g,data.color.rgb.b)
        end,
    })
end)
RegisterNetEvent('ts-adminmenu:client:ToggleNeon',function (index)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped,false)
    if veh == 0 then return end
    if IsVehicleNeonLightEnabled(veh, (index-1)) then
        SetVehicleNeonLightEnabled(veh,(index-1),false)
    else
        SetVehicleNeonLightEnabled(veh,(index-1),true)
    end
end)
local isPrimary,isSecondary,isPearlescent,isWheel,isDashboard,isInterior=false,false,false,false,false,false
RegisterNetEvent('ts-adminmenu:client:TogglePrimary',function(index)
    if index == 2 then
        isPrimary = true
    elseif index == 1 then
        isPrimary = false
    end
end)
RegisterNetEvent('ts-adminmenu:client:ToggleSecondary',function(index)
    if index == 2 then
        isSecondary = true
    elseif index == 1 then
        isSecondary = false
    end
end)
RegisterNetEvent('ts-adminmenu:client:TogglePearlescent',function(index)
    if index == 2 then
        isPearlescent = true
    elseif index == 1 then
        isPearlescent = false
    end
end)
RegisterNetEvent('ts-adminmenu:client:ToggleWheel',function(index)
    if index == 2 then
        isWheel = true
    elseif index == 1 then
        isWheel = false
    end
end)
RegisterNetEvent('ts-adminmenu:client:ToggleDashboard',function(index)
    if index == 2 then
        isDashboard = true
    elseif index == 1 then
        isDashboard = false
    end
end)
RegisterNetEvent('ts-adminmenu:client:ToggleInterior',function(index)
    if index == 2 then
        isInterior = true
    elseif index == 1 then
        isInterior = false
    end
end)
RegisterNetEvent('ts-adminmenu:client:ClassicColor',function (index)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then return end
    local vehcolorp, vehcolors = GetVehicleColours(veh)
    local vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
    local color = colors[index].colorindex
    if isPrimary then
        SetVehicleColours(veh, color, vehcolors)
    end
    if isSecondary then
        vehcolorp, vehcolors = GetVehicleColours(veh)
        SetVehicleColours(veh, vehcolorp, color)
    end
    if isPearlescent then
        vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
        SetVehicleExtraColours(veh, color, vehcolorwheel)
    end
    if isWheel then
        vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
        SetVehicleExtraColours(veh, vehcolorperl, color)
    end
    if isDashboard then
        SetVehicleDashboardColor(veh, color)
    end
    if isInterior then
        SetVehicleInteriorColor(veh, color)
    end
end)
RegisterNetEvent('ts-adminmenu:client:MetalColor',function (index)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then return end
    local vehcolorp, vehcolors = GetVehicleColours(veh)
    local vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
    local color = metalcolors[index].colorindex
    if isPrimary then
        SetVehicleColours(veh, color, vehcolors)
    end
    if isSecondary then
        vehcolorp, vehcolors = GetVehicleColours(veh)
        SetVehicleColours(veh, vehcolorp, color)
    end
    if isPearlescent then
        vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
        SetVehicleExtraColours(veh, color, vehcolorwheel)
    end
    if isWheel then
        vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
        SetVehicleExtraColours(veh, vehcolorperl, color)
    end
    if isDashboard then
        SetVehicleDashboardColor(veh, color)
    end
    if isInterior then
        SetVehicleInteriorColor(veh, color)
    end
end)
RegisterNetEvent('ts-adminmenu:client:MatteColor',function (index)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then return end
    local vehcolorp, vehcolors = GetVehicleColours(veh)
    local vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
    local color = mattecolors[index].colorindex
    if isPrimary then
        SetVehicleColours(veh, color, vehcolors)
    end
    if isSecondary then
        vehcolorp, vehcolors = GetVehicleColours(veh)
        SetVehicleColours(veh, vehcolorp, color)
    end
    if isPearlescent then
        vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
        SetVehicleExtraColours(veh, color, vehcolorwheel)
    end
    if isWheel then
        vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
        SetVehicleExtraColours(veh, vehcolorperl, color)
    end
    if isDashboard then
        SetVehicleDashboardColor(veh, color)
    end
    if isInterior then
        SetVehicleInteriorColor(veh, color)
    end
end)
RegisterNetEvent('ts-adminmenu:client:CustomColor',function (index)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then return end
    exports['ex-colorpicker']:ColorPicker({
        onUpdate = function (data)
            if isPrimary then
                SetVehicleCustomPrimaryColour(veh,data.color.rgb.r,data.color.rgb.g,data.color.rgb.b)
            end
            if isSecondary then
                SetVehicleCustomSecondaryColour(veh,data.color.rgb.r,data.color.rgb.g,data.color.rgb.b)
            end
        end,
    })
    local vehcolorp, vehcolors = GetVehicleColours(veh)
    local vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
    local color = mattecolors[index].colorindex
    if isPrimary then
        SetVehicleColours(veh, color, vehcolors)
    end
    if isSecondary then
        vehcolorp, vehcolors = GetVehicleColours(veh)
        SetVehicleColours(veh, vehcolorp, color)
    end
    if isPearlescent then
        vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
        SetVehicleExtraColours(veh, color, vehcolorwheel)
    end
    if isWheel then
        vehcolorperl, vehcolorwheel = GetVehicleExtraColours(veh)
        SetVehicleExtraColours(veh, vehcolorperl, color)
    end
    if isDashboard then
        SetVehicleDashboardColor(veh, color)
    end
    if isInterior then
        SetVehicleInteriorColor(veh, color)
    end
    
end)
RegisterNetEvent('ts-adminmenu:open:ColorMenu', function ()
    lib.showMenu('adminmenu_colormenu')
end)
RegisterNetEvent('ts-adminmenu:client:ModMenu',function(index,modType)
    if index and modType then
        local veh = GetVehiclePedIsIn(PlayerPedId(),false)
        if veh == 0 then return end
        if modType and type(modType) == 'number' then
            if modType == 17 then
                if index == 2 then
                    ToggleVehicleMod(veh, 18, true)
                elseif index == 1 then
                    ToggleVehicleMod(veh, 18, false)
                end
            end
            local max = GetNumVehicleMods(veh, modType)
            if index == 1 then
                SetVehicleMod(veh, modType, max, false)
            else
                SetVehicleMod(veh, modType, index - 1, false)
            end
        elseif modType and modType == 'plateIndex' then
            SetVehicleModKit(veh, 0)
            SetVehicleNumberPlateTextIndex(veh, index)
        elseif modType and modType == 'livery2' then
            SetVehicleLivery(veh, 0)
            SetVehicleLivery(veh, index)
        end
    end
end)
RegisterNetEvent('ts-adminmenu:open:Modmenu', function ()
    local veh = GetVehiclePedIsIn(PlayerPedId(),false)
    if veh == 0 then return end
    local options = {{label = 'Color Menu', icon='palette', args={event='ts-adminmenu:open:ColorMenu'}}}
    for k, v in pairs(vehmods) do
        if v.modType and type(v.modType) == 'number' then
            if v.modType == 17 then
                options[#options+1] = {
                    label = v.label,
                    values={"Off","On"},
                    args={event="ts-adminmenu:client:ModMenu",modType=v.modType},
                    close= false
                }
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
                local values = {}
                for i=1,max,1 do
                    values[#values+1] = "Variation: "..i
                end
                options[#options+1] = {
                    label = v.label,
                    values=values,
                    args={event="ts-adminmenu:client:ModMenu",modType=v.modType,sideScroll=true},
                    defaultIndex=tonymod,
                    close= false
                }
            end

        elseif v.modType and v.modType == 'plateIndex' then

            SetVehicleModKit(veh, 0)
            local tonymod = GetVehicleNumberPlateTextIndex(veh)
            options[#options+1] = {
                label = v.label,
                values={'Variation: 1',"Variation: 2","Variation: 3","Variation: 4"},
                args={event="ts-adminmenu:client:ModMenu",modType=v.modType,sideScroll=true},
                defaultIndex=tonymod,
                close= false
            }
        elseif v.modType and v.modType == 'livery2' then

            SetVehicleLivery(veh, 0)
            local tonymod = GetVehicleLiveryCount(veh)
            if tonymod ~= -1 then
                local values= {}
                for i=1,tonymod,1 do
                    values[#values+1] = 'Livery: '..i
                end
                options[#options+1] = {
                    label = v.label,
                    values=values,
                    args={event="ts-adminmenu:client:ModMenu",modType=v.modType,sideScroll=true},
                    defaultIndex=tonymod,
                    close= false
                }
            end
        end
        ::continue::
    end
    if #options == 0 then
        options = {
            {label = 'This menu is empty', icon = "eye", args={},close=false}
        }
    end
    lib.setMenuOptions('adminmenu_modmenu',options)
    lib.showMenu('adminmenu_modmenu')
end)
RegisterNetEvent('ts-adminmenu:client:FreezeVehicle',function(index)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if index == 1 then
        FreezeEntityPosition(veh, false)
    elseif index == 2 then
        FreezeEntityPosition(veh, true)
    end
end)
RegisterNetEvent('ts-adminmenu:client:ToggleEngine',function(index)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if index == 1 then
        SetVehicleEngineOn(veh, false, true, true)
    elseif index == 2 then
        SetVehicleEngineOn(veh, true, true, true)
    end
end)
RegisterNetEvent('ts-adminmenu:client:ChangePlate',function ()
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
end)
local tonydoor={}
RegisterNetEvent('ts-adminmenu:client:ToggleDoor',function(index)
    local index = index -1
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh then
        if tonydoor[veh] and tonydoor[veh][index] then
            SetVehicleDoorShut(veh, index, false)
            tonydoor[veh][index] = false
        else
            SetVehicleDoorOpen(veh, index, false)
            tonydoor[veh] = { veh }
            tonydoor[veh][index] = true
        end
    end
end)
local torqueOn = false
local torquespeed = 1.0
RegisterNetEvent('ts-adminmenu:client:ToggleTorque',function (index)
    if index == 1 then
        torqueOn = false
    elseif index == 2 then
        torqueOn = true
        local ped = PlayerPedId()
        while torqueOn do
            Wait(0)
            local veh = GetVehiclePedIsIn(ped, false)
            if veh ~= 0 then
                SetVehicleCheatPowerIncrease(veh, torquespeed)
            end
        end
    end
end)
RegisterNetEvent('ts-adminmenu:client:TorqueMultiplier',function(index)
    local indexes = {
        0,2,4,8,16,32,64,128,256,512,1024
    }
    local speed = 1.0
    local value = indexes[index]
    for i = 1, value, 1 do
        speed = (speed * 2.0)
    end
    torquespeed = speed
end)
local orgspeed = nil
local engineOn = false
local enginespeed = 1.0
RegisterNetEvent('ts-adminmenu:client:ToggleEngineMult',function(index)
    if index == 1 then
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        engineOn = false
        ModifyVehicleTopSpeed(veh, 1.0)
        orgspeed = nil
    elseif index == 2 then
        engineOn = true
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        orgspeed = GetVehicleEstimatedMaxSpeed(veh)
        while engineOn do
            Wait(0)
            if enginespeed == 1.0 then
                ModifyVehicleTopSpeed(veh, 1.0)
            else
                ModifyVehicleTopSpeed(veh, orgspeed * enginespeed)
            end
        end
    end
end)
RegisterNetEvent('ts-adminmenu:client:EngineMultiplier',function(index)
    local indexes = {
        0,2,4,8,16,32,64,128,256,512,1024
    }
    local value = indexes[index]
    local speed = 1.0
    for i = 1, value, 1 do
        speed = (speed * 2.0)
    end
    enginespeed = speed
end)
RegisterNetEvent('ts-adminmenu:client:FlipVehicle',function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    SetVehicleOnGroundProperly(veh)
end)
RegisterNetEvent('ts-adminmenu:client:RefuelVehicle',function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= 0 then
        Entity(veh).state:set('fuel', 100, true)
        if GetVehicleFuelLevel(veh) < 100 then
            SetVehicleFuelLevel(veh, 100)
        end
    end
end)
local HelmetOn = false
RegisterNetEvent('ts-adminmenu:client:NoHelmet',function(index)
    if index == 1 then
        HelmetOn = false
        SetPedHelmet(PlayerPedId(), true)
    elseif index == 2 then
        HelmetOn = true
        local ped = PlayerPedId()
        while HelmetOn do
            Wait(0)
            if IsPedWearingHelmet(ped) then
                RemovePedHelmet(ped, true)
            end
            SetPedHelmet(ped, false)
        end
    end
end)
local VehGodmode=  false
RegisterNetEvent('ts-adminmenu:client:VehGodmode',function(index)
    if index == 1 then
        VehGodmode = false
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        SetEntityInvincible(veh, false)
        SetVehicleEngineCanDegrade(veh, true)
        SetVehicleCanBeVisiblyDamaged(veh, true)
        SetVehicleWheelsCanBreak(veh, true)
        SetVehicleHasStrongAxles(veh, false)
        SetVehicleTyresCanBurst(veh, true)
        SetDisableVehicleEngineFires(veh, false)
    elseif index == 2 then
        VehGodmode = true
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        SetEntityInvincible(veh, true)
        SetVehicleEngineCanDegrade(veh, false)
        SetVehicleCanBeVisiblyDamaged(veh, false)
        SetVehicleWheelsCanBreak(veh, false)
        SetVehicleHasStrongAxles(veh, true)
        SetVehicleTyresCanBurst(veh, false)
        SetDisableVehicleEngineFires(veh, true)
        while VehGodmode do
            Wait(0)

            if IsVehicleDamaged(veh) then
                RemoveDecalsFromVehicle(veh)
                SetVehicleFixed(veh)
                SetVehicleDeformationFixed(veh)
            end

            if IsVehicleEngineOnFire(veh) then
                SetDisableVehicleEngineFires(veh, true)
            end

            if GetVehicleEngineHealth(veh) < 1000 then
                SetVehicleFixed(veh)
                SetVehicleEngineHealth(veh, 4000)
            end
        end
    end
end)
RegisterNetEvent('ts-adminmenu:client:RepairVeh',function()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh ~= 0 then
        SetVehicleFixed(veh)
        SetVehicleDeformationFixed(veh)
    end
end)
RegisterNetEvent('ts-adminmenu:client:WashVehicle',function()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh ~= 0 then
        SetVehicleDirtLevel(veh, 0.0)
    end
end)
local keepClean = false
RegisterNetEvent('ts-adminmenu:client:KeepClean',function (index)
    if index == 1 then
        keepClean = false
    elseif index == 2 then
        keepClean = true
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        while keepClean do
            Wait(0)
            if GetVehicleDirtLevel(veh) > 0.0 then
                SetVehicleDirtLevel(veh, 0.0)
            end
        end
    end
end)
RegisterNetEvent('ts-adminmenu:client:SetDirt',function (index)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh ~= 0 then
        local dirt = ToFloat(index-1)
        SetVehicleDirtLevel(veh, dirt)
    end
end)
RegisterNetEvent('ts-adminmenu:open:VehicleOptions', function ()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then 
        lib.notify({
            title = 'TS Admin Menu',
            description = 'You are not in any vehicle',
            type = 'error'
        })
        return
    end
    lib.showMenu('adminmenu_vehicleoptions')
end)
RegisterNetEvent('ts-adminmenu:client:TPM',function ()
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
end)
RegisterNetEvent('ts-adminmenu:client:TPC',function ()
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
end)
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
local showCoordsOn =false
RegisterNetEvent('ts-adminmenu:client:ShowCoords',function (index)
    if index == 1 then
        showCoordsOn = false
    elseif index == 2 then
        showCoordsOn = true
        while showCoordsOn do
            Wait(0)
            local playerPed = PlayerPedId()
            local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
            local playerH = GetEntityHeading(playerPed)

            DrawGenericText(("~g~X~w~: %s ~g~Y~w~: %s ~g~Z~w~: %s ~g~H~w~: %s"):format(FormatCoord(playerX),
                FormatCoord(playerY), FormatCoord(playerZ), FormatCoord(playerH)))            
        end
    end
end)
RegisterNetEvent('ts-adminmenu:client:CopyVec3',function()
    local menu = lib.getOpenMenu()
    lib.hideMenu()
    Wait(500)
    local coords = GetEntityCoords(PlayerPedId())
    lib.setClipboard(tostring(coords))
    Wait(500)
    lib.showMenu(menu)
end)
RegisterNetEvent('ts-adminmenu:client:CopyVec4',function ()
    local menu = lib.getOpenMenu()
    lib.hideMenu()
    Wait(500)
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    lib.setClipboard(tostring(vec4(coords.x, coords.y, coords.z, heading)))
    Wait(500)
    lib.showMenu(menu)
end)
RegisterNetEvent('ts-adminmenu:client:BanPlayer',function()
    local optionTable = {}
    local plyList = lib.callback.await('ts-adminmenu:server:GetOnlinePlayers', false)
    for k, v in pairs(plyList) do
        local ply = { value = v.source, label = v.name }
        table.insert(optionTable, ply)
    end
    local input = lib.inputDialog('TS Bans', {
        { type = "input", label = "Identifier" },
        { type = "checkbox", label = "Temporary" },
        { type = 'select', label = 'Players', options = optionTable },
        { type = "input", label = "Reason" },
    })
    TriggerServerEvent('ts-adminmenu:server:BanPlayer', input)
end)
RegisterNetEvent('ts-adminmenu:client:UnbanPlayer',function()
    local optionTable = {}
    local plyList = lib.callback.await('ts-adminmenu:server:GetOnlinePlayers', false)
    for k, v in pairs(plyList) do
        local ply = { value = v.source, label = v.name }
        table.insert(optionTable, ply)
    end
    local input = lib.inputDialog('TS Unbans', {
        { type = "input", label = "Ban ID" },
    })
    TriggerServerEvent('ts-adminmenu:server:UnbanPlayer', input)
end)
RegisterNetEvent('ts-adminmenu:client:ClearArea',function()
    local coords = GetEntityCoords(PlayerPedId())
    ClearAreaLeaveVehicleHealth(coords.x, coords.y, coords.z, 100.0, false, false, false, false)
end)
RegisterNetEvent('ts-adminmenu:client:Announce',function()
    local input = lib.inputDialog('TS Announcer', { "Text" })

    if input then
        local txt = input[1]
        if txt == nil then
            return
        end
        TriggerServerEvent('ts-adminmenu:server:Announce', txt)
    end  
end)
RegisterNetEvent('ts-adminmenu:client:StaffChat',function()
    local input = lib.inputDialog('TS Staff Chat', { "Text" })

    if input then
        local txt = input[1]
        if txt == nil then
            return
        end
        TriggerServerEvent('ts-adminmenu:server:SendStaff', txt)
    end
end)
RegisterNetEvent('ts-adminmenu:client:ThermalVision',function(index)
    if index == 1 then
        SetSeethrough(false)
    elseif index == 2 then
        SetSeethrough(true)
    end
end)
local shownotifjoin = false
RegisterNetEvent('ts-adminmenu:client:JoinQ', function(notif)
    if shownotifjoin then
        TSNotif(notif)
    end
end)
RegisterNetEvent('ts-adminmenu:client:ToggleJoinQ',function(index)
    if index == 1 then
        shownotifjoin = false
    elseif index == 2 then
        shownotifjoin = true
    end
end)
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
RegisterNetEvent('ts-adminmenu:client:KillNotif',function (index)
    if index == 1 then
        shownotifkill = false
    elseif index == 2 then
        shownotifkill = true
    end
end)
RegisterNetEvent('ts-adminmenu:client:killnotif', function(notif)
    if shownotifkill then
        TSNotif(notif)
    end
end)
RegisterNetEvent('ts-adminmenu:client:ToggleNightVision',function(index)
    if index == 1 then
        SetNightvision(false)
    elseif index == 2 then
        SetNightvision(true)
    end
end)
local playerBlips = false
local plyBlips = {}
local plyName = false
local plyNames = {}
RegisterNetEvent('ts-adminmenu:client:LeftScope', function(target, job)
    local sid = target
    if plyBlips[sid] then
        RemoveBlip(plyBlips[sid])
        plyBlips[sid] = nil
    end
    if plyNames[sid] then
        RemoveMpGamerTag(plyNames[sid])
        plyNames[sid] = nil
    end
end)
RegisterNetEvent('ts-adminmenu:client:PlayerLeft', function(pid)
    local sid = pid
    if plyBlips[sid] then
        RemoveBlip(plyBlips[sid])
        plyBlips[sid] = nil
    end
    if plyNames[sid] then
        RemoveMpGamerTag(plyNames[sid])
        plyNames[sid] = nil
    end
end)
RegisterNetEvent('ts-adminmenu:client:PlayerBlips',function (index)
    if index == 1 then
        playerBlips = false
        for k,v in pairs(plyBlips) do
            if DoesBlipExist(v) then
                RemoveBlip(v)
                plyBlips[k] = nil
            end
        end
    elseif index == 2 then
        playerBlips = true
        while playerBlips do
            Wait(0)
            for k, v in ipairs(GetActivePlayers()) do
                local sid = GetPlayerServerId(v)
                if v == PlayerId() then
                    return
                end
                if DoesBlipExist(plyBlips[sid]) then
                    return
                end
                local bliptony = AddBlipForEntity(GetPlayerPed(v))
                SetBlipSprite(bliptony, 1)
                SetBlipScale(bliptony, 1.0)
                SetBlipAlpha(bliptony, 255)
                plyBlips[sid] = bliptony
            end
        end
    end
end)
RegisterNetEvent('ts-adminmenu:client:PlayerNames',function (index)
    if index == 1 then
        plyName = false
        for k, v in pairs(plyNames) do
            RemoveMpGamerTag(v)
            plyNames[k] = nil
        end
    elseif index == 2 then
        plyName = true
        while plyName do
            Wait(0)
            for k, v in ipairs(GetActivePlayers()) do
                local sid = GetPlayerServerId(v)
                if not plyNames[sid] or not IsMpGamerTagActive(plyNames[sid]) then
                    plyNames[sid] = CreateFakeMpGamerTag(GetPlayerPed(v),
                        GetPlayerName(v) .. ': ' .. GetPlayerServerId(v), false, false, "", 0)
                    SetMpGamerTagVisibility(plyNames[sid], 2, 1) -- set the visibility of component 2(healthArmour) to true
                    SetMpGamerTagAlpha(plyNames[sid], 2, 255) -- set the alpha of component 2(healthArmour) to 255
                    SetMpGamerTagHealthBarColor(plyNames[sid], 129) -- set component 2(healthArmour) color to 129(HUD_COLOUR_YOGA)
                end
            end
        end
    end
end)
local function RotationToDirection(rotation)
    local adjustedRotation =
    {
        x = (math.pi / 180) * rotation.x,
        y = (math.pi / 180) * rotation.y,
        z = (math.pi / 180) * rotation.z
    }
    local direction =
    {
        x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        z = math.sin(adjustedRotation.x)
    }
    return direction
end
local function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
    local cameraCoord = GetGameplayCamCoord()
    local direction = RotationToDirection(cameraRotation)
    local destination =
    {
        x = cameraCoord.x + direction.x * distance,
        y = cameraCoord.y + direction.y * distance,
        z = cameraCoord.z + direction.z * distance
    }
    local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
    return b, c, e
end
local function DrawEntityBoundingBox(entity, color)
    local model = GetEntityModel(entity)
    local min, max = GetModelDimensions(model)
    local rightVector, forwardVector, upVector, position = GetEntityMatrix(entity)

    -- Calculate size
    local dim =
    {
        x = 0.5 * (max.x - min.x),
        y = 0.5 * (max.y - min.y),
        z = 0.5 * (max.z - min.z)
    }

    local FUR =
    {
        x = position.x + dim.y * rightVector.x + dim.x * forwardVector.x + dim.z * upVector.x,
        y = position.y + dim.y * rightVector.y + dim.x * forwardVector.y + dim.z * upVector.y,
        z = 0
    }

    local FUR_bool, FUR_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    FUR.z = FUR_z
    FUR.z = FUR.z + 2 * dim.z

    local BLL =
    {
        x = position.x - dim.y * rightVector.x - dim.x * forwardVector.x - dim.z * upVector.x,
        y = position.y - dim.y * rightVector.y - dim.x * forwardVector.y - dim.z * upVector.y,
        z = 0
    }
    local BLL_bool, BLL_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    BLL.z = BLL_z

    -- DEBUG
    local edge1 = BLL
    local edge5 = FUR

    local edge2 =
    {
        x = edge1.x + 2 * dim.y * rightVector.x,
        y = edge1.y + 2 * dim.y * rightVector.y,
        z = edge1.z + 2 * dim.y * rightVector.z
    }

    local edge3 =
    {
        x = edge2.x + 2 * dim.z * upVector.x,
        y = edge2.y + 2 * dim.z * upVector.y,
        z = edge2.z + 2 * dim.z * upVector.z
    }

    local edge4 =
    {
        x = edge1.x + 2 * dim.z * upVector.x,
        y = edge1.y + 2 * dim.z * upVector.y,
        z = edge1.z + 2 * dim.z * upVector.z
    }

    local edge6 =
    {
        x = edge5.x - 2 * dim.y * rightVector.x,
        y = edge5.y - 2 * dim.y * rightVector.y,
        z = edge5.z - 2 * dim.y * rightVector.z
    }

    local edge7 =
    {
        x = edge6.x - 2 * dim.z * upVector.x,
        y = edge6.y - 2 * dim.z * upVector.y,
        z = edge6.z - 2 * dim.z * upVector.z
    }

    local edge8 =
    {
        x = edge5.x - 2 * dim.z * upVector.x,
        y = edge5.y - 2 * dim.z * upVector.y,
        z = edge5.z - 2 * dim.z * upVector.z
    }

    DrawLine(edge1.x, edge1.y, edge1.z, edge2.x, edge2.y, edge2.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge3.x, edge3.y, edge3.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge6.x, edge6.y, edge6.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge7.x, edge7.y, edge7.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge5.x, edge5.y, edge5.z, color.r, color.g, color.b, color.a)
    DrawLine(edge4.x, edge4.y, edge4.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
end
local function Draw2DText(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1], colour[2], colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end
local laserstatus = false
RegisterNetEvent('ts-adminmenu:client:DeleteLaser',function(index)
    if index == 1 then
        laserstatus = false
    elseif index == 2 then
        laserstatus = true
        while laserstatus do
            Wait(0)
            local color = { r = 255, g = 50, b = 50, a = 200 }
            local plyCoords = GetEntityCoords(PlayerPedId())
            local hit, coords, entity = RayCastGamePlayCamera(1000.0)
            if hit and (IsEntityAVehicle(entity) or IsEntityAPed(entity) or IsEntityAnObject(entity)) then
                local entityCoord = GetEntityCoords(entity)
                DrawEntityBoundingBox(entity, color)
                DrawLine(plyCoords.x, plyCoords.y, plyCoords.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                Draw2DText("Health" .. ': ~g~' .. GetEntityHealth(entity) .. ' ~w~' .. "Speed" .. ': ~b~' .. GetEntitySpeed(entity) .. '~w~', 4, { 255, 255, 255 }, 0.4, 0.55, 0.888 - 0.050)
                Draw2DText("Networked" .. ': ~b~' .. tostring(NetworkGetEntityIsNetworked(entity)) .. ' ~w~' .. "Owner ID" .. ': ~b~' .. GetPlayerServerId(NetworkGetEntityOwner(entity)) .. '~w~', 4, { 255, 255, 255 }, 0.4, 0.55, 0.888 - 0.025)
                Draw2DText("Obj" .. ': ~b~' .. entity .. '~w~ ' .. "Model" .. ': ~b~' .. GetEntityModel(entity) .. " ~o~Coords: "..GetEntityCoords(entity) , 4, { 255, 255, 255 }, 0.4, 0.55, 0.888)
                Draw2DText("Press ~r~[E]~s~ to delete the object", 4, { 255, 255, 255 }, 0.4, 0.55, 0.888 + 0.025)

                if IsControlJustReleased(0, 38) then -- When E pressed then remove targeted entity
                    SetEntityAsMissionEntity(entity, true, true) -- Set as missionEntity so the object can be remove (Even map objects)
                    NetworkRequestControlOfEntity(entity) -- Request Network control so we own the object
                    Wait(250) -- Safety Wait
                    DeleteEntity(entity) -- Delete the object
                    DeleteObject(entity) -- Delete the object (failsafe)
                    SetEntityAsNoLongerNeeded(entity) -- Tells the engine this prop isnt needed anymore
                end
                -- Only draw of not center of map
            elseif coords.x ~= 0.0 and coords.y ~= 0.0 then
                -- Draws line to targeted position
                DrawLine(plyCoords.x, plyCoords.y, plyCoords.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.1, 0.1, 0.1, color.r, color.g, color.b, color.a, false, true, 2, nil, nil, false)
            end
        end
    end
end)
RegisterNetEvent('ts-adminmenu:client:Timecycle',function(index)
    local value = Timecycles[index].value
    SetTimecycleModifier(value)
end)
RegisterNetEvent('ts-adminmenu:client:TimecycleIntensity',function(index)
    SetTimecycleModifierStrength(index-1 / 10.0)
end)
RegisterNetEvent('ts-adminmenu:open:MiscSettings', function ()
    lib.showMenu('adminmenu_miscsettings')
end)
RegisterNetEvent('ts-adminmenu:client:Fart',function(index)
    local values = {
        'bbfart','cmfart','pwrfart','smfart'
    }
    local value = values[index]
    TriggerServerEvent('ts-adminmenu:server:PlayerFart', value)
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
RegisterNetEvent('ts-adminmenu:client:ClownAttackPly2', function(arg)
    TriggerServerEvent('ts-adminmenu:server:ClownAttackPly', arg)
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
    TriggerServerEvent('ts-adminmenu:server:MerryAttackPly', arg)
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
RegisterNetEvent('ts-adminmenu:client:FlashPly', function(arg)
    TriggerServerEvent('ts-adminmenu:server:FlashPly', arg)
end)
local fakeNotif = { -- stuff thats playable in the fake sound option, uses special furfag.de page for youtube player embed and volume
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
    } 
}
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
RegisterNetEvent('ts-adminmenu:client:FakeSound',function()
    local myMenu = {}
    for k, v in ipairs(fakeNotif) do
        myMenu[v.name] = {
            description = 'Play ' .. v.name,
            arrow = true,
            event = 'ts-adminmenu:client:FakeCallply',
            args = {
                type = k
            }
        }
    end
    lib.registerContext({
        id = 'fake_sounds',
        title = 'Fake Sounds',
        options = myMenu
    })
    lib.showContext('fake_sounds')
end)
RegisterNetEvent('ts-adminmenu:open:TrollMenu', function ()
    lib.showMenu('adminmenu_trollmenu')
end)
RegisterNetEvent('ts-adminmenu:client:Rockstar',function(index)
    if index == 1 then
        StartRecording(1)
        TSNotif("Started recording")
    elseif index == 2 then
        StartRecording(0)
        StopRecordingAndSaveClip()
        TSNotif("Saved recording")
    elseif index == 3 then
        StopRecordingAndDiscardClip()
        TSNotif("Discarded recording")
    elseif index == 4 then
        TSNotif("Opening Rockstar Editor")
        NetworkSessionLeaveSinglePlayer()
        ActivateRockstarEditor()
    end
end)
RegisterNetEvent("ts-adminmenu:troll:Crashply", function()
    repeat until false
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
RegisterNetEvent('ts-adminmenu:client:BlowPly2', function(arg)
    TriggerServerEvent('ts-adminmenu:server:BlowPly', arg)
end)
local stopGrief = false
local griefRunning = false
RegisterNetEvent("ts-adminmenu:troll:LagGame", function()
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
RegisterNetEvent("ts-adminmenu:troll:BlowPly", function()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh and veh ~= 0 then
        for i = 0, 6 do
            SetVehicleTyreBurst(veh, i, true, 1000.0)
        end
    end
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
RegisterNetEvent('ts-adminmenu:open:VehicleRelatedOptions', function ()
    lib.showMenu('adminmenu_vehiclerelated')
end)
RegisterNetEvent('ts-adminmenu:client:DeleteVehicle',function()
    local input = lib.inputDialog('TS Admin Menu - Delete Vehicle In Radius', { "Radius" })

    if input then
        local radius = tonumber(input[1])
        if radius == nil then
            return
        end
        TriggerServerEvent('ts-adminmenu:server:DeleteVehicle', radius)
    end
end)
RegisterNetEvent('ts-adminmenu:client:UnlockVehicle',function()
    local vehicle = ESX.Game.GetClosestVehicle()
    SetVehicleDoorsLocked(vehicle, 1)
    SetVehicleDoorsLockedForAllPlayers(vehicle, false)
end)
RegisterCommand('testmenu', function()
    if loaded then
    lib.showMenu('adminmenu_main')
    else
        ESX.ShowNotification('Loading Admin menu')
    end
end)