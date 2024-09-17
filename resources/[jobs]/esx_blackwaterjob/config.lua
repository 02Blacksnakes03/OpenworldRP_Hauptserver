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

	blackwater = {

		Cloakrooms = {},

		Armories = {
			vector3(-111.41,999.79,235.79)
		},

		Vehicles = {
			{
				Spawner = vector3(-128.16,1009.09,235.73), 
				InsideShop = vector3(-113.27,1007.43,235.77), 
				SpawnPoints = {
					{ coords = vector3(-128.72,1004.73,235.73), heading = 200.51, radius = 6.0 }				
				}
			}
		},

		Helicopters = {
			{}
		},

		BossActions = {
			vector3(-104.62,975.93,235.76)
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
		{ weapon = 'WEAPON_MACHETE', price = 0 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		
		{ model = 'schafter4', label = 'Schafter', price = 350000 },
		{ model = 'baller4', label = 'Baller LWB', price = 300000 },
		{ model = 'q820', label = 'Audi SQ8 <3 Blacki', price = 1},
		{ model = 'w222wald', label = 'Mercedes <3 Blacki', price = 1},
		{ model = 'lumma750', label = 'BMW <3 Blacki', price = 1},
		{ model = 'cognoscenti', label = 'Cognoscenti 55', price = 400000 },
		{ model = 'sandking', label = 'Sandking', price = 400000 },
		{ model = 'revolter', label = 'Revolter', price = 300000 }
	},

	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {},

	chef = {},

	boss = {
		{ model = 'schafterg', label = 'Schafter LWB', price = 400000 },
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