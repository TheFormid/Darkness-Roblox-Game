local event = game.ReplicatedStorage.RemoteEvents.MoveMouse
local block = game.Workspace.Cube.Cube
local work = game.ReplicatedStorage.GameValues.MouseMovement
local TweenService = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(0.8,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0)

local BaseMode = game.ReplicatedStorage.GameValues.MouseMovementBaseMode
local hedef = game.Workspace.Cube.Hedef
local FakeCube = Instance.new("Part")
FakeCube.Parent = game.Workspace
FakeCube.Anchored = true
FakeCube.Size = Vector3.new(0.1,0.1,0.1)
FakeCube.CanCollide = false
FakeCube.Transparency = 1


local PathFindingService = game:GetService("PathfindingService")
local path = PathFindingService:CreatePath()

event.OnServerEvent:Connect(function(player,mousePos)
	if work.Value == true then
		
		local CurrentStage = game.Workspace:FindFirstChild(game.ReplicatedStorage.GameValues.CurrentStage.Value)
		
		if BaseMode.Value == true then
			
			local cf = CFrame.new(CurrentStage.camera.Position, mousePos.Position)
			local ray = Ray.new(CurrentStage.camera.Position, cf.LookVector * 1000)
			local part, position = workspace:FindPartOnRayWithWhitelist(ray, CurrentStage.MainFloorParts:GetDescendants())
		--	print("hello")
			if part then
			--	print("shit")
				hedef.Position = Vector3.new(mousePos.Position.X,block.Position.Y + 6.565,mousePos.Position.Z)

				FakeCube.CFrame = CFrame.lookAt(block.Position,Vector3.new(hedef.Position.X,hedef.Point.Position.Y,hedef.Position.Z)+Vector3.new(0.1,0,0))

				local FakeO = tonumber(FakeCube.Orientation.Y)
				local RealO = tonumber(block.Orientation.Y)
				local ResultNormal = math.abs(FakeO-RealO)
				
				local prp = {Orientation = FakeCube.Orientation}

				if ResultNormal > 180 then
					local tweeninfo2 = TweenInfo.new(0.4,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0)
					if RealO < 0 then
						local prp1 = {Orientation = Vector3.new(0,-179.5,0)}
						local prp2 = {Orientation = FakeCube.Orientation}
						local tweeninfo3 = TweenInfo.new((-179.5-tonumber(block.Orientation.Y))/360,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0)
						local tweeninfo4 = TweenInfo.new((179.5-tonumber(FakeCube.Orientation.Y))/360,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0)
						local tween1 = TweenService:Create(block,tweeninfo3,prp1)
						local tween2 = TweenService:Create(block,tweeninfo4,prp2)
						tween1:Play()
						tween1.Completed:Wait()
						block.Orientation = Vector3.new(0,179.5,0)
						tween2:Play()
					else
						local prp1 = {Orientation = Vector3.new(0,179.5,0)}
						local prp2 = {Orientation = FakeCube.Orientation}
						local tweeninfo3 = TweenInfo.new((179.5-tonumber(block.Orientation.Y))/360,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0)
						local tweeninfo4 = TweenInfo.new((-179.5-tonumber(FakeCube.Orientation.Y))/360,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0)
						local tween1 = TweenService:Create(block,tweeninfo3,prp1)
						local tween2 = TweenService:Create(block,tweeninfo4,prp2)
						tween1:Play()
						tween1.Completed:Wait()
						block.Orientation = Vector3.new(0,-179.5,0)
						tween2:Play()
					end
				else
					local tween = TweenService:Create(block,tweeninfo,prp)
					tween:Play()
				end
			end
			
		else
			
			hedef.Position = Vector3.new(mousePos.X,block.Position.Y + 6.565,mousePos.Z)

			FakeCube.CFrame = CFrame.lookAt(block.Position,Vector3.new(hedef.Position.X,hedef.Point.Position.Y,hedef.Position.Z)+Vector3.new(0.1,0,0))

			local FakeO = tonumber(FakeCube.Orientation.Y)
			local RealO = tonumber(block.Orientation.Y)
			local ResultNormal = math.abs(FakeO-RealO)

			local prp = {Orientation = FakeCube.Orientation}

			if ResultNormal > 180 then
				local tweeninfo2 = TweenInfo.new(0.4,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0)
				if RealO < 0 then
					local prp1 = {Orientation = Vector3.new(0,-180,0)}
					local prp2 = {Orientation = FakeCube.Orientation}
					local tween1 = TweenService:Create(block,tweeninfo2,prp1)
					local tween2 = TweenService:Create(block,tweeninfo2,prp2)
					tween1:Play()
					tween1.Completed:Wait()
					block.Orientation = Vector3.new(0,179.5,0)
					tween2:Play()
				else
					local prp1 = {Orientation = Vector3.new(0,180,0)}
					local prp2 = {Orientation = FakeCube.Orientation}
					local tween1 = TweenService:Create(block,tweeninfo2,prp1)
					local tween2 = TweenService:Create(block,tweeninfo2,prp2)
					tween1:Play()
					tween1.Completed:Wait()
					block.Orientation = Vector3.new(0,-179.5,0)
					tween2:Play()
				end
			else
				local tween = TweenService:Create(block,tweeninfo,prp)
				tween:Play()
			end
			
		end
		
		game.ReplicatedStorage.GameValues.PlayerStartTheLevel.Value = true
		
		

		
	end	
end)