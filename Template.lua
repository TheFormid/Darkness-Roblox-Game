local Template = {
	Coin = 5000,
	Diamond = 100,	
	Inventory = {
		Cube = {
			Colour = {"Classic"},
			Face = {"None"},	
			Texture = {"None"},
			Accessory = {"None"},		
			Character = {},	
		},
		Controller = {
			Colour = {"Classic"},
			Texture = {"None"},	
		},
	},
	Equip = {
		Cube = {["Colour"] = {"Classic"},["Texture"] = {"None"},["Accessory"] = {"None"},["Face"] = {"None"}},	
		Controller = {["Colour"] = {"Classic"},["Texture"] = {"None"}},	
		Character = {},
	},
	Level = 1,
	
	Settings = {},
	Booster = {},
	Gamepass = {
		["DoublCoin"] = false,
		["DoubleDiamond"] = false,
		["Shield"] = false,
		["VIP"] = false,
		["NewCharacter"] = false,
		["SkipAllStages"] = false,
	},
}

return Template
