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

	locos = {

		Cloakrooms = {},

		Armories = {
			vector3(731.28,2528.07,73.51),
		},

		Vehicles = {
			{
				Spawner = vector3(730.60,2530.18,73.23), 
				InsideShop = vector3(752.71,2581.22,74.67), 
				SpawnPoints = {
					{ coords = vector3(734.95,2534.27,73.18), heading = 277.12, radius = 6.0 }				
				}
			}
		},

		Helicopters = {
			{}
		},

		BossActions = {
			vector3(716.38,2526.74,73.51)
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
		{ weapon = 'WEAPON_POOLCUE', price = 0 },
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

	chef = {},

	boss = {
		{ model = 'schafterg', label = 'SchafterLWB', price = 1 }
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