cfg = {}  -- Initialize the cfg table

cfg.gangFactions = {
    "police",
    "lostmc",
    "ballas",
    "vagos",
    -- Add more gangs as needed
}

cfg.gangColors = {
    ['police'] = 56,
    ['ambulance'] = 40,
    ['blackempire'] = 56,
}

function isGangFaction(faction)
    for i = 1, #cfg.gangFactions do
        if cfg.gangFactions[i] == faction then
            return true
        end
    end
    return false
end

exports('isGangFaction', isGangFaction)

function getFactionColor(faction)
    return cfg.gangColors[faction]
end


cfg.turf = {
    pool = 0,
    time = 48
}

cfg.zoneDecay = {
    reputation = 100,
    time = 60 -- minutes "currently not in use"
}

cfg.spayReputation = 25
cfg.killReputation = 100
cfg.adminzonecmd = 'gangzone'
cfg.gangZones = {}

cfg.gangZones['ROCKF'] = {
    name = 'ROCKF',
    label = 'Rockford Hills',
    neighbors = {
        'MORN',
        'WVINE',
        'MOVIE',
        'KOREAT',
        'BURTON'
    },
    zoneParts = {
        { x1 = -1379.12, y1 = -257.26, x2 = -1299.88, y2 = -38.12 },
        { x1 = -920.61, y1 = -465.30, x2 = -521.31, y2 = -407.48 },
        { x1 = -1299.5, y1 = -407.3, x2 = -550.21, y2 = -126.82 },
        { x1 = -1299.55, y1 = -126.82, x2 = -743.39, y2 = 445.02 },
        { x1 = -743.39, y1 = -126.82, x2 = -594.91, y2 = 13.48 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 1.3
    }
}
cfg.gangZones['MORN'] = {
    name = 'MORN',
    label = 'Morningwood',
    neighbors = {
        'ROCKF',
        'MOVIE'
    },
    zoneParts = {
        { x1 = -1635.47, y1 = -500.0, x2 = -1379.12, y2 = -107.29 },
        { x1 = -1379.12, y1 = -511.5, x2 = -1299.88, y2 = -257.26 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 1.0
    }
}
cfg.gangZones['MOVIE'] = {
    name = 'MOVIE',
    label = 'Richards Majestic',
    neighbors = {
        'MORN',
        'KOREAT',
        'ROCKF',
        'VCANA'
    },
    zoneParts = {
        { x1 = -1380.23, y1 = -849.50, x2 = -1172.24, y2 = -511.48 },
        { x1 = -1172.24, y1 = -576.61, x2 = -1072.88, y2 = -543.51 },
        { x1 = -1172.24, y1 = -722.8, x2 = -1127.62, y2 = -576.61 },
        { x1 = -1172.24, y1 = -543.51, x2 = -998.41, y2 = -511.48 },
        { x1 = -1299.88, y1 = -511.48, x2 = -920.5, y2 = -407.23 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.3,
        CATEGORY_MED = 0.3,
        CATEGORY_HIGH = 1.0
    }
}
cfg.gangZones['KOREAT'] = {
    name = 'KOREAT',
    label = 'Little Seoul',
    neighbors = {
        'ROCKF',
        'VCANA',
        'MOVIE',
        'STRAW',
        'PBOX'
    },
    zoneParts = {
        { x1 = -1127.62, y1 = -723.01, x2 = -1072.88, y2 = -576.61 },
        { x1 = -1072.88, y1 = -723.01, x2 = -998.41, y2 = -543.51 },
        { x1 = -931.96, y1 = -849.49, x2 = -774.41, y2 = -723.01 },
        { x1 = -865.98, y1 = -907.78, x2 = -774.41, y2 = -849.49 },
        { x1 = -812.41, y1 = -1019.71, x2 = -774.41, y2 = -907.78 },
        { x1 = -998.41, y1 = -723.01, x2 = -403.51, y2 = -511.48 },
        { x1 = -920.61, y1 = -511.48, x2 = -521.31, y2 = -465.30 },
        { x1 = -573.84, y1 = -1425.40, x2 = -403.51, y2 = -1158.02 },
        { x1 = -774.41, y1 = -1158.02, x2 = -354.71, y2 = -723.01 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 1.0,
        CATEGORY_HIGH = 0.5
    }
}
cfg.gangZones['MIRR'] = {
    name = 'MIRR',
    label = 'Mirror Park',
    neighbors = {
        'EAST_V',
        'LMESA'
    },
    zoneParts = {
        { x1 = 869.70, y1 = -820.90, x2 = 1391.07, y2 = -282.32 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 0.15,
        CATEGORY_HIGH = 0.05
    }
}
cfg.gangZones['LMESA'] = {
    name = 'LMESA',
    label = 'La Mesa',
    neighbors = {
        'MIRR',
        'TEXTI',
        'SKID',
        'RANCHO',
        'CYPRE',
        'EBURO'
    },
    zoneParts = {
        { x1 = 921.45, y1 = -1901.45, x2 = 1118.89, y2 = -1708.33 },
        { x1 = 505.03, y1 = -1158.02, x2 = 934.14, y2 = -1006.57 },
        { x1 = 618.7, y1 = -1708.33, x2 = 1118.89, y2 = -1158.02 },
        { x1 = 505.03, y1 = -1006.57, x2 = 888.46, y2 = -820.90 },
        { x1 = 505.03, y1 = -820.90, x2 = 869.70, y2 = -510.0 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.5,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 0.2
    }
}
cfg.gangZones['STRAW'] = {
    name = 'STRAW',
    label = 'Strawberry',
    neighbors = {
        'KOREAT',
        'PBOX',
        'SKID',
        'RANCHO',
        'DAVIS',
        'CHAMH'
    },
    zoneParts = {
        { x1 = -63.92, y1 = -1700.53, x2 = 91.27, y2 = -1425.40 },
        { x1 = -403.51, y1 = -1425.40, x2 = 359.48, y2 = -1158.02 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.7,
        CATEGORY_MED = 1.0,
        CATEGORY_HIGH = 0.3
    }
}
cfg.gangZones['RANCHO'] = {
    name = 'RANCHO',
    label = 'Rancho',
    neighbors = {
        'STRAW',
        'CYPRE',
        'SKID',
        'LMESA',
        'DAVIS'
    },
    zoneParts = {
        { x1 = 359.48, y1 = -1761.99, x2 = 618.43, y2 = -1158.02 },
        { x1 = 271.51, y1 = -1761.99, x2 = 359.48, y2 = -1613.16 },
        { x1 = 222.40, y1 = -2022.57, x2 = 505.03, y2 = -1761.99 },
        { x1 = 123.73, y1 = -2168.95, x2 = 505.03, y2 = -2022.57 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.8,
        CATEGORY_MED = 0.9,
        CATEGORY_HIGH = 0.25
    }
}
cfg.gangZones['CHAMH'] = {
    name = 'CHAMH',
    label = 'Chamberlain Hills',
    neighbors = {
        'STRAW',
        'DAVIS'
    },
    zoneParts = {
        { x1 = -283.92, y1 = -1761.99, x2 = -63.92, y2 = -1425.40 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.9,
        CATEGORY_MED = 1.2,
        CATEGORY_HIGH = 0.2
    }
}
cfg.gangZones['DAVIS'] = {
    name = 'DAVIS',
    label = 'Davis Quartz',
    neighbors = {
        'STRAW',
        'RANCHO',
        'CHAHM'
    },
    zoneParts = {
        { x1 = -63.92, y1 = -1761.99, x2 = 271.51, y2 = -1700.53 },
        { x1 = 91.27, y1 = -1700.53, x2 = 271.51, y2 = -1613.16 },
        { x1 = 91.27, y1 = -1613.16, x2 = 359.48, y2 = -1425.40 },
        { x1 = -139.74, y1 = -2022.57, x2 = -9.70, y2 = -1761.99 },
        { x1 = -9.70, y1 = -2022.57, x2 = 115.40, y2 = -1761.99 },
        { x1 = 115.40, y1 = -2022.57, x2 = 222.40, y2 = -1761.99 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.8,
        CATEGORY_MED = 1.0,
        CATEGORY_HIGH = 0.4
    }
}
cfg.gangZones['PBOX'] = {
    name = 'PBOX',
    label = 'Pillbox Hill',
    neighbors = {
        'TEXTI',
        'SKID',
        'KOREAT',
        'STRAW'
    },
    zoneParts = {
        { x1 = -276.21, y1 = -722.91, x2 = 285.43, y2 = -573.01 },
        { x1 = -354.71, y1 = -1158.02, x2 = 119.43, y2 = -722.91 },
        { x1 = 199.43, y1 = -877.91, x2 = 285.43, y2 = -722.91 },
        { x1 = 119.43, y1 = -1158.02, x2 = 199.43, y2 = -722.91 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.8,
        CATEGORY_MED = 0.8,
        CATEGORY_HIGH = 1.1
    }
}
--[[cfg.gangZones['TEXTI'] = {
    name = 'TEXTI',
    label = 'Textile City',
    neighbors = {
        'LMESA',
        'PBOX',
        'SKID'
    },
    zoneParts = {
        { x1 = 285.43, y1 = -877.91, x2 = 505.03, y2 = -510.0 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.9,
        CATEGORY_MED = 0.7,
        CATEGORY_HIGH = 0.5
    }
}
cfg.gangZones['SKID'] = {
    name = 'SKID',
    label = 'Mission Row',
    neighbors = {
        'LMESA',
        'PBOX',
        'TEXTI',
        'RANCHO',
        'STRAW'
    },
    zoneParts = {
        { x1 = 199.43, y1 = -1158.02, x2 = 505.03, y2 = -877.91 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.2,
        CATEGORY_MED = 1.2,
        CATEGORY_HIGH = 1.2
    }
}]]
cfg.gangZones['DTVINE'] = {
    name = 'DTVINE',
    label = 'Downtown Vinewood',
    neighbors = {
        'WVINE',
        'HAWICK',
        'ALTA',
        'EAST_V'
    },
    zoneParts = {
        { x1 = 48.53, y1 = -20.78, x2 = 695.87, y2 = 445.02 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 0.85,
        CATEGORY_HIGH = 1.2
    }
}
cfg.gangZones['WVINE'] = {
    name = 'WVINE',
    label = 'West Vinewood',
    neighbors = {
        'BURTON',
        'ROCKF',
        'DTVINE',
        'HAWICK'
    },
    zoneParts = {
        { x1 = -743.39, y1 = 13.47, x2 = 48.53, y2 = 445.02 },
        { x1 = -246.39, y1 = -20.78, x2 = 48.53, y2 = 13.48 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.85,
        CATEGORY_MED = 1.0,
        CATEGORY_HIGH = 1.2
    }
}
cfg.gangZones['BURTON'] = {
    name = 'BURTON',
    label = 'Burton',
    neighbors = {
        'WVINE',
        'HAWICK',
        'ALTA',
        'ROCKF'
    },
    zoneParts = {
        { x1 = -594.91, y1 = -126.82, x2 = -246.39, y2 = 13.48 },
        { x1 = -550.21, y1 = -310.80, x2 = -246.39, y2 = -126.82 },
        { x1 = -246.39, y1 = -378.61, x2 = -90.0, y2 = -20.78 },
        { x1 = -246.39, y1 = -452.98, x2 = -90.0, y2 = -378.61 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.8,
        CATEGORY_MED = 0.8,
        CATEGORY_HIGH = 0.7
    }
}
cfg.gangZones['VCANA'] = {
    name = 'VCANA',
    label = 'Vespucci Canals',
    neighbors = {
        'MORN',
        'MOVIE',
        'KOREAT',
        'VESP'
    },
    zoneParts = {
        { x1 = -1319.77, y1 = -1074.78, x2 = -1095.41, y2 = -960.49 },
        { x1 = -1272.77, y1 = -960.49, x2 = -1095.41, y2 = -849.49 },
        { x1 = -1250.79, y1 = -1174.30, x2 = -1095.41, y2 = -1074.78 },
        { x1 = -1249.24, y1 = -1237.30, x2 = -1095.41, y2 = -1174.30 },
        { x1 = -1232.34, y1 = -1287.02, x2 = -1095.41, y2 = -1237.30 },
        { x1 = -1202.04, y1 = -1389.87, x2 = -1095.41, y2 = -1287.02 },
        { x1 = -1182.04, y1 = -1450.40, x2 = -1095.41, y2 = -1389.87 },
        { x1 = -1095.41, y1 = -1214.40, x2 = -774.41, y2 = -1019.71 },
        { x1 = -1095.41, y1 = -1019.71, x2 = -812.41, y2 = -907.78 },
        { x1 = -1095.41, y1 = -907.78, x2 = -865.98, y2 = -849.49 },
        { x1 = -1172.0, y1 = -849.49, x2 = -931.96, y2 = -723.01 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.2,
        CATEGORY_MED = 0.4,
        CATEGORY_HIGH = 0.8
    }
}
cfg.gangZones['ALTA'] = {
    name = 'ALTA',
    label = 'Alta',
    neighbors = {
        'BURTON',
        'DTVINE',
        'EAST_V',
        'HAWICK'
    },
    zoneParts = {
        { x1 = -90.0, y1 = -480.90, x2 = 695.99, y2 = -177.0 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 1.0,
        CATEGORY_HIGH = 1.0
    }
}
cfg.gangZones['EBURO'] = {
    name = 'EBURO',
    label = 'El Burro Heights',
    neighbors = {
        'LMESA'
    },
    zoneParts = {
        { x1 = 1118.89, y1 = -1901.45, x2 = 1485.92, y2 = -1391.50 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.5,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 0.3
    }
}
cfg.gangZones['CYPRE'] = {
    name = 'CYPRE',
    label = 'Cypress Flats',
    neighbors = {
        'RANCHO',
        'LMESA'
    },
    zoneParts = {
        { x1 = 618.7, y1 = -2718.48, x2 = 921.45, y2 = -1708.33 },
        { x1 = 921.45, y1 = -2718.48, x2 = 1048.54, y2 = -1901.45 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.5,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 0.2
    }
}
cfg.gangZones['BEACH'] = {
    name = 'BEACH',
    label = 'Vespucci Beach',
    neighbors = {
        'VCANA'
    },
    zoneParts = {
        { x1 = -1450.59, y1 = -1287.02, x2 = -1232.34, y2 = -1237.30 },
        { x1 = -1450.59, y1 = -1237.30, x2 = -1249.24, y2 = -1174.30 },
        { x1 = -1450.59, y1 = -1174.30, x2 = -1250.79, y2 = -1074.78 },
        { x1 = -1450.59, y1 = -1389.87, x2 = -1202.04, y2 = -1287.02 },
        { x1 = -1450.59, y1 = -1600.40, x2 = -1182.04, y2 = -1389.87 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 0.75
    }
}
cfg.gangZones['HAWICK'] = {
    name = 'HAWICK',
    label = 'Hawick',
    neighbors = {
        'EAST_V',
        'ALTA',
        'DTVINE',
        'BURTON',
        'WVINE'
    },
    zoneParts = {
        { x1 = -90.0, y1 = -177.0, x2 = 695.87, y2 = -20.78 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 1.0,
        CATEGORY_HIGH = 0.9
    }
}
cfg.gangZones['EAST_V'] = {
    name = 'EAST_V',
    label = 'East Vinewood',
    neighbors = {
        'HAWICK',
        'DTVINE',
        'ALTA'
    },
    zoneParts = {
        { x1 = 696.0, y1 = -282.5, x2 = 1391.0, y2 = -35.97 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.5,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 0.6
    }
}
cfg.gangZones['GRAPES'] = {
    name = 'GRAPES',
    label = 'Grapeseed',
    neighbors = {
        'SANDY'
    },
    zoneParts = {
        { x1 = 1605.27, y1 = 4543.62, x2 = 2413.98, y2 = 5269.38 },
        { x1 = 2413.98, y1 = 5138.80, x2 = 2498.52, y2 = 5269.38 },
        { x1 = 2413.98, y1 = 4778.17, x2 = 2561.79, y2 = 5138.80 },
        { x1 = 2413.98, y1 = 4417.53, x2 = 2632.58, y2 = 4778.17 },
        { x1 = 2413.98, y1 = 4036.53, x2 = 2734.72, y2 = 4417.53 },
        { x1 = 1605.27, y1 = 4820.46, x2 = 1648.42, y2 = 4931.77 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.3,
        CATEGORY_MED = 0.3,
        CATEGORY_HIGH = 0.2
    }
}
cfg.gangZones['SANDY'] = {
    name = 'SANDY',
    label = 'Sandy Shores',
    neighbors = {
        'GRAPES'
    },
    zoneParts = {
        { x1 = 1295.66, y1 = 3455.35, x2 = 2145.09, y2 = 4012.51 },
        { x1 = 2413.98, y1 = 3554.05, x2 = 2807.76, y2 = 4036.53 },
        { x1 = 2145.09, y1 = 3554.05, x2 = 2413.98, y2 = 3819.50 },
        { x1 = 2145.09, y1 = 3294.46, x2 = 2693.05, y2 = 3554.05 },
        { x1 = 2083.31, y1 = 3925.83, x2 = 2145.09, y2 = 3954.88 },
        { x1 = 2057.38, y1 = 3954.88, x2 = 2145.09, y2 = 4012.50 },
        { x1 = 1990.20, y1 = 3973.64, x2 = 2057.38, y2 = 4012.51 },
        { x1 = 1976.69, y1 = 3981.51, x2 = 1990.20, y2 = 3995.50 },
        { x1 = 1752.23, y1 = 3995.50, x2 = 1990.20, y2 = 4012.50 },
        { x1 = 1691.23, y1 = 3983.57, x2 = 1752.23, y2 = 4012.50 },
        { x1 = 1691.23, y1 = 3967.40, x2 = 1713.04, y2 = 3983.58 },
        { x1 = 1446.97, y1 = 3954.97, x2 = 1691.23, y2 = 4012.50 },
        { x1 = 1446.97, y1 = 3930.21, x2 = 1683.75, y2 = 3954.97 },
        { x1 = 1446.97, y1 = 3888.02, x2 = 1508.13, y2 = 3930.21 },
        { x1 = 1508.13, y1 = 3888.02, x2 = 1540.87, y2 = 3904.46 },
        { x1 = 1532.13, y1 = 3856.76, x2 = 1584.82, y2 = 3888.02 },
        { x1 = 1446.97, y1 = 3819.74, x2 = 1532.13, y2 = 3888.02 },
        { x1 = 1295.66, y1 = 3888.02, x2 = 1446.97, y2 = 4012.51 },
        { x1 = 1295.66, y1 = 3812.33, x2 = 1388.96, y2 = 3888.02 },
        { x1 = 1295.66, y1 = 3741.06, x2 = 1356.98, y2 = 3812.33 },
        { x1 = 1295.66, y1 = 3713.35, x2 = 1325.48, y2 = 3741.06 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.4,
        CATEGORY_MED = 0.4,
        CATEGORY_HIGH = 0.1
    }
}
cfg.gangZones['PALETO'] = {
    name = 'PALETO',
    label = 'Paleto Bay',
    neighbors = {},
    zoneParts = {
        { x1 = -333.95, y1 = 6006.86, x2 = -188.97, y2 = 6147.87 },
        { x1 = -282.23, y1 = 6147.87, x2 = -137.25, y2 = 6288.88 },
        { x1 = -137.25, y1 = 6195.79, x2 = 7.74, y2 = 6336.80 },
        { x1 = -59.31, y1 = 6336.80, x2 = 66.28, y2 = 6452.00 },
        { x1 = 66.28, y1 = 6409.34, x2 = 211.26, y2 = 6518.35 },
        { x1 = 110.86, y1 = 6518.35, x2 = 516.84, y2 = 6614.36 },
        { x1 = -680.83, y1 = 6147.87, x2 = -282.23, y2 = 6288.88 },
        { x1 = -598.05, y1 = 6288.88, x2 = -137.25, y2 = 6477.81 },
        { x1 = 66.28, y1 = 6518.35, x2 = 110.86, y2 = 6614.36 },
        { x1 = -357.76, y1 = 6477.81, x2 = 66.28, y2 = 6614.36 },
        { x1 = 10.82, y1 = 6614.36, x2 = 133.50, y2 = 7165.53 },
        { x1 = -188.97, y1 = 6006.86, x2 = -39.51, y2 = 6147.87 },
        { x1 = -137.25, y1 = 6147.87, x2 = -39.51, y2 = 6195.79 },
        { x1 = 7.74, y1 = 6195.79, x2 = 66.28, y2 = 6336.80 },
        { x1 = -137.25, y1 = 6336.80, x2 = -59.31, y2 = 6477.81 },
        { x1 = -59.31, y1 = 6452.00, x2 = 66.28, y2 = 6477.81 },
        { x1 = -481.00, y1 = 6006.37, x2 = -333.95, y2 = 6147.87 },
        { x1 = -112.83, y1 = 6614.36, x2 = 10.82, y2 = 6786.93 },
        { x1 = -202.03, y1 = 6614.36, x2 = -112.83, y2 = 6703.23 },
        { x1 = -164.47, y1 = 6703.23, x2 = -112.83, y2 = 6744.03 },
        { x1 = 133.50, y1 = 6614.36, x2 = 465.00, y2 = 6785.33 },
        { x1 = 133.50, y1 = 6785.33, x2 = 387.30, y2 = 6900.54 },
        { x1 = 133.50, y1 = 6900.54, x2 = 284.08, y2 = 6996.90 },
        { x1 = 133.50, y1 = 6996.90, x2 = 224.78, y2 = 7065.80 },
        { x1 = 465.00, y1 = 6705.98, x2 = 617.57, y2 = 6745.77 },
        { x1 = 387.30, y1 = 6785.33, x2 = 473.72, y2 = 6840.19 },
        { x1 = 284.08, y1 = 6900.54, x2 = 386.59, y2 = 6949.75 },
        { x1 = 133.50, y1 = 7065.80, x2 = 193.80, y2 = 7165.53 },
        { x1 = 224.78, y1 = 6996.90, x2 = 277.79, y2 = 7065.80 },
        { x1 = 284.08, y1 = 6949.75, x2 = 332.08, y2 = 6996.90 },
        { x1 = 387.30, y1 = 6840.19, x2 = 430.30, y2 = 6900.54 },
        { x1 = 465.00, y1 = 6745.77, x2 = 541.00, y2 = 6785.33 },
        { x1 = 465.00, y1 = 6614.36, x2 = 617.57, y2 = 6705.98 },
        { x1 = -43.31, y1 = 6882.58, x2 = 10.82, y2 = 7165.53 },
        { x1 = -103.31, y1 = 6786.93, x2 = 10.82, y2 = 6882.58 },
        { x1 = -234.25, y1 = 6006.86, x2 = -188.97, y2 = 6046.44 },
        { x1 = -61.55, y1 = 6006.86, x2 = -39.51, y2 = 6025.03 },
        { x1 = -165.24, y1 = 6006.86, x2 = -149.20, y2 = 6021.46 },
        { x1 = -58.57, y1 = 6115.46, x2 = -39.51, y2 = 6147.87 },
        { x1 = -117.17, y1 = 6056.50, x2 = -39.51, y2 = 6115.46 },
        { x1 = -108.56, y1 = 6006.86, x2 = -88.03, y2 = 6017.70 },
        { x1 = -128.49, y1 = 6020.11, x2 = -93.62, y2 = 6045.88 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.2,
        CATEGORY_MED = 0.2,
        CATEGORY_HIGH = 0.1
    }
}

-- This does not need to be edited as it's complete
cfg.zoneNames = {
    ['AIRP'] = 'Los Santos International Airport',
    ['ALAMO'] = 'Alamo Sea',
    ['ALTA'] = 'Alta',
    ['ARMYB'] = 'Fort Zancudo',
    ['BANHAMC'] = 'Banham Canyon Dr',
    ['BANNING'] = 'Banning',
    ['BEACH'] = 'Vespucci Beach',
    ['BHAMCA'] = 'Banham Canyon',
    ['BRADP'] = 'Braddock Pass',
    ['BRADT'] = 'Braddock Tunnel',
    ['BURTON'] = 'Burton',
    ['CALAFB'] = 'Calafia Bridge',
    ['CANNY'] = 'Raton Canyon',
    ['CCREAK'] = 'Cassidy Creek',
    ['CHAMH'] = 'Chamberlain Hills',
    ['CHIL'] = 'Vinewood Hills',
    ['CHU'] = 'Chumash',
    ['CMSW'] = 'Chiliad Mountain State Wilderness',
    ['CYPRE'] = 'Cypress Flats',
    ['DAVIS'] = 'Davis',
    ['DELBE'] = 'Del Perro Beach',
    ['DELPE'] = 'Del Perro',
    ['DELSOL'] = 'La Puerta',
    ['DESRT'] = 'Grand Senora Desert',
    ['DOWNT'] = 'Downtown',
    ['DTVINE'] = 'Downtown Vinewood',
    ['EAST_V'] = 'East Vinewood',
    ['EBURO'] = 'El Burro Heights',
    ['ELGORL'] = 'El Gordo Lighthouse',
    ['ELYSIAN'] = 'Elysian Island',
    ['GALFISH'] = 'Galilee',
    ['GOLF'] = 'GWC and Golfing Society',
    ['GRAPES'] = 'Grapeseed',
    ['GREATC'] = 'Great Chaparral',
    ['HARMO'] = 'Harmony',
    ['HAWICK'] = 'Hawick',
    ['HORS'] = 'Vinewood Racetrack',
    ['HUMLAB'] = 'Humane Labs and Research',
    ['JAIL'] = 'Bolingbroke Penitentiary',
    ['KOREAT'] = 'Little Seoul',
    ['LACT'] = 'Land Act Reservoir',
    ['LAGO'] = 'Lago Zancudo',
    ['LDAM'] = 'Land Act Dam',
    ['LEGSQU'] = 'Legion Square',
    ['LMESA'] = 'La Mesa',
    ['LOSPUER'] = 'La Puerta',
    ['MIRR'] = 'Mirror Park',
    ['MORN'] = 'Morningwood',
    ['MOVIE'] = 'Richards Majestic',
    ['MTCHIL'] = 'Mount Chiliad',
    ['MTGORDO'] = 'Mount Gordo',
    ['MTJOSE'] = 'Mount Josiah',
    ['MURRI'] = 'Murrieta Heights',
    ['NCHU'] = 'North Chumash',
    ['NOOSE'] = 'N.O.O.S.E',
    ['OCEANA'] = 'Pacific Ocean',
    ['PALCOV'] = 'Paleto Cove',
    ['PALETO'] = 'Paleto Bay',
    ['PALFOR'] = 'Paleto Forest',
    ['PALHIGH'] = 'Palomino Highlands',
    ['PALMPOW'] = 'Palmer-Taylor Power Station',
    ['PBLUFF'] = 'Pacific Bluffs',
    ['PBOX'] = 'Pillbox Hill',
    ['PROCOB'] = 'Procopio Beach',
    ['RANCHO'] = 'Rancho',
    ['RGLEN'] = 'Richman Glen',
    ['RICHM'] = 'Richman',
    ['ROCKF'] = 'Rockford Hills',
    ['RTRAK'] = 'Redwood Lights Track',
    ['SANAND'] = 'San Andreas',
    ['SANCHIA'] = 'San Chianski Mountain Range',
    ['SANDY'] = 'Sandy Shores',
    ['SKID'] = 'Mission Row',
    ['SLAB'] = 'Stab City',
    ['STAD'] = 'Maze Bank Arena',
    ['STRAW'] = 'Strawberry',
    ['TATAMO'] = 'Tataviam Mountains',
    ['TERMINA'] = 'Terminal',
    ['TEXTI'] = 'Textile City',
    ['TONGVAH'] = 'Tongva Hills',
    ['TONGVAV'] = 'Tongva Valley',
    ['VCANA'] = 'Vespucci Canals',
    ['VESP'] = 'Vespucci',
    ['VINE'] = 'Vinewood',
    ['WINDF'] = 'Ron Alternates Wind Farm',
    ['WVINE'] = 'West Vinewood',
    ['ZANCUDO'] = 'Zancudo River',
    ['ZP_ORT'] = 'Port of South Los Santos',
    ['ZQ_UAR'] = 'Davis Quartz'
}

cfg.dealerGainReputation = 60

cfg.dealerReputation = 70000

cfg.dealers = {
    ['EAST_V'] = vec4(973.76702880859, -192.25054931641, 73.1904296875, 184.25196838379),
    ['MIRR'] = vec4(1223.1296386719, -489.83737182617, 66.400024414063, 317.48031616211),
    ['LMESA'] = vec4(721.50329589844, -896.22857666016, 24.326049804688, 99.212593078613),
    ['EBURO'] = vec4(1218.052734375, -1537.7274169922, 34.84033203125, 127.55905151367),
    ['CYPRE'] = vec4(832.57580566406, -2314.1142578125, 30.476196289063, 334.48818969727),
    ['RANCHO'] = vec4(375.21759033203, -1827.1252441406, 28.87548828125, 221.10237121582),
    ['DAVIS'] = vec4(205.21319580078, -1683.9428710938, 29.80224609375, 340.15747070313),
    ['CHAMH'] = vec4(-226.73406982422, -1665.0988769531, 34.452758789063, 2.8346455097198),
    ['STRAW'] = vec4(126.81758117676, -1257.5472412109, 29.330444335938, 314.64566040039),
    ['PBOX'] = vec4(-188.38681030273, -630.39562988281, 32.413940429688, 243.77952575684),
    ['ALTA'] = vec4(366.38241577148, -312.40878295898, 46.719360351563, 337.32284545898),
    ['HAWICK'] = vec4(374.80880737305, -37.978019714355, 91.253540039062, 345.82678222656),
    ['BURTON'] = vec4(-538.36480712891, -44.887912750244, 42.658569335938, 342.99212646484),
    ['BEACH'] = vec4(-1359.2043457031, -1084.2592773438, 3.6007080078125, 104.88188934326),
    ['VCANA'] = vec4(-1101.8637695313, -882.23736572266, 3.735595703125, 240.94488525391),
    ['KOREAT'] = vec4(-674.50549316406, -1108.9846191406, 11.97509765625, 187.08660888672),
    ['MOVIE'] = vec4(-1127.1032714844, -547.43737792969, 32.464477539063, 357.16534423828),
    ['MORN'] = vec4(-1566.6593017578, -230.5714263916, 49.449096679688, 170.07873535156),
    ['ROCKF'] = vec4(-878.72967529297, -28.852745056152, 41.445434570313, 337.32284545898),
    ['WVINE'] = vec4(-354.052734375, 300.87033081055, 84.732666015625, 136.06298828125),
    ['DTVINE'] = vec4(466.74725341797, 212.34725952148, 103.09887695313, 79.370079040527),
    ['SANDY'] = vec4(1583.0900878906, 3596.9143066406, 35.396362304688, 76.535430908203),
    ['GRAPES'] = vec4(1911.2175292969, 4928.7163085938, 48.96044921875, 56.69291305542),
    ['PALETO'] = vec4(-156.48791503906, 6180.94921875, 31.352416992188, 294.80316162109)
}

cfg.dealerContracts = {
    {
        needs = {
            ['metalscrap'] = 30,
            ['valuablegoods'] = 30,
            ['black_money'] = 300000
        },

        recieve = {
            ['WEAPON_MICROSMG'] = 1,
            ['smg_ammo'] = 160
        }
    },

    {
        needs = {
            ['cloth'] = 30,
            ['steel'] = 10
        },

        recieve = {
            ['armor'] = 5
        }
    },

    {
        needs = {
            ['taara'] = 60,
            ['WEAPON_POOLCUE'] = 10
        },

        recieve = {
            ['rope'] = 2
        }
    },

    {
        needs = {
            ['thermiteexplosive'] = 10,
            ['gold'] = 10
        },

        recieve = {
            ['at_suppressor_light'] = 1,
            ['pistol_ammo'] = 120
        }
    },
    
    {
        needs = {
            ['bronze'] = 15,
            ['valuablegoods'] = 10,           
            ['snus_pack'] = 20
        },

        recieve = {
            ['at_suppressor_heavy'] = 1,
            ['pistol_ammo'] = 120
        }
    },
    
    {
        needs = {
            ['black_money'] = 50000,
            ['valuablegoods'] = 10,            
            ['rubber'] = 20
        },

        recieve = {
            ['at_clip_extended_pistol'] = 1,
            ['pistol_ammo'] = 120
        }
    },
    
    {
        needs = {
            ['stolenpsp'] = 3,
            ['valuablegoods'] = 10,
	        ['stolenmicrowave'] = 1
        },

        recieve = {
            ['at_clip_extended_smg'] = 1,
            ['smg_ammo'] = 140
        }
    },

    {
        needs = {
            ['valuablegoods'] = 10,
            ['diamond_necklace'] = 9,
	        ['oxy'] = 3
        },

        recieve = {
            ['at_clip_extended_rifle'] = 1,
            ['rifle_ammo'] = 140
        }
    },

    {
        needs = {
            ['lsd'] = 1,
            ['plastic'] = 10
        },

        recieve = {
            ['at_grip'] = 1
        }
    },

    {
        needs = {
            ['gold'] = 10,
            ['plastic'] = 9,
            ['valuablegoods'] = 10,
        },

        recieve = {
            ['at_scope_small'] = 1,
            ['pistol_ammo'] = 140
        }
    },

    {
        needs = {
            ['thermitecables'] = 1,
            ['coal'] = 9,
	        ['stolendrill'] = 1
        },

        recieve = {
            ['at_scope_medium'] = 1,
            ['pistol_ammo'] = 140
        }
    },

    {
        needs = {
            ['taara'] = 4,
            ['spray'] = 6,
	        ['rolex'] = 1
        },

        recieve = {
            ['at_skin_luxe'] = 1,
            ['pistol_ammo'] = 140
        }
    },

    {
        needs = {
            ['casio-watch'] = 1,
            ['metalscrap'] = 15,
            ['samsungphone'] = 1,
	        ['stolentv'] = 1
        },

        recieve = {
            ['at_skin_camo'] = 1,
            ['rifle_ammo'] = 160
        }
    },

    {
        needs = {
            ['black_money'] = 300000,
            ['valuablegoods'] = 30,
            ['taara'] = 15
        },

        recieve = {
            ['WEAPON_MINISMG'] = 1,
            ['pistol_ammo'] = 160
        }
    },

    {
        needs = {
            ['casio-watch'] = 1,
            ['metalscrap'] = 15,
            ['samsungphone'] = 1,
	        ['stolentv'] = 1
        },

        recieve = {
            ['at_scope_macro'] = 1,
            ['rifle_ammo'] = 160
        }
    },

    {
        needs = {
            ['coal'] = 1,
            ['glass'] = 15,
            ['gold'] = 15,
        },

        recieve = {
            ['at_scope_holo'] = 1,
            ['rifle_ammo'] = 160
        }
    },

    {
        needs = {
            ['metalscrap'] = 15,
            ['raw_iron'] = 15,
        },

        recieve = {
            ['advancedlockpick'] = 1,
        }
    },

    {
        needs = {
            ['taara'] = 10,
            ['stolenmonitor'] = 1
        },

        recieve = {
            ['spray'] = 1,
            ['pistol_ammo'] = 70
        }
    },
}

cfg.npcTexts = {
    "Tere! Kas teil on midagi huvitavat müügil?",  
    "Olen otsinud kvaliteetset kaupa. Mida teil pakkuda on?",  
    "Rõõm teid kohata! Otsin midagi erilist – näidake oma parimaid tooteid.",  
    "Vau, teie valik on muljetavaldav! Näidake mulle parimat, mis teil on!",  
    "Mul on raha kulutada ja otsin head tehingut. Kaupleme!",  
    "Mis on täna eripakkumises? Tahan esimesena näha teie kaupu.",  
    "Otsin aardeid oma kollektsiooni. Üllatage mind!",  
    "Vajan oma varustuse täiendamist. Näidake midagi, mis eristub.",  
    "Kuulsin, et teil on parim kaup. Mida te mulle pakkuda saate?",  
    "Olen valmis kauplema – näidake, mida teil on!"  
}

cfg.drugs = {
    CATEGORY_LOW = {
        ['snus_tower'] = {
            reward = { min = 200, max = 300 },
            reputation = 2
        },
        ['cigarett_block'] = {
            reward = { min = 300, max = 400 },
            reputation = 2
        },
        ['cigarello'] = {
            reward = { min = 500, max = 600 },
            reputation = 2
        },
        ['cigarello_pack'] = {
            reward = { min = 600, max = 700 },
            reputation = 2
        },
    },

    CATEGORY_MED = {
        ['weed_pooch'] = {
            reward = { min = 700, max = 800 },
            reputation = 4
        },
    },

    CATEGORY_HIGH = {
        ['lsd'] = {
            reward = { min = 750, max = 875 },
            reputation = 4
        },
        ['moonshine'] = {
            reward = { min = 900, max = 1000 },
            reputation = 4
        },
        ['alcohol'] = {
            reward = { min = 1300, max = 1500 },
            reputation = 4
        },
        ['amphetamine_pooch'] = {
            reward = { min = 1700, max = 1900 },
            reputation = 6
        },
        ['coke_pooch'] = {
            reward = { min = 2100, max = 2300 },
            reputation = 6
        },
        ['heroin_pooch'] = {
            reward = { min = 2500, max = 2700 },
            reputation = 6
        },
    }
}

cfg.pedList = {
    'a_f_m_bevhills_01',
    'a_f_m_bevhills_02',
    'a_f_m_business_02',
    'a_f_m_downtown_01',
    'a_f_m_eastsa_01',
    'a_f_m_eastsa_02',
    'a_f_m_fatbla_01',
    'a_f_m_fatwhite_01',
    'a_f_m_ktown_01',
    'a_f_m_ktown_02',
    'a_f_m_prolhost_01',
    'a_f_m_salton_01',
    'a_f_m_skidrow_01',
    'a_f_m_soucent_01',
    'a_f_m_soucent_02',
    'a_f_m_soucentmc_01',
    'a_f_m_tourist_01',
    'a_f_m_tramp_01',
    'a_f_m_trampbeac_01',
    'a_f_o_genstreet_01',
    'a_f_o_indian_01',
    'a_f_o_ktown_01',
    'a_f_o_salton_01',
    'a_f_o_soucent_01',
    'a_f_o_soucent_02',
    'a_f_y_beach_01',
    'a_f_y_bevhills_01',
    'a_f_y_bevhills_02',
    'a_f_y_bevhills_03',
    'a_f_y_bevhills_03',
    'a_f_y_business_01',
    'a_f_y_business_02',
    'a_f_y_business_03',
    'a_f_y_business_04',
    'a_f_y_clubcust_01',
    'a_f_y_clubcust_02',
    'a_f_y_clubcust_03',
    'a_f_y_eastsa_01',
    'a_f_y_eastsa_02',
    'a_f_y_eastsa_03',
    'a_f_y_epsilon_01',
    'a_f_y_femaleagent',
    'a_f_y_fitness_01',
    'a_f_y_fitness_02',
    'a_f_y_genhot_01',
    'a_f_y_golfer_01',
    'a_f_y_hiker_01',
    'a_f_y_hippie_01',
    'a_f_y_hipster_01',
    'a_f_y_hipster_02',
    'a_f_y_hipster_03',
    'a_f_y_hipster_04',
    'a_f_y_indian_01',
    'a_f_y_juggalo_01',
    'a_f_y_runner_01',
    'a_f_y_rurmeth_01',
    'a_f_y_scdressy_01',
    'a_f_y_skater_01',
    'a_f_y_soucent_01',
    'a_f_y_soucent_02',
    'a_f_y_soucent_03',
    'a_f_y_tennis_01',
    'a_f_y_tourist_01',
    'a_f_y_tourist_02',
    'a_f_y_vinewood_01',
    'a_f_y_vinewood_02',
    'a_f_y_vinewood_03',
    'a_f_y_vinewood_04',
    'a_f_y_yoga_01',
    'a_f_y_gencaspat_01',
    'a_f_y_smartcaspat_01',
	'a_m_m_afriamer_01',
    'a_m_m_beach_01',
    'a_m_m_beach_02',
    'a_m_m_bevhills_01',
	'a_m_y_breakdance_01',
	'a_m_y_busicas_01',
	'a_m_y_business_01',
	'a_m_y_business_02',
	'a_m_y_business_03',
	'a_m_y_clubcust_01',
	'a_m_y_clubcust_02',
	'a_m_y_clubcust_03',
	'a_m_y_cyclist_01',
	'a_m_y_dhill_01',
	'a_m_y_downtown_01',
	'a_m_y_eastsa_01',
	'a_m_y_eastsa_02',
	'a_m_y_epsilon_01',
	'a_m_y_epsilon_02',
	'a_m_y_gay_01',
	'a_m_y_gay_02',
	'a_m_y_genstreet_01',
	'a_m_y_genstreet_02',
	'a_m_y_golfer_01',
	'a_m_y_hasjew_01',
	'a_m_y_hiker_01',
	'a_m_y_hippy_01',
	'a_m_y_hipster_01',
	'a_m_y_hipster_02',
	'a_m_y_hipster_03',
	'a_m_y_indian_01',
	'a_m_y_jetski_01',
	'a_m_y_juggalo_01',
	'a_m_y_ktown_01',
	'a_m_y_ktown_02',
	'a_m_y_latino_01',
	'a_m_y_methhead_01',
	'a_m_y_mexthug_01',
	'a_m_y_motox_01',
	'a_m_y_motox_02',
	'a_m_y_musclbeac_01',
	'a_m_y_musclbeac_02',
	'a_m_y_polynesian_01',
	'a_m_y_roadcyc_01',
	'a_m_y_runner_01',
	'a_m_y_runner_02',
	'a_m_y_salton_01',
	'a_m_y_skater_01',
	'a_m_y_skater_02',
	'a_m_y_soucent_01',
	'a_m_y_soucent_02',
	'a_m_y_soucent_03',
	'a_m_y_soucent_04',
	'a_m_y_stbla_01',
	'a_m_y_stbla_02',
	'a_m_y_stlat_01',
	'a_m_y_stwhi_01',
	'a_m_y_stwhi_02',
	'a_m_y_sunbathe_01',
	'a_m_y_surfer_01',
	'a_m_y_vindouche_01',
	'a_m_y_vinewood_01',
	'a_m_y_vinewood_02',
	'a_m_y_vinewood_03',
	'a_m_y_vinewood_04',
	'a_m_y_yoga_01',
	'a_m_m_mlcrisis_01',
	'a_m_y_gencaspat_01',
	'a_m_y_smartcaspat_01',
}

cfg.contrabandItem = {
    name = 'coke',
    count = {min = 10, max = 20}
}

cfg.contrabandCount = 15 -- pack count

cfg.contrabandReputation = 1000000

cfg.contrabandLocations = {
    vec4(2633.5913085938, 2932.6945800781, 44.731079101562, 303.30709838867),
    vec4(2351.947265625, 3115.859375, 48.2021484375, 31.181102752686),
    vec4(1980.4088134766, 3049.5034179688, 50.426391601562, 235.27558898926),
    vec4(1384.9318847656, 3615.3625488281, 38.91796875, 328.81890869141),
    vec4(1423.0681152344, 3662.17578125, 39.726684570312, 51.023624420166),
    vec4(2427.666015625, 3083.7758789062, 48.994140625, 0.0),
    vec4(264.67254638672, 2592.2768554688, 45.11865234375, 184.25196838379),
    vec4(-1513.2131347656, 1522.5758056641, 111.60803222656, 153.07086181641),
    vec4(-406.31207275391, 1086.0395507812, 327.69006347656, 175.74803161621),
    vec4(1657.859375, 4.9054946899414, 166.1171875, 223.93701171875),
    vec4(-3262.24609375, 973.56921386719, 8.3355712890625, 45.354328155518),
    vec4(-3263.3405761719, 953.69671630859, 8.3355712890625, 45.354328155518),
    vec4(-3082.5495605469, 764.33404541016, 31.251342773438, 221.10237121582),
    vec4(1704.7385253906, 3292.8000488281, 48.909912109375, 48.188972473145)
}

cfg.contrabandDelivery = {
    vec4(-1038.0922851562, -2869.8725585938, 41.462280273438, 345.82678222656),
    vec4(-1123.5560302734, -2820.263671875, 39.709838867188, 22.677164077759),
    vec4(-493.22637939453, -2685.4020996094, 17.367065429688, 82.204727172852),
    vec4(-414.89669799805, -2600.7824707031, 8.739990234375, 221.10237121582),
    vec4(-81.520874023438, -2719.4372558594, 8.739990234375, 59.52755355835),
    vec4(28.087913513184, -2678.8747558594, 12.025634765625, 229.60629272461),
    vec4(38.518684387207, -2677.0944824219, 17.14794921875, 348.6614074707),
    vec4(587.9736328125, -3117.771484375, 18.698120117188, 221.10237121582),
    vec4(551.07690429688, -3117.9428710938, 18.698120117188, 104.88188934326),
    vec4(1014.5406494141, -2892.6198730469, 19.20361328125, 195.5905456543),
    vec4(1236.10546875, -2912.9274902344, 25.320190429688, 25.511812210083),
    vec4(1249.0285644531, -3034.140625, 9.3634033203125, 22.677164077759),
    vec4(884.54504394531, -952.20660400391, 44.107666015625, 212.59841918945),
    vec4(-578.0439453125, -1614.0, 27.02197265625, 11.338582038879),
    vec4(-51.599998474121, -2522.9011230469, 7.3919677734375, 70.866142272949)
}