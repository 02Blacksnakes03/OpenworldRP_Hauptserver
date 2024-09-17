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
			vector3(-1501.49,857.03,181.59)
		},

		Vehicles = {
			{
				Spawner = vector3(-1551.2,880.35,181.32), 
				InsideShop = vector3(-1536.22,881.69,181.17), 
				SpawnPoints = {
					{ coords = vector3(-1548.54,883.42,180.89), heading = 200.87, radius = 6.0 }				
				}
			}
		},

		Helicopters = {
		    {
			    Spawner = vector3(-1901.09,2062.84,140.89),
				InsideShop = vector3(-1908.7,2050.73,140.74),
				SpawnPoints = {
					{ coords = vector3(-1910.27,2045.74,140.74), heading = 213.32, radius = 6.0 },
				}
			}
		},

		BossActions = {
			vector3(-1520.42,849.36,181.59) 
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
		{ weapon = 'WEAPON_SWITCHBLADE', price = 0 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'revolter', label = 'Revolter', price = 300000 },
	},

	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {},

	boss = {
		{ model = 'schafterg', label = 'Leaderschafter', price = 300000},
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {},

	chef = {},

	boss = {}
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