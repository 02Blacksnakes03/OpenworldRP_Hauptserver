Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, rotate = true }

Config.ReviveReward               = 0  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombat              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 13.00 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 10 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 500

--Für Revive
Config.Revive = { coords = vector3(308.86, -587.99, 43.28), heading = 48.5} 

Config.RespawnPoint = { coords = vector3(308.86, -587.99, 43.28), heading = 48.5}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(305.58, -586.7, 43.28),
			sprite = 61,
			scale  = 1.0,
			color  = 0
		},

		AmbulanceActions = {
			vector3(298.86, -598.73, 43.28)
		},

		Pharmacies = {
			vector3(344.75, -564.86, 28.74),
			vector3(306.93, -601.8, 43.28)
		},

		Vehicles = {
			{
				Spawner = vector3(334.29, -561.03, 28.74),
				InsideShop = vector3(343.51, -561.35, 28.74),
				Marker = { type = -1, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(331.69, -553.94, 28.51), heading = 342.79, radius = 4.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(341.69, -579.97, 74.17),
                InsideShop = vector3(-73.99, -819.16, 326.07),
                Marker = { type = -1, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
                SpawnPoints = {
                    { coords = vector3(351.46, -587.17, 74.17), heading = 111.78, radius = 10.0 },
                   -- { coords = vector3(-457.68, -288.78, 80.07), heading = 18.05, radius = 10.0 }
				}
			}
		},

		FastTravels = {
			{
				From = vector3(-23733.67, -405.54, 47.92),
				To = { coords = vector3(-234.82, -391.98, -84.93), heading = 0.0 },
				Marker = { type = -1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(-23433.82, -391.98, -84.93),
				To = { coords = vector3(-237.67, -405.54, 47.92), heading = 0.0 },
				Marker = { type = -1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(24733.3, -1371.5, 23.5),
				To = { coords = vector3(333.1, -1434.9, 45.5), heading = 138.6 },
				Marker = { type = -1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(33533.5, -1432.0, 45.50),
				To = { coords = vector3(249.1, -1369.6, 23.5), heading = 0.0 },
				Marker = { type = -1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(23433.5, -1373.7, 20.9),
				To = { coords = vector3(320.9, -1478.6, 28.8), heading = 0.0 },
				Marker = { type = -1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(31733.9, -1476.1, 28.9),
				To = { coords = vector3(238.6, -1368.4, 23.5), heading = 0.0 },
				Marker = { type = -1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, rotate = false }
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(23777.4, -1373.8, 26.0),
				To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
				Marker = { type = -1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(25677.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = -1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	},

	doctor = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	},

	chief_doctor = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	},

	rang4 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1},
		{ model = 'dodgeems', label = 'NEF', price = 1}
	},

	rang5 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1},
		{ model = 'dodgeems', label = 'NEF', price = 1}

	},

	rang6 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1},
		{ model = 'dodgeems', label = 'NEF', price = 1}

	},

	rang7 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1},
		{ model = 'dodgeems', label = 'NEF', price = 1}

	},

	rang8 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1},
		{ model = 'dodgeems', label = 'NEF', price = 1}
	},

	rang9 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1},
		{ model = 'dodgeems', label = 'NEF', price = 1},
	},

	rang10 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1},
		{ model = 'dodgeems', label = 'NEF', price = 1},
		{ model = 'dodgesamu', label = 'Chef NEF', price = 1},
	},
	
	rang11 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1},
		{ model = 'dodgeems', label = 'NEF', price = 1},
		{ model = 'dodgesamu', label = 'Chef NEF', price = 1},
		{ model = 'mdchiron', label = 'Leitungs-Bugatti', price = 1}
	},

	boss = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1},
		{ model = 'dodgeems', label = 'NEF', price = 1},
		{ model = 'dodgesamu', label = 'Chef NEF', price = 1},
		{ model = 'mdchiron', label = 'Leitungs-Bugatti', price = 1}
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {},

	chief_doctor = {},

	rang4 = {},

	rang5 = {
	    { model = 'polmav', label = 'RTH', livery = 1, price = 1 }
	},

	rang6 = {
	    { model = 'polmav', label = 'RTH', livery = 1, price = 1 }
	},

	rang7 = {
	    { model = 'polmav', label = 'RTH', livery = 1, price = 1 }
	},

	rang8 = {
		{ model = 'polmav', label = 'RTH', livery = 1, price = 1 }
	},

    rang9 = {
		{ model = 'polmav', label = 'RTH', livery = 1, price = 1 }
	},

    rang10 = {
		{ model = 'polmav', label = 'RTH', livery = 1, price = 1 }
	},
	
	rang11 = {
		{ model = 'polmav', label = 'RTH', livery = 1, price = 1 }
	},

	boss = {
		{ model = 'polmav', label = 'RTH', livery = 1, price = 1 }
	}

}