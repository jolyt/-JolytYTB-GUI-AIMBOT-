local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

local aimEnabled = false
local espEnabled = false
local flyEnabled = false
local menuVisible = true
local fov = 100
local walkspeed = 16
local aimPart = "Head"

-- GUI SETUP
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 450, 0, 350)
MainFrame.Position = UDim2.new(0, 100, 0, 100)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = menuVisible

local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Text = "🔥 JolytYTB GUI AIMBOT 🔥"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

-- Tabs
local TabButtons = Instance.new("Frame", MainFrame)
TabButtons.Size = UDim2.new(0, 450, 0, 30)
TabButtons.Position = UDim2.new(0, 0, 0, 40)
TabButtons.BackgroundTransparency = 1

local AimbotBtn = Instance.new("TextButton", TabButtons)
AimbotBtn.Size = UDim2.new(0, 150, 1, 0)
AimbotBtn.Text = "🎯 Aimbot"
AimbotBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
AimbotBtn.TextColor3 = Color3.new(1, 1, 1)

local CrosshairBtn = Instance.new("TextButton", TabButtons)
CrosshairBtn.Size = UDim2.new(0, 150, 1, 0)
CrosshairBtn.Position = UDim2.new(0, 150, 0, 0)
CrosshairBtn.Text = "🎯 Crosshair"
CrosshairBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
CrosshairBtn.TextColor3 = Color3.new(1, 1, 1)

local MiscBtn = Instance.new("TextButton", TabButtons)
MiscBtn.Size = UDim2.new(0, 150, 1, 0)
MiscBtn.Position = UDim2.new(0, 300, 0, 0)
MiscBtn.Text = "⚙️ Misc"
MiscBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
MiscBtn.TextColor3 = Color3.new(1, 1, 1)

-- Pages
local AimbotPage = Instance.new("Frame", MainFrame)
AimbotPage.Size = UDim2.new(1, 0, 1, -70)
AimbotPage.Position = UDim2.new(0, 0, 0, 70)
AimbotPage.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
AimbotPage.Visible = true

local CrosshairPage = AimbotPage:Clone()
CrosshairPage.Parent = MainFrame
CrosshairPage.Visible = false

local MiscPage = AimbotPage:Clone()
MiscPage.Parent = MainFrame
MiscPage.Visible = false

-- Aimbot Settings
local FovLabel = Instance.new("TextLabel", AimbotPage)
FovLabel.Position = UDim2.new(0, 20, 0, 10)
FovLabel.Size = UDim2.new(0, 300, 0, 30)
FovLabel.Text = "📏 FOV: "..fov
FovLabel.TextColor3 = Color3.new(1, 1, 1)
FovLabel.BackgroundTransparency = 1
FovLabel.Font = Enum.Font.Gotham
FovLabel.TextSize = 16

local IncFov = Instance.new("TextButton", AimbotPage)
IncFov.Position = UDim2.new(0, 20, 0, 50)
IncFov.Size = UDim2.new(0, 200, 0, 30)
IncFov.Text = "➕ Increase FOV"
IncFov.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
IncFov.TextColor3 = Color3.new(1, 1, 1)

IncFov.MouseButton1Click:Connect(function()
    fov = fov + 10
    FovLabel.Text = "📏 FOV: "..fov
end)

local ESPButton = Instance.new("TextButton", AimbotPage)
ESPButton.Position = UDim2.new(0, 20, 0, 90)
ESPButton.Size = UDim2.new(0, 200, 0, 30)
ESPButton.Text = "👁️ ESP: OFF"
ESPButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
ESPButton.TextColor3 = Color3.new(1, 1, 1)

ESPButton.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    ESPButton.Text = espEnabled and "👁️ ESP: ON" or "👁️ ESP: OFF"
end)

local FlyButton = Instance.new("TextButton", AimbotPage)
FlyButton.Position = UDim2.new(0, 20, 0, 130)
FlyButton.Size = UDim2.new(0, 200, 0, 30)
FlyButton.Text = "🕊️ Fly: OFF"
FlyButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
FlyButton.TextColor3 = Color3.new(1, 1, 1)

FlyButton.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    FlyButton.Text = flyEnabled and "🕊️ Fly: ON" or "🕊️ Fly: OFF"
end)

local WSButton = Instance.new("TextButton", AimbotPage)
WSButton.Position = UDim2.new(0, 20, 0, 170)
WSButton.Size = UDim2.new(0, 200, 0, 30)
WSButton.Text = "🏃 WalkSpeed: "..walkspeed
WSButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
WSButton.TextColor3 = Color3.new(1, 1, 1)

WSButton.MouseButton1Click:Connect(function()
    walkspeed = walkspeed + 5
    localPlayer.Character.Humanoid.WalkSpeed = walkspeed
    WSButton.Text = "🏃 WalkSpeed: "..walkspeed
end)

-- Crosshair Settings
local CrosshairInput = Instance.new("TextBox", CrosshairPage)
CrosshairInput.Position = UDim2.new(0, 20, 0, 10)
CrosshairInput.Size = UDim2.new(0, 400, 0, 30)
CrosshairInput.PlaceholderText = "Met l'ID du crosshair (ex: 123456789)"

local ApplyCrosshair = Instance.new("TextButton", CrosshairPage)
ApplyCrosshair.Position = UDim2.new(0, 20, 0, 50)
ApplyCrosshair.Size = UDim2.new(0, 190, 0, 30)
ApplyCrosshair.Text = "✅ Appliquer"
ApplyCrosshair.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
ApplyCrosshair.TextColor3 = Color3.new(1, 1, 1)

local RemoveCrosshair = Instance.new("TextButton", CrosshairPage)
RemoveCrosshair.Position = UDim2.new(0, 230, 0, 50)
RemoveCrosshair.Size = UDim2.new(0, 190, 0, 30)
RemoveCrosshair.Text = "❌ Enlever"
RemoveCrosshair.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
RemoveCrosshair.TextColor3 = Color3.new(1, 1, 1)

local Crosshair = Instance.new("ImageLabel", ScreenGui)
Crosshair.Size = UDim2.new(0, 50, 0, 50)
Crosshair.BackgroundTransparency = 1

ApplyCrosshair.MouseButton1Click:Connect(function()
    Crosshair.Image = "rbxassetid://" .. CrosshairInput.Text
end)

RemoveCrosshair.MouseButton1Click:Connect(function()
    Crosshair.Image = ""
end)

RunService.RenderStepped:Connect(function()
    Crosshair.Position = UDim2.new(0.5, -25, 0.5, -25)
end)

-- MISC
local TPButton = Instance.new("TextButton", MiscPage)
TPButton.Position = UDim2.new(0, 20, 0, 10)
TPButton.Size = UDim2.new(0, 200, 0, 30)
TPButton.Text = "🚀 Teleport"
TPButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
TPButton.TextColor3 = Color3.new(1, 1, 1)

TPButton.MouseButton1Click:Connect(function()
    localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0) -- Change tes coords ici
end)

-- Tab Switch
AimbotBtn.MouseButton1Click:Connect(function()
    AimbotPage.Visible = true
    CrosshairPage.Visible = false
    MiscPage.Visible = false
end)

CrosshairBtn.MouseButton1Click:Connect(function()
    AimbotPage.Visible = false
    CrosshairPage.Visible = true
    MiscPage.Visible = false
end)

MiscBtn.MouseButton1Click:Connect(function()
    AimbotPage.Visible = false
    CrosshairPage.Visible = false
    MiscPage.Visible = true
end)

-- Insert key toggle menu
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        menuVisible = not menuVisible
        MainFrame.Visible = menuVisible
    end
end)

-- Fly logic
RunService.RenderStepped:Connect(function()
    if flyEnabled then
        localPlayer.Character.Humanoid:ChangeState(11)
        localPlayer.Character.HumanoidRootPart.Velocity = camera.CFrame.LookVector * 50
    end
end)

-- ESP + Aimbot logic (pareil que tes anciens scripts, à intégrer ici)
