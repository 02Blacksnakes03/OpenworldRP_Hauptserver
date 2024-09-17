Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale = 'de'

Config.PoliceStations = {

	nightshadow = {

		Cloakrooms = {},

		Armories = {
			vector3(1405.15,1136.63,109.75)
		},

		Vehicles = {
			{
				Spawner = vector3(1412.68,1114.86,114.84),
				InsideShop = vector3(1791.30,689.56,267.06), 
				SpawnPoints = {
					{ coords = vector3(1407.27,1118.03,114.91), heading = 90.00, radius = 6.0 }				
				}
			}
		},

		Helicopters = {
		    {
			    Spawner = vector3(1436.79,1065.8,114.18),
				InsideShop = vector3(1793.19,686.56,267.68),
				SpawnPoints = {
					{ coords = vector3(1448.94,1066.37,115.01), heading = 92.39, radius = 6.0 },
				}
			}
		},

		BossActions = {
			vector3(1393.26,1159.86,114.33)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {},

	chef = {},

	boss = {
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_POOLCUE', price = 0 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'granger', label = 'Granger', price = 300000 },
		{ model = 'vstr', label = 'V-STR', price = 300000 },
		{ model = 'ninef', label = '9F', price = 300000 },
		{ model = 'schafterg', label = 'Schafter', price = 300000 },
		{ model = 'revolter', label = 'Revolter', price = 300000 },
		{ model = 'rs6avant20', label = 'Audi RS6', price = 1 },
		{ model = '19S650', label = 'Mercedes Maybach', price = 1 },
		{ model = 'q820', label = 'Audi SQ8', price = 1},
		{ model = '2016rs7', label = 'Audi RS7', price = 1},
		{ model = 'tdf', label = 'Ferrari F12 TDF', price = 1},
	},

	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {
		{ model = 'youga3', label = 'Youga3', price = 20000 },
		{ model = 'hbox', label = 'Hauler', price = 279000},
		{ model = 'unimog', label = 'Mercedes UNI MOG', price = 279000},
		{ model = 'mule', label = 'Mule', price = 279000 },
		{ model = 'journey', label = 'Journey', price = 720000 },
		{ model = 'benson', label = 'Benson', price = 103500 },
		{ model = 'gazel', label = 'Gazel', price = 103500 },
		{ model = 'terl300', label = 'Terl300', price = 1035000 },
		{ model = 'pounder', label = 'Pounder', price = 1575000 },
	},

	boss = {
		{ model = 'youga3', label = 'Youga3', price = 20000 },
		{ model = 'mule', label = 'Mule', price = 279000 },
		{ model = 'hbox', label = 'Hauler', price = 279000},
		{ model = 'gazel', label = 'Gazel', price = 103500 },
		{ model = 'terl300', label = 'Terl300', price = 103500 },
		{ model = 'unimog', label = 'Mercedes UNI MOG', price = 279000},
		{ model = 'journey', label = 'Journey', price = 720000 },
		{ model = 'benson', label = 'Benson', price = 1035000 },
		{ model = 'pounder', label = 'Pounder', price = 1575000 },
	}
}

Config.AuthorizedHelicopters = {
	recruit = {
	    --{ model = 'supervolito', label = 'Volito', price = 1 },
	},

	officer = {
	    { model = 'supervolito', label = 'Volito', price = 1 },
	},

	sergeant = {
	    { model = 'supervolito', label = 'Volito', price = 1 },
	},

	intendent = {
	    { model = 'supervolito', label = 'Volito', price = 1 },
	},

	lieutenant = {
	    { model = 'supervolito', label = 'Volito', price = 1 },
	},

	chef = {
	    { model = 'supervolito', label = 'Volito', price = 1 },
	},

	boss = {
	    { model = 'supervolito', label = 'Volito', price = 1 },
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {},
	officer_wear = {},
	sergeant_wear = {},
	intendent_wear = {},
	lieutenant_wear = {},
	chef_wear = {},
	boss_wear = { },
	bullet_wear = {
		male = {
			['bproof_1'] = 27,  ['bproof_2'] = 5
		},
		female = {
			['bproof_1'] = 29,  ['bproof_2'] = 5
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}