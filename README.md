# 🌑 Darkness
> **Role:** Solo Game Developer (Full Stack Development, Level Design, Scripting)  
> **Platform:** Roblox (Luau)  
> **Status:** Released

## 📖 Proje Hakkında
Darkness, A'dan Z'ye tek başıma (Solo Dev) geliştirdiğim, atmosferik bir bulmaca ve platform oyunudur. Bu projede sadece bölüm tasarımlarını değil; tüm oyun döngüsünü (Game Loop), veri yönetimini, UI animasyonlarını ve karakter mekaniklerini sıfırdan kodladım.

## 🛠️ Teknik Yetkinlikler & Sistemler
Bu projede kullanılan temel mimari ve sistemler:

### 1. Custom Movement & Raycasting (Fizik ve Matematik)
Roblox'un standart hareket sistemi yerine, Grid tabanlı ve Raycasting destekli özel bir hareket mekaniği geliştirdim.
- **Raycasting:** Oyuncunun mouse pozisyonunu 3D dünyada algılayıp, karakterin ("Cube") gideceği rotayı hesaplar.
- **Vector Mathematics:** Karakterin yönelimini (Orientation) hesaplarken `CFrame.lookAt` ve Vektör manipülasyonları kullanılarak pürüzsüz dönüşler sağlanır.
- **Pathfinding:** Hedef noktaya gidip gidemeyeceğini analiz eden mantıksal kontroller içerir.

> **Code Highlight (`Move.lua`):**
> *Fare hareketini algılayıp, küpün bir sonraki hamlesini hesaplayan Raycast mantığı:*
```lua
-- Mouse pozisyonuna göre Raycasting işlemi ve yönelim (Orientation) hesaplaması
local cf = CFrame.new(CurrentStage.camera.Position, mousePos.Position)
local ray = Ray.new(CurrentStage.camera.Position, cf.LookVector * 1000)
local part, position = workspace:FindPartOnRayWithWhitelist(ray, CurrentStage.MainFloorParts:GetDescendants())

if part then
    -- Grid tabanlı hedef belirleme ve "FakeCube" ile ön hesaplama
    hedef.Position = Vector3.new(mousePos.Position.X, block.Position.Y + 6.565, mousePos.Position.Z)
    FakeCube.CFrame = CFrame.lookAt(block.Position, Vector3.new(hedef.Position.X, hedef.Point.Position.Y, hedef.Position.Z))
    -- ... (TweenService ile pürüzsüz dönüş animasyonları)
end
