Config = {}


Config.Locale = 'en'


-- [+] Markers Position
Config.Zones = {

  Buy      = {
    Type     = 27,
    Position = vector3(561.83, 2747.4, 41.88),
    Size     = {a = 0.8, b = 0.8, c = 0.8},
    Colour   = {r = 127, g = 255, b = 212}
  },

}
-- [-] Markers Position

-- [+] Pet
Config.ageMin = 1440 -- One Day
Config.hungerMin = 5

Config.Hunters = {
	{
		pet = 'chien',
		label = _U('dog'),
		price = 50000
	},

	{
		pet = 'husky',
		label = _U('husky'),
		price = 35000
	},

	{
		pet = 'carlin',
		label = _U('pug'),
		price = 6000
	},

	{
		pet = 'retriever',
		label = _U('retriever'),
		price = 10000
	},

	{
		pet = 'berger',
		label = _U('asatian'),
		price = 55000
	}
}

Config.Decoratives = {
	{
		pet = 'chat',
		label = _U('cat'),
		price = 15000
	},

	{
		pet = 'lapin',
		label = _U('bunny'),
		price = 25000
	},

	{
		pet = 'caniche',
		label = _U('poodle'),
		price = 50000
	},

	{
		pet = 'westie',
		label = _U('westie'),
		price = 50000
	}
}

Config.PetShop = {
	{
		pet = 'chien',
		label = _U('dog'),
		price = 50000
	},

	{
		pet = 'chat',
		label = _U('cat'),
		price = 15000
	},

	{
		pet = 'lapin',
		label = _U('bunny'),
		price = 25000
	},

	{
		pet = 'husky',
		label = _U('husky'),
		price = 35000
	},

	{
		pet = 'cochon',
		label = _U('pig'),
		price = 10000
	},

	{
		pet = 'caniche',
		label = _U('poodle'),
		price = 50000
	},

	{
		pet = 'carlin',
		label = _U('pug'),
		price = 6000
	},

	{
		pet = 'retriever',
		label = _U('retriever'),
		price = 10000
	},

	{
		pet = 'berger',
		label = _U('asatian'),
		price = 55000
	},

	{
		pet = 'westie',
		label = _U('westie'),
		price = 50000
	},

	{
		pet = 'chop',
		label = _U('chop'),
		price = 12000
	}
}
-- [-] Pet

-- [+] Blip
Config.Blip = {
  title = "PetShop",
  colour = 51,
  id = 141,
  pos = {
    x = 563.71,
    y = 2747.62,
    z = 42.88
  }
}
-- [-] Blip