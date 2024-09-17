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
Config.Locale = 'en'

Config.PoliceStations = {

	Cali = {

		Cloakrooms = {
		
		},

		Armories = {
			vector3(-649.00,852.52,225.15),
			vector3(-111.41,999.79,235.79)
	
		},


			Vehicles = {
				{
					Spawner = vector3(-667.93,905.32,230.14),
					InsideShop = vector3(-441.64,851.89,228.21),
					SpawnPoints = {
						{ coords = vector3(-675.50,902.47,230.15), heading = 326.48, radius = 6.0 },
					}
				},
				{
				Spawner = vector3(-128.16,1009.09,235.73), 
				InsideShop = vector3(-113.27,1007.43,235.77), 
				SpawnPoints = {
					{ coords = vector3(-128.72,1004.73,235.73), heading = 200.51, radius = 6.0 }				
				}
			}
				
			},
		

		Helicopters = {
			{
				Spawner = vector3(-674.14,889.94,229.34),
				InsideShop = vector3(-689.96,855.73,222.36),
				SpawnPoints = {
					{ coords = vector3(-690.02,863.74,223.44), heading = 90.72, radius = 6.0 },
				}
			}
		},

		BossActions = {
			vector3(-647.82,854.09,229.34),
			vector3(-58.85,981.32,234.58)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
	    { weapon = 'WEAPON_KNUCKLE', price = 0 }
	},

	officer = {
	    { weapon = 'WEAPON_KNUCKLE', price = 0 }
	},

	sergeant = {
	    { weapon = 'WEAPON_KNUCKLE', price = 0 }
	},

	intendent = {
	    { weapon = 'WEAPON_KNUCKLE', price = 0 }
	},

	lieutenant = {
	    { weapon = 'WEAPON_KNUCKLE', price = 0 }
	},

	chef = {
	    { weapon = 'WEAPON_KNUCKLE', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_KNUCKLE', price = 0 }
	}
}

Config.AuthorizedVehicles = {           
	Shared = {
		{ model = 'schafterg', label = 'Schafter', price = 300000 },
		{ model = 'revolter', label = 'Revolter', price = 300000 },
		{ model = 'windsor2', label = 'Windsor Cabrio', price = 300000 },
		{ model = 'rebla', label = 'Rebla GTS', price = 300000 },
		{ model = 'jugular', label = 'Jugular', price = 300000 },
		{ model = 'rrphantom', label = 'Rolls-Royce Phantom', price = 1 },
		{ model = 'w222wald', label = 'Mercedes W222 Wald', price = 1 },
		{ model = 'cls2015', label = 'Mercedes CLS 63', price = 1},
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
	recruit = {
		{ model = 'volatus', label = 'Volatus', price = 1 },
	},

	officer = {
		{ model = 'volatus', label = 'Volatus', price = 1 },
	},


	sergeant = {
		{ model = 'volatus', label = 'Volatus', price = 1 },
	},

	intendent = {
		{ model = 'volatus', label = 'Volatus', price = 1 },
	},

	lieutenant = {
		{ model = 'volatus', label = 'Volatus', price = 1 },
	},

	chef = {
		{ model = 'volatus', label = 'Volatus', price = 1 },
	},

	boss = {
		{ model = 'volatus', label = 'Volatus', price = 1 },
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