local Event = game.ReplicatedStorage.RemoteEvents.ShopController
local TweenService = game:GetService("TweenService")

local WorkspaceShop = game.Workspace.Shop

local CubeInfo = require(game.ReplicatedStorage:WaitForChild("Shop"):WaitForChild("Cube"))
local ControllerInfo = require(game.ReplicatedStorage:WaitForChild("Shop"):WaitForChild("Controller"))
local Shop = game.ReplicatedStorage.Shop
local Order = game.ReplicatedStorage.Shop.CurrentShopOrder
local MaxOrder = game.ReplicatedStorage.Shop.CurrentMaxOrderLenght
local ShopType = game.ReplicatedStorage.Shop.CurrentShopType
local Debounce = game.ReplicatedStorage.Shop.PassDebounce

local inf = TweenInfo.new(.2,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
local inf1 = TweenInfo.new(2,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,true,0)
local inf2 = TweenInfo.new(2,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
local inf3 = TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)

local Prp1 = {CFrame = WorkspaceShop.Point1.CFrame}
local Prp2 = {CFrame = WorkspaceShop.Point2.CFrame}
local Prp3 = {CFrame = WorkspaceShop.Point3.CFrame}
local Prp4 = {CFrame = WorkspaceShop.Point4.CFrame}
local Prp5 = {CFrame = WorkspaceShop.Point5.CFrame}

local CubeColorInfo = {}
local CubeTextureInfo = {}
local ControllerColorInfo = {}
local ControllerTextureInfo = {}

local Manager = require(game.ServerScriptService.Manager)

local function ModuleToTable(Info,Type)
	for i , v in pairs(Info) do
		table.insert(Type,v)
	--	table.insert(v,"Name")
		v["Name"] = i
	end
	table.sort(Type,function(a,b)
		return a["Order"] < b["Order"]
	end)
	print(Type)
end
ModuleToTable(CubeInfo.Color,CubeColorInfo)
ModuleToTable(CubeInfo.Texture,CubeTextureInfo)
ModuleToTable(ControllerInfo.Color,ControllerColorInfo)
ModuleToTable(ControllerInfo.Texture,ControllerTextureInfo)
local function Querry(plr)
	
	local Profile = Manager.Profiles[plr]
	
	if not Profile then return end
	
	return Profile
	
end

local function SetTheCube(plr)
--	print("hi")
	local Profile = Manager.Profiles[plr]
	if not Profile then wait(5) SetTheCube() return end

	if Profile.Data["Equip"]["Character"][1] ~= nil then --------------- Bitmedi !!!!!!
		Shop.CurrentCharacter.Value = Profile.Data["Equip"]["Character"][1]
		print("Character has been loaded.")
		return
	end

	if Profile.Data["Equip"]["Controller"]["Texture"][1] == nil then
		Shop.CurrentControllerTexture.Value = Profile.Data["Equip"]["Controller"]["Texture"][1] 

		for i,v in pairs(game.Workspace.Cube.Hedef:GetChildren()) do
			if v.Name == "Texture" then
				v.Texture = ControllerInfo.Texture[Profile.Data["Equip"]["Controller"]["Texture"][1]]["Texture"]
			end	
		end
		for i,v in pairs(game.Workspace.Shop.Hedef:GetChildren()) do
			if v.Name == "Texture" then
				v.Texture = ControllerInfo.Texture[Profile.Data["Equip"]["Controller"]["Texture"][1]]["Texture"]
			end	
		end
		for i,v in pairs(game.Workspace.StartScreen.Hedef:GetChildren()) do
			if v.Name == "Texture" then
				v.Texture = ControllerInfo.Texture[Profile.Data["Equip"]["Controller"]["Texture"][1]]["Texture"]
			end	
		end
		for i,v in pairs(game.Workspace.Stage.Hedef:GetChildren()) do
			if v.Name == "Texture" then
				v.Texture = ControllerInfo.Texture[Profile.Data["Equip"]["Controller"]["Texture"][1]]["Texture"]
			end	
		end

	end
	if Profile.Data["Equip"]["Cube"]["Accessory"][1] == nil then ------ Bitmedi !!!
		Shop.CurrentCubeAccesory.Value = Profile.Data["Equip"]["Cube"]["Accesory"][1]
	end
	if Profile.Data["Equip"]["Cube"]["Face"][1] == nil then
		Shop.CurrentCubeFace.Value = Profile.Data["Equip"]["Cube"]["Face"][1]

		game.Workspace.Cube.Cube.Face.Texture = CubeInfo.Face[Profile.Data["Equip"]["Cube"]["Face"][1]]["Face"]
		game.Workspace.Shop.cube.Face.Texture = CubeInfo.Face[Profile.Data["Equip"]["Cube"]["Face"][1]]["Face"]
		game.Workspace.StartScreen.Cube.Face.Texture = CubeInfo.Face[Profile.Data["Equip"]["Cube"]["Face"][1]]["Face"]
		game.Workspace.Stage.cube.Face.Texture = CubeInfo.Face[Profile.Data["Equip"]["Cube"]["Face"][1]]["Face"]

		game.Workspace.Cube.Cube.Face.Transparency = 0
		game.Workspace.Shop.cube.Face.Transparency = 0
		game.Workspace.StartScreen.Cube.Face.Transparency = 0
		game.Workspace.Stage.cube.Face.Transparency = 0

	end

	Shop.CurrentControllerColor.Value = Profile.Data["Equip"]["Controller"]["Colour"][1]
	Shop.CurrentCubeColor.Value = Profile.Data["Equip"]["Cube"]["Colour"][1]

	
	for i,v in pairs(game.Workspace.Cube.Hedef:GetChildren()) do
		if v.Name == "Texture" then
			v.Texture = ControllerInfo.Texture[Profile.Data["Equip"]["Controller"]["Texture"][1]]["Texture"]
		end
	end
	for i,v in pairs(game.Workspace.Shop.Hedef:GetChildren()) do
		if v.Name == "Texture" then
			v.Texture = ControllerInfo.Texture[Profile.Data["Equip"]["Controller"]["Texture"][1]]["Texture"]
		end
	end
	for i,v in pairs(game.Workspace.StartScreen.Hedef:GetChildren()) do
		if v.Name == "Texture" then
			v.Texture = ControllerInfo.Texture[Profile.Data["Equip"]["Controller"]["Texture"][1]]["Texture"]
		end
	end
	for i,v in pairs(game.Workspace.Stage.Hedef:GetChildren()) do
		if v.Name == "Texture" then
			v.Texture = ControllerInfo.Texture[Profile.Data["Equip"]["Controller"]["Texture"][1]]["Texture"]
		end
	end
	
	for i,v in pairs(game.Workspace.Cube.Cube:GetChildren()) do
		if v.Name == "Texture" then
			v.Texture = CubeInfo.Texture[Profile.Data["Equip"]["Cube"]["Texture"][1]]["Texture"]
		end
	end
	for i,v in pairs(game.Workspace.Shop.cube:GetChildren()) do
		if v.Name == "Texture" then
			v.Texture = CubeInfo.Texture[Profile.Data["Equip"]["Cube"]["Texture"][1]]["Texture"]
		end
	end
	for i,v in pairs(game.Workspace.StartScreen.Cube:GetChildren()) do
		if v.Name == "Texture" then
			v.Texture = CubeInfo.Texture[Profile.Data["Equip"]["Cube"]["Texture"][1]]["Texture"]
		end
	end
	for i,v in pairs(game.Workspace.Stage.cube:GetChildren()) do
		if v.Name == "Texture" then
			v.Texture = CubeInfo.Texture[Profile.Data["Equip"]["Cube"]["Texture"][1]]["Texture"]
		end
	end
	
	game.Workspace.Cube.Cube.Color = CubeInfo.Color[Profile.Data["Equip"]["Cube"]["Colour"][1]]["Colour"]
	game.Workspace.Cube.Hedef.Color = ControllerInfo.Color[Profile.Data["Equip"]["Controller"]["Colour"][1]]["Colour"]
	game.Workspace.Cube.Hedef.Point.Color = ControllerInfo.Color[Profile.Data["Equip"]["Controller"]["Colour"][1]]["Colour"]
	game.Workspace.Cube.Hedef.Attachment.SpotLight.Color = ControllerInfo.Color[Profile.Data["Equip"]["Controller"]["Colour"][1]]["SpotLightColour"]
	game.Workspace.Shop.cube.Color = CubeInfo.Color[Profile.Data["Equip"]["Cube"]["Colour"][1]]["Colour"]
	game.Workspace.Shop.Hedef.Color = ControllerInfo.Color[Profile.Data["Equip"]["Controller"]["Colour"][1]]["Colour"]
	game.Workspace.Shop.Hedef.Attachment.SpotLight.Color = ControllerInfo.Color[Profile.Data["Equip"]["Controller"]["Colour"][1]]["SpotLightColour"]
	game.Workspace.StartScreen.Cube.Color = CubeInfo.Color[Profile.Data["Equip"]["Cube"]["Colour"][1]]["Colour"]
	game.Workspace.StartScreen.Hedef.Color = ControllerInfo.Color[Profile.Data["Equip"]["Controller"]["Colour"][1]]["Colour"]
	game.Workspace.StartScreen.Hedef.Attachment.SpotLight.Color = ControllerInfo.Color[Profile.Data["Equip"]["Controller"]["Colour"][1]]["SpotLightColour"]
	game.Workspace.Stage.cube.Color = CubeInfo.Color[Profile.Data["Equip"]["Cube"]["Colour"][1]]["Colour"]
	game.Workspace.Stage.cube.Attachment.PointLight.Color = CubeInfo.Color[Profile.Data["Equip"]["Cube"]["Colour"][1]]["Colour"]
	game.Workspace.Stage.Hedef.Color = ControllerInfo.Color[Profile.Data["Equip"]["Controller"]["Colour"][1]]["Colour"]
	game.Workspace.Stage.Hedef.Attachment.SpotLight.Color = ControllerInfo.Color[Profile.Data["Equip"]["Controller"]["Colour"][1]]["SpotLightColour"]

end

Event.OnServerEvent:Connect(function(plr,ShopOption)
	
	local Profile = Querry(plr)
	local Data = Profile.Data
	
	if ShopOption == "Buy" and Debounce.Value == false then
		
		local plr = game.Players:FindFirstChild(game.ReplicatedStorage.GameValues.PlayerValue.Value)
		local Manager = require(game.ServerScriptService.Manager)
		local Profile = Manager.Profiles[plr]
		local InventoryTable = nil
		local CurrentShopTable = nil
		local CurrentShopTypeValue = nil

		if ShopType.Value == "CubeColor" then
			InventoryTable = Profile.Data["Inventory"]["Cube"]["Colour"]
			CurrentShopTable = CubeColorInfo
			CurrentShopTypeValue = game.ReplicatedStorage.Shop.CurrentCubeColor
		elseif ShopType.Value == "CubeTexture" then
			InventoryTable = Profile.Data["Inventory"]["Cube"]["Texture"]
			CurrentShopTable = CubeTextureInfo
			CurrentShopTypeValue = game.ReplicatedStorage.Shop.CurrentCubeTexture
		elseif ShopType.Value == "CubeFace" then
		elseif ShopType.Value == "CubeCharacter" then
		elseif ShopType.Value == "ControllerColor" then
			InventoryTable = Profile.Data["Inventory"]["Controller"]["Colour"]
			CurrentShopTable = ControllerColorInfo
			CurrentShopTypeValue = game.ReplicatedStorage.Shop.CurrentControllerColor
		elseif ShopType.Value == "ControllerTexture" then
			InventoryTable = Profile.Data["Inventory"]["Controller"]["Texture"]
			CurrentShopTable = ControllerTextureInfo
			CurrentShopTypeValue = game.ReplicatedStorage.Shop.CurrentControllerTexture
		end

		local CurrentObject = CurrentShopTable[Order.Value]
		
	--	print(Profile.Data.Coin)
		if Profile.Data.Coin >= CurrentObject["Cost"] and table.find(InventoryTable,CurrentObject["Name"]) == nil then
			Profile.Data.Coin -= CurrentObject["Cost"]
			table.insert(InventoryTable,CurrentObject["Name"])
	--		print(Profile.Data)
			plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.Visible = true
		else
			print("dostum sanırım paran yeterli değil")
		end
		
		
	end
	
	if ShopOption == "Equip" and Debounce.Value == false then
		
		local plr = game.Players:FindFirstChild(game.ReplicatedStorage.GameValues.PlayerValue.Value)
		local Manager = require(game.ServerScriptService.Manager)
		local Profile = Manager.Profiles[plr]
		local InventoryTable = nil
		local EquipTypeThing = nil
		local CurrentShopTable = nil
		local CurrentShopTypeValue = nil

		if ShopType.Value == "CubeColor" then
			InventoryTable = Profile.Data["Inventory"]["Cube"]["Colour"]
			EquipTypeThing = Profile.Data["Equip"]["Cube"]["Colour"]
			CurrentShopTable = CubeColorInfo
			CurrentShopTypeValue = game.ReplicatedStorage.Shop.CurrentCubeColor
		elseif ShopType.Value == "CubeTexture" then
			InventoryTable = Profile.Data["Inventory"]["Cube"]["Texture"]
			EquipTypeThing = Profile.Data["Equip"]["Cube"]["Texture"]
			CurrentShopTable = CubeTextureInfo
			CurrentShopTypeValue = game.ReplicatedStorage.Shop.CurrentCubeTexture
		elseif ShopType.Value == "CubeFace" then
		elseif ShopType.Value == "CubeCharacter" then
		elseif ShopType.Value == "ControllerColor" then
			InventoryTable = Profile.Data["Inventory"]["Controller"]["Colour"]
			EquipTypeThing = Profile.Data["Equip"]["Controller"]["Colour"]
			CurrentShopTable = ControllerColorInfo
			CurrentShopTypeValue = game.ReplicatedStorage.Shop.CurrentControllerColor
		elseif ShopType.Value == "ControllerTexture" then
			InventoryTable = Profile.Data["Inventory"]["Controller"]["Texture"]
			EquipTypeThing = Profile.Data["Equip"]["Controller"]["Texture"]
			CurrentShopTable = ControllerTextureInfo
			CurrentShopTypeValue = game.ReplicatedStorage.Shop.CurrentControllerTexture
		end
		
		local CurrentObject = CurrentShopTable[Order.Value]
		
		if table.find(InventoryTable,CurrentObject["Name"]) ~= nil then
			Profile.Data.Coin -= CurrentObject["Cost"]
			print(CurrentObject["Name"])
			print(EquipTypeThing)
			table.clear(EquipTypeThing)
			table.insert(EquipTypeThing,tostring(CurrentObject["Name"]))  --------------!!! sıkıntı
			print(Profile.Data)
			CurrentShopTypeValue.Value = CurrentObject["Name"]
			print(type(EquipTypeThing))
	
			SetTheCube(plr)
			plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.Visible = true
		else
			-- Arkadaşa ufak bir sürpriz yapıcaz
		end
		
	end
	
	if ShopOption == "Left" and Debounce.Value == false then		
		
		Debounce.Value = true
		WorkspaceShop.ListOfObjects.TurnTween.Work.Value = false
		Order.Value -= 1
		print(Order.Value)
		---------------- Settings !
		local Part1 = nil
		local Part2 = nil
		local Part3 = nil
		local Part4 = nil
		local Part5 = nil
		
		if Order.Value+2 <= MaxOrder.Value then
			Part5 = WorkspaceShop.ListOfObjects["4"]:FindFirstChild(tostring(Order.Value+2)).PrimaryPart
		end
		Part3 = WorkspaceShop.ListOfObjects["2"]:FindFirstChild(tostring(Order.Value)).PrimaryPart
		Part4 = WorkspaceShop.ListOfObjects["3"]:FindFirstChild(tostring(Order.Value+1)).PrimaryPart
		if Order.Value > 1 then
			Part2 = WorkspaceShop.ListOfObjects["1"]:FindFirstChild(tostring(Order.Value-1)).PrimaryPart
		end
		if ShopType.Value == "CubeTexture" then
			for i , v in pairs(Part3:GetChildren()) do
				if v.Name == "Texture" then
					v.StudsPerTileV = 12
					v.StudsPerTileU = 12
				end
			end
		elseif ShopType.Value == "ControllerTexture" then
			for i , v : Texture in pairs(Part3:GetChildren()) do
				if v.Name == "Texture" then
					v.StudsPerTileV = 4.75
					v.StudsPerTileU = 11
					if v.Face == Enum.NormalId.Bottom or v.Face == Enum.NormalId.Top then
						v.StudsPerTileV = 11
						v.StudsPerTileU = 11
					end
				end
			end
		end
		-------------- Set !	
		if Order.Value+2 <= MaxOrder.Value then
			WorkspaceShop.ListOfObjects["5"]:ClearAllChildren()
			Part5.Parent.Parent = WorkspaceShop.ListOfObjects["5"]
			local tween5 = TweenService:Create(Part5,inf,Prp5):Play()
		end	
		Part4.Parent.Parent = WorkspaceShop.ListOfObjects["4"]
		Part3.Parent.Parent = WorkspaceShop.ListOfObjects["3"]	
		local SizeUpPrp = {Size = Vector3.new(Part4.Size.X,Part4.Size.Y,Part4.Size.Z)}
		local SizeLowPrp = {Size = Vector3.new(Part3.Size.X,Part3.Size.Y,Part3.Size.Z)}
		local tween4 = TweenService:Create(Part4,inf,Prp4):Play()
		local tween3 = TweenService:Create(Part3,inf,Prp3):Play()
		local SizeUpTween = TweenService:Create(Part3,inf,SizeUpPrp):Play()
		local SizeLowTween = TweenService:Create(Part4,inf,SizeLowPrp):Play()
		if Order.Value > 1 then
			Part2.Parent.Parent = WorkspaceShop.ListOfObjects["2"]
			local tween2 = TweenService:Create(Part2,inf,Prp2):Play()
		end	
		if Order.Value > 2 then
			WorkspaceShop.ListOfObjects.AllObjects:FindFirstChild(tostring(Order.Value-2)):Clone().Parent = WorkspaceShop.ListOfObjects["1"]
			WorkspaceShop.ListOfObjects["1"]:FindFirstChild(tostring(Order.Value-2)).PrimaryPart.CFrame = WorkspaceShop.Point1.CFrame
		end
		if ShopType.Value == "CubeTexture" then
			for i , v in pairs(Part4:GetChildren()) do
				if v.Name == "Texture" then
					v.StudsPerTileV = 4
					v.StudsPerTileU = 4
				end
			end
		elseif ShopType.Value == "ControllerTexture" then
			for i , v in pairs(Part4:GetChildren()) do
				if v.Name == "Texture" then
					v.StudsPerTileV = 2.2
					v.StudsPerTileU = 3.4
					if v.Face == Enum.NormalId.Bottom or v.Face == Enum.NormalId.Top then
						v.StudsPerTileV = 3.4
						v.StudsPerTileU = 3.4
					end
				end
			end
		end
		-------------- Set Over !

		wait(0.2)
		Debounce.Value = false
		wait(0.2)
		if Debounce.Value == false then WorkspaceShop.ListOfObjects.TurnTween.Work.Value = true end
		
	end
	
	if ShopOption == "Right" and Debounce.Value == false then
		
		Debounce.Value = true
		WorkspaceShop.ListOfObjects.TurnTween.Work.Value = false
		Order.Value += 1
		print(Order.Value)
		---------------- Settings !
		local Part1 = nil
		local Part2 = nil
		local Part3 = nil
		local Part4 = nil
		local Part5 = nil
		if Order.Value > 2 then
			Part1 = WorkspaceShop.ListOfObjects["2"]:FindFirstChild(tostring(Order.Value-2)).PrimaryPart
		end
		Part2 = WorkspaceShop.ListOfObjects["3"]:FindFirstChild(tostring(Order.Value-1)).PrimaryPart
		Part3 = WorkspaceShop.ListOfObjects["4"]:FindFirstChild(tostring(Order.Value)).PrimaryPart
		if MaxOrder.Value > Order.Value then
			Part4 = WorkspaceShop.ListOfObjects["5"]:FindFirstChild(tostring(Order.Value+1)).PrimaryPart
		end
		if ShopType.Value == "CubeTexture" then
			for i , v in pairs(Part3:GetChildren()) do
				if v.Name == "Texture" then
					v.StudsPerTileV = 12
					v.StudsPerTileU = 12
				end
			end
		elseif ShopType.Value == "ControllerTexture" then
			for i , v in pairs(Part3:GetChildren()) do
				if v.Name == "Texture" then
					v.StudsPerTileV = 4.75
					v.StudsPerTileU = 11
					if v.Face == Enum.NormalId.Bottom or v.Face == Enum.NormalId.Top then
						v.StudsPerTileV = 11
						v.StudsPerTileU = 11
					end
				end
			end
		end
		-------------- Set !	
		if Order.Value > 2 then
			WorkspaceShop.ListOfObjects["1"]:ClearAllChildren()
			Part1.Parent.Parent = WorkspaceShop.ListOfObjects["1"]
			local tween1 = TweenService:Create(Part1,inf,Prp1):Play()
		end	
		Part2.Parent.Parent = WorkspaceShop.ListOfObjects["2"]
		Part3.Parent.Parent = WorkspaceShop.ListOfObjects["3"]	
		local SizeUpPrp = {Size = Vector3.new(Part2.Size.X,Part2.Size.Y,Part2.Size.Z)}
		local SizeLowPrp = {Size = Vector3.new(Part3.Size.X,Part3.Size.Y,Part3.Size.Z)}
		local tween2 = TweenService:Create(Part2,inf,Prp2):Play()
		local tween3 = TweenService:Create(Part3,inf,Prp3):Play()
		local SizeUpTween = TweenService:Create(Part3,inf,SizeUpPrp):Play()
		local SizeLowTween = TweenService:Create(Part2,inf,SizeLowPrp):Play()
		if MaxOrder.Value > Order.Value then
			Part4.Parent.Parent = WorkspaceShop.ListOfObjects["4"]
			local tween4 = TweenService:Create(Part4,inf,Prp4):Play()
		end	
		if MaxOrder.Value > Order.Value+1 then
			WorkspaceShop.ListOfObjects.AllObjects:FindFirstChild(tostring(Order.Value+2)):Clone().Parent = WorkspaceShop.ListOfObjects["5"]
			WorkspaceShop.ListOfObjects["5"]:FindFirstChild(tostring(Order.Value+2)).PrimaryPart.CFrame = WorkspaceShop.Point5.CFrame
		end
		if ShopType.Value == "CubeTexture" then
			for i , v in pairs(Part2:GetChildren()) do
				if v.Name == "Texture" then
					v.StudsPerTileV = 4
					v.StudsPerTileU = 4
				end
			end
		elseif ShopType.Value == "ControllerTexture" then
			for i , v in pairs(Part2:GetChildren()) do
				if v.Name == "Texture" then
					v.StudsPerTileV = 2.2
					v.StudsPerTileU = 3.4
					if v.Face == Enum.NormalId.Bottom or v.Face == Enum.NormalId.Top then
						v.StudsPerTileV = 3.4
						v.StudsPerTileU = 3.4
					end
				end
			end
		end
		-------------- Set Over !
		
		wait(0.2)
		Debounce.Value = false
		wait(0.2)
		if Debounce.Value == false then WorkspaceShop.ListOfObjects.TurnTween.Work.Value = true end
		
	end
	
	if ShopOption == "CubeColor" and Debounce.Value == false then
		
		Debounce.Value = true
		Order.Value = 1
		ShopType.Value = "CubeColor"
		MaxOrder.Value = Shop.CubeColor.MaxOrderLenght.Value
		if WorkspaceShop.ListOfObjects:FindFirstChild("TurnTween") then
			WorkspaceShop.ListOfObjects.TurnTween.Work.Value = false
		end
		
		
		local AllObject : Folder = WorkspaceShop.ListOfObjects.AllObjects
		AllObject:ClearAllChildren()
		WorkspaceShop.ListOfObjects["1"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["2"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["3"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["4"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["5"]:ClearAllChildren()
		local Cubes = Shop.CubeColor
		
		if game.ReplicatedStorage.Shop.CurrentCubeColor.Value == "Classic" then --UIS Shop 
			plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Left.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Right.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.UIName.Text = "Classic"
		else
			plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Left.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Right.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.UIName.Text = "Classic"
		end
		
		for i ,  v in pairs(CubeColorInfo) do
			--	print(type(tonumber(string.sub(Controller.Name,1,1))))
			local NewGroup = game.ReplicatedStorage.CloneObject.ShopMainDrafts.CubeColor:Clone()
			NewGroup.Cube.Color = v.Colour
			NewGroup.Name = tostring(i)
			NewGroup.Parent = AllObject
		end
		
		local ClonePart1 = AllObject:FindFirstChild("1"):Clone()
		local ClonePart2 = AllObject:FindFirstChild("2"):Clone()
		local ClonePart3 = AllObject:FindFirstChild("3"):Clone()
		ClonePart1.Parent = WorkspaceShop.ListOfObjects["3"]
		ClonePart2.Parent = WorkspaceShop.ListOfObjects["4"]
		ClonePart3.Parent = WorkspaceShop.ListOfObjects["5"]
		ClonePart1.PrimaryPart.CFrame = WorkspaceShop.Point3.CFrame
		ClonePart2.PrimaryPart.CFrame = WorkspaceShop.Point4.CFrame
		ClonePart3.PrimaryPart.CFrame = WorkspaceShop.Point5.CFrame
		ClonePart1.PrimaryPart.Size = Vector3.new(12, 12, 12)
		wait(0.1)
		
		if WorkspaceShop.ListOfObjects:FindFirstChild("TurnTween") then WorkspaceShop.ListOfObjects.TurnTween:Destroy() end
		local NewTweenScript = script.TurnTween:Clone()
		NewTweenScript.Parent = WorkspaceShop.ListOfObjects
		NewTweenScript.Enabled = true
		
		Debounce.Value = false
		WorkspaceShop.ListOfObjects.TurnTween.Work.Value = true
		
	end
	
	if ShopOption == "CubeTexture" and Debounce.Value == false then

		Debounce.Value = true
		Order.Value = 1
		ShopType.Value = "CubeTexture"
		MaxOrder.Value = Shop.CubeTexture.MaxOrderLenght.Value
		if WorkspaceShop.ListOfObjects:FindFirstChild("TurnTween") then
			WorkspaceShop.ListOfObjects.TurnTween.Work.Value = false
		end


		local AllObject : Folder = WorkspaceShop.ListOfObjects.AllObjects
		AllObject:ClearAllChildren()
		WorkspaceShop.ListOfObjects["1"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["2"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["3"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["4"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["5"]:ClearAllChildren()
		local Cubes = Shop.CubeColor

		if game.ReplicatedStorage.Shop.CurrentCubeTexture.Value == "None" then
			plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Left.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Right.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.UIName.Text = "None"
		else
			plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Left.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Right.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.UIName.Text = "None"
		end

		for i ,  v in pairs(CubeTextureInfo) do
			--	print(type(tonumber(string.sub(Controller.Name,1,1))))
			local NewGroup = game.ReplicatedStorage.CloneObject.ShopMainDrafts.CubeTexture:Clone()
			NewGroup.Cube.Color = CubeInfo.Color[Shop.CurrentCubeColor.Value]["Colour"]
			for t,s in pairs(NewGroup.Cube:GetChildren()) do
				if s.Name == "Texture" then
					s.Texture = v["Texture"]
					s.StudsPerTileV = 4
					s.StudsPerTileU = 4
				end
			end
			NewGroup.Name = tostring(i)
			NewGroup.Parent = AllObject
		end

		local ClonePart1 = AllObject:FindFirstChild("1"):Clone()
		local ClonePart2 = AllObject:FindFirstChild("2"):Clone()
		local ClonePart3 = AllObject:FindFirstChild("3"):Clone()
		ClonePart1.Parent = WorkspaceShop.ListOfObjects["3"]
		ClonePart2.Parent = WorkspaceShop.ListOfObjects["4"]
		ClonePart3.Parent = WorkspaceShop.ListOfObjects["5"]
		ClonePart1.PrimaryPart.CFrame = WorkspaceShop.Point3.CFrame
		ClonePart2.PrimaryPart.CFrame = WorkspaceShop.Point4.CFrame
		ClonePart3.PrimaryPart.CFrame = WorkspaceShop.Point5.CFrame
		ClonePart1.PrimaryPart.Size = Vector3.new(12, 12, 12)
		wait(0.1)

		if WorkspaceShop.ListOfObjects:FindFirstChild("TurnTween") then WorkspaceShop.ListOfObjects.TurnTween:Destroy() end
		local NewTweenScript = script.TurnTween:Clone()
		NewTweenScript.Parent = WorkspaceShop.ListOfObjects
		NewTweenScript.Enabled = true

		Debounce.Value = false
		WorkspaceShop.ListOfObjects.TurnTween.Work.Value = true

	end
	
	if ShopOption == "ControllerColor" and Debounce.Value == false then
		
		Debounce.Value = true
		Order.Value = 1
		ShopType.Value = "ControllerColor"
		MaxOrder.Value = Shop.ControllerColor.MaxOrderLenght.Value
		if WorkspaceShop.ListOfObjects:FindFirstChild("TurnTween") then
			WorkspaceShop.ListOfObjects.TurnTween.Work.Value = false
		end
		
		local AllObject : Folder = WorkspaceShop.ListOfObjects.AllObjects
		AllObject:ClearAllChildren()
		WorkspaceShop.ListOfObjects["1"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["2"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["3"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["4"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["5"]:ClearAllChildren()
		local Controllers = Shop.ControllerColor
		
		if game.ReplicatedStorage.Shop.CurrentControllerColor.Value == "Classic" then
			plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Left.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Right.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.UIName.Text = "Classic"
		else
			plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Left.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Right.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.UIName.Text = "Classic"
		end
		
		for i ,  v in pairs(ControllerColorInfo) do
		--	print(type(tonumber(string.sub(Controller.Name,1,1))))
			local NewGroup = game.ReplicatedStorage.CloneObject.ShopMainDrafts.ControllerColor:Clone()
			NewGroup.Cube.Color = v.Colour
			NewGroup.Cube.Attachment.SpotLight.Color = v.SpotLightColour
			NewGroup.Name = tostring(i)
			NewGroup.Parent = AllObject
		end

		local ClonePart1 = AllObject:FindFirstChild("1"):Clone()
		local ClonePart2 = AllObject:FindFirstChild("2"):Clone()
		local ClonePart3 = AllObject:FindFirstChild("3"):Clone()
		ClonePart1.Parent = WorkspaceShop.ListOfObjects["3"]
		ClonePart2.Parent = WorkspaceShop.ListOfObjects["4"]
		ClonePart3.Parent = WorkspaceShop.ListOfObjects["5"]
		ClonePart1.PrimaryPart.CFrame = WorkspaceShop.Point3.CFrame
		ClonePart2.PrimaryPart.CFrame = WorkspaceShop.Point4.CFrame
		ClonePart3.PrimaryPart.CFrame = WorkspaceShop.Point5.CFrame
		ClonePart1.PrimaryPart.Size = Vector3.new(11, 4.75, 11)
		wait(0.1)
		if WorkspaceShop.ListOfObjects:FindFirstChild("TurnTween") then WorkspaceShop.ListOfObjects.TurnTween:Destroy() end
		local NewTweenScript = script.TurnTween:Clone()
		NewTweenScript.Parent = WorkspaceShop.ListOfObjects
		NewTweenScript.Enabled = true

		Debounce.Value = false
		WorkspaceShop.ListOfObjects.TurnTween.Work.Value = true
		
	end
	
	if ShopOption == "ControllerTexture" and Debounce.Value == false then

		Debounce.Value = true
		Order.Value = 1
		ShopType.Value = "ControllerTexture"
		MaxOrder.Value = Shop.ControllerTexture.MaxOrderLenght.Value
		if WorkspaceShop.ListOfObjects:FindFirstChild("TurnTween") then
			WorkspaceShop.ListOfObjects.TurnTween.Work.Value = false
		end


		local AllObject : Folder = WorkspaceShop.ListOfObjects.AllObjects
		AllObject:ClearAllChildren()
		WorkspaceShop.ListOfObjects["1"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["2"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["3"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["4"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["5"]:ClearAllChildren()
		local Cubes = Shop.CubeColor

		if game.ReplicatedStorage.Shop.CurrentCubeTexture.Value == "None" then
			plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Left.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Right.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.UIName.Text = "None"
		else
			plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Left.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Right.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.UIName.Text = "None"
		end

		for i ,  v in pairs(ControllerTextureInfo) do
			--	print(type(tonumber(string.sub(Controller.Name,1,1))))
			local NewGroup = game.ReplicatedStorage.CloneObject.ShopMainDrafts.ControllerTexture:Clone()
			NewGroup.Cube.Color = ControllerInfo.Color[Shop.CurrentControllerColor.Value]["Colour"]
			NewGroup.Cube.Attachment.SpotLight.Color = ControllerInfo.Color[Shop.CurrentControllerColor.Value]["SpotLightColour"]
			for t,s in pairs(NewGroup.Cube:GetChildren()) do
				if s.Name == "Texture" then
					s.Texture = v["Texture"]
					s.StudsPerTileV = 4
					s.StudsPerTileU = 4
				end
			end
			NewGroup.Name = tostring(i)
			NewGroup.Parent = AllObject
		end

		local ClonePart1 = AllObject:FindFirstChild("1"):Clone()
		local ClonePart2 = AllObject:FindFirstChild("2"):Clone()
		local ClonePart3 = AllObject:FindFirstChild("3"):Clone()
		ClonePart1.Parent = WorkspaceShop.ListOfObjects["3"]
		ClonePart2.Parent = WorkspaceShop.ListOfObjects["4"]
		ClonePart3.Parent = WorkspaceShop.ListOfObjects["5"]
		ClonePart1.PrimaryPart.CFrame = WorkspaceShop.Point3.CFrame
		ClonePart2.PrimaryPart.CFrame = WorkspaceShop.Point4.CFrame
		ClonePart3.PrimaryPart.CFrame = WorkspaceShop.Point5.CFrame
		ClonePart1.PrimaryPart.Size = Vector3.new(11, 4.75, 11)
		wait(0.1)

		if WorkspaceShop.ListOfObjects:FindFirstChild("TurnTween") then WorkspaceShop.ListOfObjects.TurnTween:Destroy() end
		local NewTweenScript = script.TurnTween:Clone()
		NewTweenScript.Parent = WorkspaceShop.ListOfObjects
		NewTweenScript.Enabled = true

		Debounce.Value = false
		WorkspaceShop.ListOfObjects.TurnTween.Work.Value = true

	end
	
	if ShopOption == "Gamepass" then
		
	--	Order.Value = 1
	--	MaxOrder.Value = Shop.Gamepasses.MaxOrderLenght.Value
		ShopType.Value = "Gamepass"
		
		plr.PlayerGui.LobbyScreen.ShopBackground.Left.Visible = false
		plr.PlayerGui.LobbyScreen.ShopBackground.Right.Visible = false
		plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = false
		plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = false
		plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = false
		plr.PlayerGui.LobbyScreen.ShopBackground.UIName.Visible = false
		
		local AllObject : Folder = WorkspaceShop.ListOfObjects.AllObjects
		AllObject:ClearAllChildren()
		WorkspaceShop.ListOfObjects["1"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["2"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["3"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["4"]:ClearAllChildren()
		WorkspaceShop.ListOfObjects["5"]:ClearAllChildren()
		
	end
	
	if ShopOption == "ShopControllerOn" and game.ReplicatedStorage.GameValues.ButtonsPossibleUse.Value == true then
		game.ReplicatedStorage.GameValues.ShopOn.Value = true
		game.ReplicatedStorage.GameValues.ButtonsPossibleUse.Value = false
	end
	
	if ShopOption == "ShopControllerOff" and game.ReplicatedStorage.GameValues.ButtonsPossibleUse.Value == true then
		game.ReplicatedStorage.GameValues.ShopOff.Value = true
		game.ReplicatedStorage.GameValues.ButtonsPossibleUse.Value = false
	end
	
end)

Order.Changed:Connect(function()
	local plr = game.Players:FindFirstChild(game.ReplicatedStorage.GameValues.PlayerValue.Value)
	local Manager = require(game.ServerScriptService.Manager)
	local Profile = Manager.Profiles[plr]
	local InventoryTable = nil
	local CurrentShopTable = nil
	local CurrentShopTypeValue = nil
	
	if ShopType.Value == "CubeColor" then
	--	print(Profile.Data)
		InventoryTable = Profile.Data["Inventory"]["Cube"]["Colour"]
		CurrentShopTable = CubeColorInfo
		CurrentShopTypeValue = game.ReplicatedStorage.Shop.CurrentCubeColor
	elseif ShopType.Value == "CubeTexture" then
		InventoryTable = Profile.Data["Inventory"]["Cube"]["Texture"]
		CurrentShopTable = CubeTextureInfo
		CurrentShopTypeValue = game.ReplicatedStorage.Shop.CurrentCubeTexture
	elseif ShopType.Value == "CubeFace" then
	elseif ShopType.Value == "CubeCharacter" then
	elseif ShopType.Value == "ControllerColor" then
	--	print(Profile.Data)
		InventoryTable = Profile.Data["Inventory"]["Controller"]["Colour"]
		CurrentShopTable = ControllerColorInfo
		CurrentShopTypeValue = game.ReplicatedStorage.Shop.CurrentControllerColor
	elseif ShopType.Value == "ControllerTexture" then
		InventoryTable = Profile.Data["Inventory"]["Controller"]["Texture"]
		CurrentShopTable = ControllerTextureInfo
		CurrentShopTypeValue = game.ReplicatedStorage.Shop.CurrentControllerTexture
	end
	
	local CurrentObject = CurrentShopTable[Order.Value]
	
	
		print(InventoryTable)
		print(CurrentObject["Name"])
	
	if table.find(InventoryTable,CurrentObject["Name"]) ~= nil then
	--	print("buldu")
		if CurrentObject["Name"] == CurrentShopTypeValue.Value then
			plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.UIName.Text = CurrentObject["Name"]
		else
			plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = true
			plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Visible = false
			plr.PlayerGui.LobbyScreen.ShopBackground.UIName.UIName.Text = CurrentObject["Name"]
		end
	else
		plr.PlayerGui.LobbyScreen.ShopBackground.Equipped.Visible = false
		plr.PlayerGui.LobbyScreen.ShopBackground.Equip.Visible = false
		plr.PlayerGui.LobbyScreen.ShopBackground.Buy.Visible = true
		plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Visible = true
		plr.PlayerGui.LobbyScreen.ShopBackground.UIName.UIName.Text = CurrentObject["Name"]
		plr.PlayerGui.LobbyScreen.ShopBackground.Moneyzz.Money.Text = tostring(CurrentObject["Cost"])
	end
	
end)