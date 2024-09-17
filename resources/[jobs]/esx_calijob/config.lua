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

	Cali = {

		Cloakrooms = {
		
		},

		Armories = {
			vector3(-50.85,76.62,71.94)
	
		},


			Vehicles = {
				{
					Spawner = vector3(-106.00,33.09,71.44),
					InsideShop = vector3(-94.83,32.44,76.37),
					SpawnPoints = {
						{ coords = vector3(-105.99,38.52,71.47), heading = 69.12, radius = 6.0 },
					},
				},
				{
					Spawner = vector3(-196.98,-1296.17,31.3),
					InsideShop = vector3(-411.78,-143.46,64.46),
					SpawnPoints = {
						{ coords = vector3(-205.53,-1299.78,31.3), heading = 178.15, radius = 6.0 },
					}
				}
			},
		

		Helicopters = {
		        {
					Spawner = vector3(-183.57,-1288.09,31.3),
					InsideShop = vector3(-184.57,-1288.09,31.3),
					SpawnPoints = {
						{ coords = vector3(-184.57,-1288.09,31.3), heading = 177.70, radius = 6.0 },
				    }
			    }
		    },

		BossActions = {
			vector3(-53.27,71.99,71.92)
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
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	}
}

Config.AuthorizedVehicles = {           
	Shared = {
		{ model = 'oldm6', label = 'BMW M6', price = 1 },
		{ model = 'golf75r', label = 'VW Golf 7 R', price = 1 },
		{ model = 'r33', label = 'Nissan GTR R33', price = 1 },
	},                      

	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {},

	chef = {},

	boss = {}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {},

	chef = {},

	boss = {
		{ model = 'supervolito', label = 'Luca', price = 1},
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