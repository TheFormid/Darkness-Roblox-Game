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
- **Raycasting:** Calculates the character's path by projecting rays from the camera to the mouse position in 3D space.
- **Vector Mathematics:** Utilizes `CFrame.lookAt` and Vector manipulation to handle character orientation logic dynamically.
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

```

### 2. Modular 3D Shop System (Data-Driven UI)

I developed an immersive 3D shop system integrated into the game world, replacing traditional 2D GUIs.

* **Circular 3D Carousel:** Items (Cubes, Skins) rotate through 3D points in a circular motion using `TweenService`.
* **Data Driven:** The shop inventory is populated dynamically from modular tables, making the system scalable and easy to update without changing the core logic.
* **Inventory Management:** Syncs player data seamlessly with the visual representation.

> **Code Highlight (`ShopController.lua`):**
> *Carousel logic moving 3D objects between points when navigating right:*

```lua
if ShopOption == "Right" and Debounce.Value == false then
    Debounce.Value = true
    Order.Value += 1
    -- Dynamic tweening of objects to the next 3D point (Point2 -> Point3)
    local tween2 = TweenService:Create(Part2, inf, Prp2):Play()
    local tween3 = TweenService:Create(Part3, inf, Prp3):Play()
    -- Scaling effect for the focused item
    local SizeUpTween = TweenService:Create(Part3, inf, SizeUpPrp):Play()
end

```

### 3. Data Management & Game Loop

The entire game flow is managed through a centralized data structure.

* **Data Serialization:** Player stats (Coins, Inventory, Level) are structured using a `Template` table for reliable DataStore saving/loading.
* **Cinematic Transitions:** Level transitions and game start sequences use coded camera movements and UI tweens for a polished experience.

> **Code Highlight (`Template.lua`):**
> *Hierarchical data structure for player persistence:*

```lua
local Template = {
    Coin = 5000,
    Inventory = {
        Cube = { Colour = {"Classic"}, Face = {"None"} },
        Controller = { Colour = {"Classic"} }
    },
    Gamepass = { ["DoublCoin"] = false, ["VIP"] = false },
    Level = 1
}
return Template

```

## 📂 Source Code

You can explore the core scripts of the project in the root directory:

* [Move.lua](https://www.google.com/search?q=./Move.lua) - Character movement physics and raycasting.
* [ShopController.lua](https://www.google.com/search?q=./ShopController.lua) - 3D Shop system and inventory logic.
* [MainGameStarted.lua](https://www.google.com/search?q=./MainGameStarted.lua) - Game loop and cinematic transitions.
* [Template.lua](https://www.google.com/search?q=./Template.lua) - Data structure.

```

```
