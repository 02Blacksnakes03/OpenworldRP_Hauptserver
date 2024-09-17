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

	Lcn = {

		Cloakrooms = {
		
		},

		Armories = {
			vector3(-1522.65,117.35,50.05)

		},

		Vehicles = {
			{
				Spawner = vector3(-1521.88,80.09,56.75),
				InsideShop = vector3(-1543.53,112.97,55.78),
				SpawnPoints = {
					{ coords = vector3(-1532.48,82.66,56.43), heading = 315.75, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-1570.91,127.18,58.3),
				InsideShop = vector3(-1603.38,111.86,60.91),
				SpawnPoints = {
					{ coords = vector3(-1606.96,97.71,61.37), heading = 62.45, radius = 6.0 }
				}
			}
		},

		BossActions = {
			vector3(-1544.85,137.13,55.97)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {},

	officer = {
		{ weapon = 'WEAPON_PISTOL', price = 0 }
	},

	sergeant = {
		{ weapon = 'WEAPON_PISTOL', price = 0 }
	},

	intendent = {
		{ weapon = 'WEAPON_PISTOL', price = 0 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_GOLFCLUB', price = 1 }
	},

	chef = {},

	boss = {
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_GOLFCLUB', price = 1 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'schafterg', label = 'Schafter', price = 300000},
		{ model = 'revolter', label = 'Revolter', price = 300000},
		{ model = 'gburrito2', label = 'WaffenBurrito', price = 300000},
		{ model = 'jugular', label = 'Jugular', price = 300000},
		{ model = 'drafter', label = 'Drafter', price = 300000},
		{ model = 's600w220', label = 's600', price = 1},
		{ model = 'g65amg', label = 'G-Klasse', price = 1},
	},


	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	boss = {
		{ model = 'schafterg', label = 'LeaderSchafter', price = 1},
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {
		{ model = 'buzzard2', label = 'Buzzard', price = 1},
	},

	lieutenant = {
		{ model = 'buzzard2', label = 'Buzzard', price = 1},
	},

	chef = {
		{ model = 'buzzard2', label = 'Buzzard', price = 1},
	},

	boss = {
		{ model = 'cargobob2', label = 'Cargobob', price = 1},
		{ model = 'buzzard2', label = 'Buzzard', price = 1},
	},
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {},
	officer_wear = {},
	sergeant_wear = {},
	intendent_wear = {},
	lieutenant_wear = {},
	chef_wear = {},
	boss_wear = {},
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