Config                            = {}

Config.DrawDistance               = 20.0
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

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = -1
Config.Locale                     = 'de'

Config.fibStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(113.58, -728.46, 33.13),
			Sprite  = 88,
			Display = 4,
			Scale   = 1.0,
			Colour  = 38
		},

		Cloakrooms = {
			vector3(151.71, -736.6, 242.15)
		},

		Armories = {
			vector3(144.09, -762.82, 242.15)
		},

		Vehicles = {
			{
				Spawner = vector3(113.58, -728.46, 33.13),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(107.66, -731.63, 32.78), heading = 340.0, radius = 2.0 },
					{ coords = vector3(104.03, -730.31, 32.74), heading = 338.0, radius = 2.0 },
					{ coords = vector3(100.51, -728.91, 32.74), heading = 339.0, radius = 2.0 },
					{ coords = vector3(96.6, -727.61, 32.74), heading = 340.0, radius = 2.0 },
				}
			},
		},
		
		
		Helicopters = {
			{
				Spawner = vector3(-75.55, -820.02, 326.18),
				InsideShop = vector3(-2594.73, 1881.4, 171.49),
				SpawnPoints = {
					{ coords = vector3(-75.55, -820.02, 326.18), heading = 313.59, radius = 10.0 }
				}
			}
		},
		

		BossActions = {
			vector3(149.38, -759.46, 242.15)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	officer = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	sergeant = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	intendent = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	chef = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPDW', price = 0 },
		{ weapon = 'WEAPON_PISTOL50', price = 0 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'fbi', label = 'FIB Buffalo', price = 1 },

	},

	recruit = {
	},

	officer = {
	},

	sergeant = {
	},

	intendent = {
	},

	lieutenant = {

	},

	chef = {
	},

	boss = {
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {
		{ model = 'supervolito', label = 'FIB', livery = 0, price = 1 }
	},

	chef = {
		{ model = 'supervolito', label = 'FIB', livery = 0, price = 1 }
	},

	boss = {
		{ model = 'supervolito', label = 'FIB', livery = 0, price = 1 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 139,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 17,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 1,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 139,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 17,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 1,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 139,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 17,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 1,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 139,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 17,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 1,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
	male = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 139,   ['torso_2'] = 3,
		['decals_1'] = 0,   ['decals_2'] = 3,
		['arms'] = 17,
		['pants_1'] = 28,   ['pants_2'] = 0,
		['shoes_1'] = 1,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 2,     ['ears_2'] = 0
	},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 139,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 17,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 1,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 139,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 17,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 1,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 9,  ['bproof_2'] = 1
		}
	},
	bullet1_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 9,  ['bproof_2'] = 1
		}
	},
	bullet2_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 9,  ['bproof_2'] = 1
		}
	},
	bullet3_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 9,  ['bproof_2'] = 1
		}
	},
	bullet4_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 9,  ['bproof_2'] = 1
		}
	},				
	bullet5_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 9,  ['bproof_2'] = 1
		}
	},		
	bullet6_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 9,  ['bproof_2'] = 1
		}
	},			
	bullet7_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 9,  ['bproof_2'] = 1
		}
	},				
	gilet_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 1
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}