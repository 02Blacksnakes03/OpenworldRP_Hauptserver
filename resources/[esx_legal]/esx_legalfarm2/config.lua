Config              	= {}
Config.MarkerType   	= 1
Config.DrawDistance 	= 100.0
Config.ZoneSize     	= {x = 8, y = 4, z = 0.5}
Config.MarkerColor  	= {r = 100, g = 204, b = 100}
Config.KeyStopAction 	= 'X'
-- Show blip in map?
Config.ShowBlips    	= false

Config.Locale 			= 'de'

-- Before add any drug/item here you have to add the translation of the item
Config.Drugs = {
	-- Translated name
	[_U('weed')] = {
		Item			= 'orange',				 	-- Item to pickup
		ItemTransform	= 'orangensaft', 			-- Item to transform
		AlertCops		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 6,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 5,						-- Time to farm in seconds
		TimeToProcess	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,					-- Effect after consume
		Zones			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online
			Field			= {x = 2225.93,	y = 5576.79,	z = 53.96,	name = _U('field', _U('weed')),			sprite = 479,	color = 2, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = 966.27,	y = -1933.29,	z = 31.13,	name = _U('processing', _U('weed')),	sprite = 499,	color = 2, callPolice = false, callPoliceChance = 100},
			Dealer 			= {x = -277.72,	y = 2205.48,	z = 129.4, h = 45.24,	name = _U('dealer', _U('weed')),		sprite = 500,	color = 2, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = false},
		}
	},
	-- Translated name
	[_U('weed')] = {
		Item			= 'flachs',				 	-- Item to pickup
		ItemTransform	= 'leinenstoff', 			-- Item to transform
		AlertCops		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 10,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 7,						-- Time to farm in seconds
		TimeToProcess	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,					-- Effect after consume
		Zones			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online
			Field	= {x = 143.63,	y = 972.11,	z = 218.08,	name = _U('field', _U('weed')),			sprite = 479,	color = 4, callPolice = false, callPoliceChance = 100},
			Field1 			= {x = 153.51,	y = 979.12,	z = 222.64,	name = _U('field', _U('weed')),			sprite = 479,	color = 4, callPolice = false, callPoliceChance = 100},
			Field2 			= {x = 149.38,	y = 988.56,	z = 223.04,	name = _U('field', _U('weed')),			sprite = 479,	color = 4, callPolice = false, callPoliceChance = 100},
			Field3 			= {x = 140.06,	y = 979.6,	z = 218.06,	name = _U('field', _U('weed')),			sprite = 479,	color = 4, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = -86.92,	y = 1880.35,	z = 196.31,  h = 263.00,	name = _U('processing', _U('weed')),	sprite = 499,	color = 4, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = false},
			Dealer 			= {x = -277.72,	y = 2205.48,	z = 129.4, h = 45.24,	name = _U('dealer', _U('weed')),		sprite = 500,	color = 4, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = false},
		}
	},
	-- Translated name
	[_U('meth')] = {
		Item			= 'erdnuss',				 	-- Item to pickup
		ItemTransform	= 'erdnussbutter', 			-- Item to transform
		AlertCops 		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 25,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 5,						-- Time to farm in seconds
		TimeToProcess 	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
		Zones 			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online
			Field			= {x = 371.34,	y = 6688.48,	z = 19.61,	        name = _U('field', _U('meth')),			sprite = 479,	color = 3, callPolice = false, callPoliceChance = 100},
			Field1 			= {x = 384.86,	y = 6715.84,	z = 16.45,	name = _U('field', _U('meth')),			sprite = 479,	color = 3, callPolice = false, callPoliceChance = 100},
			Field2 			= {x = 257.25,	y = 6700.96,	z = 30.1,	name = _U('field', _U('meth')),			sprite = 479,	color = 3, callPolice = false, callPoliceChance = 100},
			Field3 			= {x = 268.63,	y = 6760.95,	z = 15.84,	name = _U('field', _U('meth')),			sprite = 479,	color = 3, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = 2416.0,	y = 4993.44,	z = 45.22, h = 134.58,	name = _U('processing', _U('meth')),	sprite = 499,	color = 3, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 500, sellMax = 1000 , multiplierPolice = false},
			Dealer 		= {x = -2253.82,	y = 233.87,	z = 173.61, h = 45.24,	name = _U('dealer', _U('meth')),		sprite = 500,	color = 3, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 500, sellMax = 1000 , multiplierPolice = false},
		}
	},
	-- Translated name
	[_U('opium')] = {
		Item			= 'apfel',				 	-- Item to pickup
		ItemTransform	= 'apfelsaft', 			-- Item to transform
		AlertCops 		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 25,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 5,						-- Time to farm in seconds
		TimeToProcess	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
		Zones 			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online
			Field 			= {x = 2373.91,	y = 4989.61,	z = 44.01,	        name = _U('field', _U('opium')),		sprite = 479,	color = 5, callPolice = false, callPoliceChance = 100},
			Field1 			= {x = 2361.41,	y = 5001.88,	z = 43.46,	        name = _U('field', _U('opium')),		sprite = 479,	color = 5, callPolice = false, callPoliceChance = 100},
			Field2 			= {x = 2360.99,	y = 4988.69,	z = 43.3,	        name = _U('field', _U('opium')),		sprite = 479,	color = 5, callPolice = false, callPoliceChance = 100},
			Field3 			= {x = 2361.21,	y = 4976.48,	z = 43.22,	        name = _U('field', _U('opium')),		sprite = 479,	color = 5, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = 226.86, y = 128.56,   z = 101.6, h = 253.6,		name = _U('processing', _U('opium')),	sprite = 499,	color = 5, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 800, sellMax = 1250, multiplierPolice = false},
			Dealer 	= {x = 1534.57,	y = 2221.83,	z = 76.2, h = 87.63,	name = _U('dealer', _U('opium')),	    sprite = 500,	color = 5, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 800, sellMax = 1250, multiplierPolice = false},
		}
	},
	-- Translated name
	[_U('coke')] = {
		Item			= 'zitrone',				 	-- Item to pickup
		ItemTransform	= 'zitronenlimonade', 			-- Item to transform
		AlertCops		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 6,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 5,						-- Time to farm in seconds
		TimeToProcess	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
		Zones 			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online
			Field		= {x = -1813.86,	y = 1978.38,	z = 130.65,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
			Field1		= {x = -1198.59,	y = 4448.67,	z = 31.18,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
			Field2		= {x = -1230.34,	y = 4465.89,	z = 29.47,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
			Field3		= {x = -1200.49,	y = 4433.04,	z = 29.13,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = 278.51,	y = 6784.33,	z = 14.7, h = 263.38,  name = _U('processing', _U('coke')),	    sprite = 499,	color = 17, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 1000, sellMax = 1500, multiplierPolice = false},
			Dealer 			= {x = 1183.15,	y = -3322.04,   z = 5.03, h = 90.24,	name = _U('dealer', _U('coke')),		sprite = 500,	color = 17, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 1000, sellMax = 1500, multiplierPolice = false},
		}
	},
	-- Translated name
	[_U('gummi')] = {
		Item			= 'kautschuk',				 	-- Item to pickup
		ItemTransform	= 'rubber', 			-- Item to transform
		AlertCops		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 10,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 4,						-- Time to farm in seconds
		TimeToProcess	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
		Zones 			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online
--			Field		= {x = -1217.5,	y = 4449.0,	z = 30.22,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
--			Field1		= {x = -1198.59,	y = 4448.67,	z = 31.18,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
--			Field2		= {x = -1230.34,	y = 4465.89,	z = 29.47,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
--			Field3		= {x = -1200.49,	y = 4433.04,	z = 29.13,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
--			Processing 		= {x = 278.51,	y = 6784.33,	z = 14.7, h = 263.38,  name = _U('processing', _U('coke')),	    sprite = 499,	color = 17, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 1000, sellMax = 1500, multiplierPolice = false},
			Dealer 			= {x = 1397.02,	y = 3612.62,	z = 33.98, h = 106.21,	name = _U('dealer', _U('gummi')),		sprite = 500,	color = 17, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 1000, sellMax = 1500, multiplierPolice = false}
		}
	},
	-- Translated name
	[_U('stahl')] = {
		Item			= 'ore',				 	-- Item to pickup
		ItemTransform	= 'steel', 			-- Item to transform
		AlertCops		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 20,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 4,						-- Time to farm in seconds
		TimeToProcess	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
		Zones 			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online
--			Field		= {x = -1217.5,	y = 4449.0,	z = 30.22,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
--			Field1		= {x = -1198.59,	y = 4448.67,	z = 31.18,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
--			Field2		= {x = -1230.34,	y = 4465.89,	z = 29.47,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
--			Field3		= {x = -1200.49,	y = 4433.04,	z = 29.13,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
--			Processing 		= {x = 278.51,	y = 6784.33,	z = 14.7, h = 263.38,  name = _U('processing', _U('coke')),	    sprite = 499,	color = 17, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 1000, sellMax = 1500, multiplierPolice = false},
			Dealer 			= {x= 565.47 ,y= -3126.06 ,z= 17.77, h = 290.26,	name = _U('dealer', _U('stahl')),		sprite = 500,	color = 17, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 1000, sellMax = 1500, multiplierPolice = false}
		}
	},
	-- Translated name
	[_U('holz')] = {
		Item			= 'wood_log',				 	-- Item to pickup
		ItemTransform	= 'wood_planks', 			-- Item to transform
		AlertCops		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 2,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 4,						-- Time to farm in seconds
		TimeToProcess	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
		Zones 			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online
--			Field		= {x = -1217.5,	y = 4449.0,	z = 30.22,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
--			Field1		= {x = -1198.59,	y = 4448.67,	z = 31.18,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
--			Field2		= {x = -1230.34,	y = 4465.89,	z = 29.47,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
--			Field3		= {x = -1200.49,	y = 4433.04,	z = 29.13,	name = _U('field', _U('coke')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
--			Processing 		= {x = 278.51,	y = 6784.33,	z = 14.7, h = 263.38,  name = _U('processing', _U('coke')),	    sprite = 499,	color = 17, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 1000, sellMax = 1500, multiplierPolice = false},
			Dealer 			= {x= 1218.6507568359,y= -1267.1458740234,z= 35.423435211182, h = 90.24,	name = _U('dealer', _U('holz')),		sprite = 500,	color = 17, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 1000, sellMax = 1500, multiplierPolice = false}
		}
	},
	-- Translated name
	[_U('koks')] = {
		Item			= 'coca_leaf',				 	-- Item to pickup
		ItemTransform	= 'coke', 			-- Item to transform
		AlertCops 		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 3,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 8,						-- Time to farm in seconds
		TimeToProcess 	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
		Usable			= true,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
		Zones 			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online
--			Field			= {x = 2285.84,	y = 4774.91,	z = 38.87,	        name = _U('field', _U('meth')),			sprite = 479,	color = 3, callPolice = false, callPoliceChance = 100},
--			Field1 			= {x = 2282.62,	y = 4765.67,	z = 38.87,	name = _U('field', _U('meth')),			sprite = 479,	color = 3, callPolice = false, callPoliceChance = 100},
--			Field2 			= {x = 2282.95,	y = 4757.15,	z = 38.69,	name = _U('field', _U('meth')),			sprite = 479,	color = 3, callPolice = false, callPoliceChance = 100},
--			Field3 			= {x = 2290.1,	y = 4756.86,	z = 38.51,	name = _U('field', _U('meth')),			sprite = 479,	color = 3, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = -2186.41,	y = 4250.18,	z = 48.00, h = 43.52,	name = _U('processing', _U('koks')),	sprite = 499,	color = 3, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 500, sellMax = 1000 , multiplierPolice = false},
--			Dealer 		= {x = 1543.45,	y = 6330.59,	z = 23.08, h = 336.1,	name = _U('dealer', _U('meth')),		sprite = 500,	color = 3, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 500, sellMax = 1000 , multiplierPolice = false},
		}
	},
		-- Translated name
		[_U('cannabis')] = {
			Item			= 'cannabis',				 	-- Item to pickup
			ItemTransform	= 'marijuana', 			-- Item to transform
			AlertCops 		= false, 					-- Alert police?
			RequiredCops	= 0, 						-- How many cops need to the action start??
			QToProcess		= 5,						-- Quantity necessary to process
			QToSell			= 1,						-- Quantity necessary to sell
			TimeToFarm		= 8,						-- Time to farm in seconds
			TimeToProcess	= 5,						-- Time to process in seconds
			TimeToSell		= 4,						-- Time to sell in seconds
			Usable			= true,						-- Can it be consumed?
			UseEffect		= false,						-- Effect after consume
			Zones 			= {
				-- Field: Farm location
				-- Processing: Process location
				-- Dealer: Seller location
				-- callPolice: true/false, call the police in the position?
				-- callPoliceChance: chance in percentage to call the police
				-- sellMin: Min receveid by selling
				-- sellMax: Max received by selling
				-- multiplierPolice: true/false Multiply the min/max based on cops online
--				Field 			= {x = 341.3,	y = 6599.4,	z = 28.8,	        name = _U('field', _U('opium')),		sprite = 479,	color = 5, callPolice = false, callPoliceChance = 100},
--				Field1 			= {x = 341.2,	y = 6610.1,	z = 28.7,	        name = _U('field', _U('opium')),		sprite = 479,	color = 5, callPolice = false, callPoliceChance = 100},
--				Field2 			= {x = 339.1,	y = 6617.6,	z = 28.7,	        name = _U('field', _U('opium')),		sprite = 479,	color = 5, callPolice = false, callPoliceChance = 100},
--				Field3 			= {x = 341.1,	y = 6629.8,	z = 28.7,	        name = _U('field', _U('opium')),		sprite = 479,	color = 5, callPolice = false, callPoliceChance = 100},
				Processing 		= {x = 3817.75, y = 4440.66,   z = 1.90, h = 350.46,		name = _U('processing', _U('cannabis')),	sprite = 499,	color = 5, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 800, sellMax = 1250, multiplierPolice = false},
--				Dealer 	= {x = 563.62,	y = -3126.76,	z = 17.77, h = 270.02,	name = _U('dealer', _U('opium')),	    sprite = 500,	color = 5, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 800, sellMax = 1250, multiplierPolice = false},
			}
		},
}