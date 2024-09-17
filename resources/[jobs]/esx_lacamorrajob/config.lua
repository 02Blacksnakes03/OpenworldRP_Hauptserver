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
			vector3(-184.42,-1539.49,34.36)
		},

		Vehicles = {
			{
				Spawner = vector3(-194.51,-1581.52,34.75),
				InsideShop = vector3(-170.1,-1667.32,32.76), 
				SpawnPoints = {
					{ coords = vector3(-184.7,-1589.44,34.29), heading = 230.74, radius = 6.0 }				
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
			vector3(-178.78,-1558.34,35.36)
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
		{ model = 'schafterg', label = 'Schafter', price = 300000 },
		{ model = 'revolter', label = 'Revolter', price = 300000 },
		{ model = 'dubsta3', label = 'Dubsta 6x6', price = 300000 },
		{ model = 'jugular', label = 'Jugular', price = 300000 },
		{ model = 'P2', label = 'McLaren P1', price = 1 },
		{ model = 'pistas', label = 'Ferrari Pista S', price = 1 },
	},

	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {},
	

	boss = {
		{ model = 'schafterg', label = 'Leader Schafter', price = 300000 }
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