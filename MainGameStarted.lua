local TweenService = game:GetService("TweenService")



local PassEffectDelay = false
local GetDiedDelay = false
local MainGameStartedDelay = false
local LevelPassDelay = false

local Plr = nil

local CubeInfo = require(game.ReplicatedStorage:WaitForChild("Shop"):WaitForChild("Cube"))

function MainGameStarted()

	local CurrentStage = game.ReplicatedStorage.Stages:FindFirstChild(game.ReplicatedStorage.GameValues.CurrentStage.Value):Clone()
	CurrentStage.Parent = game.Workspace
	game.Workspace.Cube.Cube.CFrame = CurrentStage.Start.CFrame
	game.ReplicatedStorage.GameValues.MainGameStarted.Value = false
	
	local StageChoose = Plr.PlayerGui.StageScreen.StagesMain
	
	local inf2 = TweenInfo.new(2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0)
	local inf1 = TweenInfo.new(2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0)
	local tween1 = TweenService:Create(StageChoose,inf1,{Position = UDim2.new(StageChoose.Position.X.Scale,0,2,0)})
	local tween2 = TweenService:Create(Plr.PlayerGui.Black.Label,inf2,{Position = UDim2.new(0,0,0,0)})
	local tween3 = TweenService:Create(Plr.PlayerGui.Black.Label,inf2,{Position = UDim2.new(0,0,-1,0)})
	local tween4 = TweenService:Create(Plr.PlayerGui.Black.Load,inf2,{Position = UDim2.new(0,0,-1,0)})
	
	local PassEfectTweeningInformation = TweenInfo.new(2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0)
	local PassEffectPartPropertiesA = { BackgroundTransparency = 0;}
	local PassEffectPartPropertiesB = { BackgroundTransparency = 1;}
	local PassEffectPartPropertiesC = { ImageTransparency = 1;}
	local PassEffectPartPropertiesD = { ImageTransparency = 0;}
	local PassEffectTween1a = TweenService:Create(Plr.PlayerGui.Black.Label,PassEfectTweeningInformation,PassEffectPartPropertiesA)
	local PassEffectTween2a = TweenService:Create(Plr.PlayerGui.Black.Load,PassEfectTweeningInformation,PassEffectPartPropertiesD)
	local PassEffectTween1b = TweenService:Create(Plr.PlayerGui.Black.Label,PassEfectTweeningInformation,PassEffectPartPropertiesB)
	local PassEffectTween2b = TweenService:Create(Plr.PlayerGui.Black.Load,PassEfectTweeningInformation,PassEffectPartPropertiesC)
	
	tween1:Play()
	wait(1)
	Plr.PlayerGui.Black.Label.Position = (UDim2.new(0, 0,-1, 0))
	Plr.PlayerGui.Black.Label.BackgroundTransparency = 0
	Plr.PlayerGui.Black.Enabled = true
	tween2:Play()
	wait(2)
	PassEffectTween2a:Play()
	Plr.PlayerGui.Black.Load.UITurn.Enabled = true
	wait(4)
	Plr.PlayerGui.LobbyScreen.Buttons.SinglePlayer.ImageTransparency = 1
	Plr.PlayerGui.LobbyScreen.Buttons.SinglePlayerShadow.ImageTransparency = 1
	Plr.PlayerGui.Black.Load.UITurn.Enabled = false
	wait(.5)
	PassEffectTween2b:Play()
	
	wait(1.5)
	
	Plr.PlayerGui.lobbykamera.Enabled = false
	Plr.PlayerGui.lobbyStageKamera.Enabled = false
	Plr.PlayerGui.kamera.Enabled = true
--	Plr.PlayerGui.LightsOff.Enabled = true
	game.ReplicatedStorage.GameValues.camer.Value = CurrentStage.Name
	game.ReplicatedStorage.GameValues.CharacterMovement.Value = true
	game.ReplicatedStorage.GameValues.MouseMovement.Value = true
	game.ReplicatedStorage.GameValues.OnGame.Value = true
	game.ReplicatedStorage.GameValues.PassTimeForUI.Value = false
	game.ReplicatedStorage.GameValues.ButtonsPossibleUse.Value = false
	game.Workspace.Cube.Hedef.Position = CurrentStage.Start.Position + Vector3.new(0,40,0.2)
	game.Workspace.Cube.Cube.Color  = CubeInfo.Color[game.ReplicatedStorage.Shop.CurrentCubeColor.Value]["Colour"]
	game.ReplicatedStorage.GameValues.MouseMovementBaseMode.Value = false
	game.Workspace.Cube.Cube.Go.Goal.Value = game.Workspace.Cube.Hedef.Point
	
	if CurrentStage:FindFirstChild("SetTheStage") then
		CurrentStage.SetTheStage.Enabled = true
	end
	
	tween3:Play()
	tween3.Completed:Wait()
	
	Plr.PlayerGui.StageScreen.Enabled = false
	Plr.PlayerGui.StageScreen.StagesMain.Position = UDim2.new(0.24, 0,0.222, 0)
	Plr.PlayerGui.Black.Label.BackgroundTransparency = 1
	Plr.PlayerGui.Black.Load.ImageTransparency = 1
	Plr.PlayerGui.Black.Label.Position = (UDim2.new(0, 0,0, 0))
	Plr.PlayerGui.Black.Load.Position = (UDim2.new(0.407, 0,0.315, 0))
	Plr.PlayerGui.Black.Enabled = false
--	PassEffectTween2b:Play()
--	PassEffectTween1b:Play()

	--if CurrentStage:FindFirstChild("SetTheStage") then
	--	CurrentStage.SetTheStage.Enabled = true
	--end
	
	MainGameStartedDelay = false
	
end


while wait(0) do
	if game.ReplicatedStorage.GameValues.PlayerValue.Value ~= nil then
		Plr = game.Players:FindFirstChild(game.ReplicatedStorage.GameValues.PlayerValue.Value)
	end	
	if game.ReplicatedStorage.GameValues.MainGameStarted.Value == true and MainGameStartedDelay == false then
		MainGameStartedDelay = true 
		MainGameStarted() 
	end
end
