# 🌑 Darkness
> **Role:** Solo Game Developer (Full Stack Development, Level Design, Scripting)  
> **Platform:** Roblox (Luau)  
> **Status:** Released

## 📖 About the Project
**Darkness** is an atmospheric puzzle and platformer game developed entirely as a **Solo Dev** project. I was responsible for the entire pipeline: from level design to scripting the core game loop, data management systems, UI animations, and character mechanics.

## 🛠️ Technical Systems & Architecture
Key architectural patterns and systems I implemented in this project:

### 1. Custom Movement & Raycasting (Physics & Math)
Instead of relying on standard Roblox movement, I engineered a grid-based movement system powered by Raycasting.
- [cite_start]**Raycasting:** Calculates the character's path by projecting rays from the camera to the mouse position in 3D space[cite: 4].
- [cite_start]**Vector Mathematics:** Utilizes `CFrame.lookAt` and Vector manipulation to handle character orientation logic dynamically[cite: 5, 6].
- **Pathfinding Logic:** Includes checks to ensure valid movement targets on the grid.

> **Code Highlight (`Move.lua`):**
> *Logic for calculating the next move using Raycasting and Orientation:*
```lua
-- Raycasting from camera to mouse position to determine movement target
local cf = CFrame.new(CurrentStage.camera.Position, mousePos.Position)
local ray = Ray.new(CurrentStage.camera.Position, cf.LookVector * 1000)
local part, position = workspace:FindPartOnRayWithWhitelist(ray, CurrentStage.MainFloorParts:GetDescendants())

if part then
    -- Calculating the target grid position and "FakeCube" orientation
    hedef.Position = Vector3.new(mousePos.Position.X, block.Position.Y + 6.565, mousePos.Position.Z)
    FakeCube.CFrame = CFrame.lookAt(block.Position, Vector3.new(hedef.Position.X, hedef.Point.Position.Y, hedef.Position.Z))
    -- (Smooth transitions handled via TweenService)
end
