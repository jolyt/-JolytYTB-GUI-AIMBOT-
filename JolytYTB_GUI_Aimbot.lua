
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

local aimEnabled = false
local espEnabled = false
local menuVisible = true
local fov = 100
local aimPart = "Head"

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 350)
MainFrame.Position = UDim2.new(0, 100, 0, 100)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = menuVisible

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "🎯 JolytYTB GUI AIMBOT 🎯"
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold

local AimbotTabBtn = Instance.new("TextButton", MainFrame)
AimbotTabBtn.Size = UDim2.new(0, 200, 0, 30)
AimbotTabBtn.Position = UDim2.new(0, 0, 0, 40)
AimbotTabBtn.Text = "🎯 Aimbot Settings"
AimbotTabBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AimbotTabBtn.TextColor3 = Color3.new(1, 1, 1)

local CrosshairTabBtn = Instance.new("TextButton", MainFrame)
CrosshairTabBtn.Size = UDim2.new(0, 200, 0, 30)
CrosshairTabBtn.Position = UDim2.new(0, 200, 0, 40)
CrosshairTabBtn.Text = "🎯 Crosshair Settings"
CrosshairTabBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CrosshairTabBtn.TextColor3 = Color3.new(1, 1, 1)

local AimbotTab = Instance.new("Frame", MainFrame)
AimbotTab.Size = UDim2.new(1, 0, 1, -70)
AimbotTab.Position = UDim2.new(0, 0, 0, 70)
AimbotTab.Visible = true

local FovLabel = Instance.new("TextLabel", AimbotTab)
FovLabel.Position = UDim2.new(0, 0, 0, 0)
FovLabel.Size = UDim2.new(1, 0, 0, 30)
FovLabel.Text = "📏 FOV : " .. fov
FovLabel.TextColor3 = Color3.new(1, 1, 1)
FovLabel.BackgroundTransparency = 1

local IncreaseFov = Instance.new("TextButton", AimbotTab)
IncreaseFov.Position = UDim2.new(0, 20, 0, 40)
IncreaseFov.Size = UDim2.new(0, 150, 0, 40)
IncreaseFov.Text = "➕ Increase FOV"
IncreaseFov.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
IncreaseFov.TextColor3 = Color3.new(1, 1, 1)

IncreaseFov.MouseButton1Click:Connect(function()
    fov = fov + 10
    FovLabel.Text = "📏 FOV : " .. fov
end)

local DecreaseFov = Instance.new("TextButton", AimbotTab)
DecreaseFov.Position = UDim2.new(0, 200, 0, 40)
DecreaseFov.Size = UDim2.new(0, 150, 0, 40)
DecreaseFov.Text = "➖ Decrease FOV"
DecreaseFov.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
DecreaseFov.TextColor3 = Color3.new(1, 1, 1)

DecreaseFov.MouseButton1Click:Connect(function()
    fov = math.max(fov - 10, 10)
    FovLabel.Text = "📏 FOV : " .. fov
end)

local ESPButton = Instance.new("TextButton", AimbotTab)
ESPButton.Position = UDim2.new(0, 20, 0, 100)
ESPButton.Size = UDim2.new(0, 330, 0, 40)
ESPButton.Text = "👁️ Toggle ESP (OFF)"
ESPButton.BackgroundColor3 = Color3.fromRGB(0, 85, 170)
ESPButton.TextColor3 = Color3.new(1, 1, 1)

ESPButton.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    ESPButton.Text = espEnabled and "👁️ Toggle ESP (ON)" or "👁️ Toggle ESP (OFF)"
end)

local CrosshairTab = Instance.new("Frame", MainFrame)
CrosshairTab.Size = UDim2.new(1, 0, 1, -70)
CrosshairTab.Position = UDim2.new(0, 0, 0, 70)
CrosshairTab.Visible = false

local CrosshairInput = Instance.new("TextBox", CrosshairTab)
CrosshairInput.Position = UDim2.new(0, 20, 0, 0)
CrosshairInput.Size = UDim2.new(0, 360, 0, 40)
CrosshairInput.PlaceholderText = "Met l'ID du crosshair (ex: 123456789)"

local ApplyCrosshair = Instance.new("TextButton", CrosshairTab)
ApplyCrosshair.Position = UDim2.new(0, 20, 0, 60)
ApplyCrosshair.Size = UDim2.new(0, 170, 0, 40)
ApplyCrosshair.Text = "✅ Appliquer"
ApplyCrosshair.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
ApplyCrosshair.TextColor3 = Color3.new(1, 1, 1)

local RemoveCrosshair = Instance.new("TextButton", CrosshairTab)
RemoveCrosshair.Position = UDim2.new(0, 210, 0, 60)
RemoveCrosshair.Size = UDim2.new(0, 170, 0, 40)
RemoveCrosshair.Text = "❌ Enlever"
RemoveCrosshair.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
RemoveCrosshair.TextColor3 = Color3.new(1, 1, 1)

local CreationLabel = Instance.new("TextLabel", ScreenGui)
CreationLabel.Size = UDim2.new(0, 200, 0, 50)
CreationLabel.Position = UDim2.new(0.5, -100, 0.5, -25)
CreationLabel.Text = "🛠️ EN CRÉATION ! 🛠️"
CreationLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
CreationLabel.BackgroundTransparency = 1
CreationLabel.TextScaled = true
CreationLabel.Font = Enum.Font.GothamBold
CreationLabel.Visible = false

AimbotTabBtn.MouseButton1Click:Connect(function()
    AimbotTab.Visible = true
    CrosshairTab.Visible = false
    CreationLabel.Visible = false
end)

CrosshairTabBtn.MouseButton1Click:Connect(function()
    AimbotTab.Visible = false
    CrosshairTab.Visible = true
    CreationLabel.Visible = true
end)

local Crosshair = Instance.new("ImageLabel", ScreenGui)
Crosshair.Size = UDim2.new(0, 50, 0, 50)
Crosshair.BackgroundTransparency = 1

ApplyCrosshair.MouseButton1Click:Connect(function()
    local id = CrosshairInput.Text
    Crosshair.Image = "rbxassetid://" .. id
end)

RemoveCrosshair.MouseButton1Click:Connect(function()
    Crosshair.Image = ""
end)

RunService.RenderStepped:Connect(function()
    Crosshair.Position = UDim2.new(0.5, -25, 0.5, -25)
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        menuVisible = not menuVisible
        MainFrame.Visible = menuVisible
        CreationLabel.Visible = menuVisible and CrosshairTab.Visible
    end
end)

local function createESP(player)
    if not player.Character then return end
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "ESP"
    box.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
    box.AlwaysOnTop = true
    box.Size = Vector3.new(4, 6, 1)
    box.ZIndex = 5
    box.Color3 = Color3.new(1, 0, 0)
    box.Transparency = 0.5
    box.Parent = player.Character
end

local function clearESP()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("ESP") then
            player.Character:FindFirstChild("ESP"):Destroy()
        end
    end
end

RunService.RenderStepped:Connect(function()
    if espEnabled then
        clearESP()
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                createESP(player)
            end
        end
    else
        clearESP()
    end
end)

local function getClosestPlayer()
    local closest = nil
    local shortest = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild(aimPart) then
            local pos, onScreen = camera:WorldToViewportPoint(player.Character[aimPart].Position)
            if onScreen then
                local dist = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).magnitude
                if dist < shortest and dist <= fov then
                    shortest = dist
                    closest = player
                end
            end
        end
    end

    return closest
end

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimEnabled = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimEnabled = false
    end
end)

RunService.RenderStepped:Connect(function()
    if aimEnabled then
        local target = getClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild(aimPart) then
            camera.CFrame = CFrame.new(camera.CFrame.Position, target.Character[aimPart].Position)
        end
    end
end)

local FovCircle = Drawing.new("Circle")
FovCircle.Color = Color3.fromRGB(255, 255, 0)
FovCircle.Thickness = 2
FovCircle.Filled = false

RunService.RenderStepped:Connect(function()
    FovCircle.Position = UserInputService:GetMouseLocation()
    FovCircle.Radius = fov
    FovCircle.Visible = true
end)
