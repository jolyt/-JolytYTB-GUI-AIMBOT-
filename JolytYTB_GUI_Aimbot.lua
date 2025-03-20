-- SERVICES
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- CLEAN GUI EXISTANT
if game.CoreGui:FindFirstChild("JolytYTB_KeySystem") then
    game.CoreGui.JolytYTB_KeySystem:Destroy()
end

-- KEY SYSTEM GUI


-- SERVICES
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- VARIABLES
local menuVisible = true

-- CLEAN GUI EXISTANT
if game.CoreGui:FindFirstChild("JolytYTB_GUI") then
    game.CoreGui.JolytYTB_GUI:Destroy()
end

-- CREATION GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "JolytYTB_GUI"
gui.Enabled = false

local function createMainGUI()
    gui.Enabled = true
end


-- MAIN FRAME
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 450, 0, 400)
main.Position = UDim2.new(0, 100, 0, 100)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderColor3 = Color3.fromRGB(255, 0, 0)
main.Active = true
main.Draggable = true
main.Visible = menuVisible

-- TOPBAR
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1, 0, 0, 40)
top.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1, 0, 1, 0)
title.Text = "🔥 JolytYTB GUI AIMBOT 🔥"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.BackgroundTransparency = 1

-- TABS FRAME
local tabFrame = Instance.new("Frame", main)
tabFrame.Size = UDim2.new(1, 0, 0, 30)
tabFrame.Position = UDim2.new(0, 0, 0, 40)
tabFrame.BackgroundTransparency = 1

-- BUTTONS ONGLET
local aimbotBtn = Instance.new("TextButton", tabFrame)
aimbotBtn.Size = UDim2.new(0, 150, 1, 0)
aimbotBtn.Text = "🎯 Aimbot"
aimbotBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
aimbotBtn.TextColor3 = Color3.new(1, 1, 1)

local miscBtn = Instance.new("TextButton", tabFrame)
miscBtn.Size = UDim2.new(0, 150, 1, 0)
miscBtn.Position = UDim2.new(0, 150, 0, 0)
miscBtn.Text = "⚙️ Misc"
miscBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
miscBtn.TextColor3 = Color3.new(1, 1, 1)

local crosshairBtn = Instance.new("TextButton", tabFrame)
crosshairBtn.Size = UDim2.new(0, 150, 1, 0)
crosshairBtn.Position = UDim2.new(0, 300, 0, 0)
crosshairBtn.Text = "🎯 Crosshair"
crosshairBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
crosshairBtn.TextColor3 = Color3.new(1, 1, 1)

-- PAGES
local aimbotPage = Instance.new("Frame", main)
aimbotPage.Size = UDim2.new(1, 0, 1, -70)
aimbotPage.Position = UDim2.new(0, 0, 0, 70)
aimbotPage.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
aimbotPage.Visible = true

local miscPage = aimbotPage:Clone()
miscPage.Parent = main
miscPage.Visible = false

local crosshairPage = aimbotPage:Clone()
crosshairPage.Parent = main
crosshairPage.Visible = false

-- ANIMATIONS DES ONGLET
aimbotBtn.MouseButton1Click:Connect(function()
    aimbotPage.Visible = true
    miscPage.Visible = false
    crosshairPage.Visible = false
end)

miscBtn.MouseButton1Click:Connect(function()
    aimbotPage.Visible = false
    miscPage.Visible = true
    crosshairPage.Visible = false
end)

crosshairBtn.MouseButton1Click:Connect(function()
    aimbotPage.Visible = false
    miscPage.Visible = false
    crosshairPage.Visible = true
end)

-- INSERT POUR HIDE / SHOW MENU
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        menuVisible = not menuVisible
        gui.Enabled = menuVisible
    end
end)

-- ON GARDE LES PAGES POUR LES PROCHAINS SCRIPTS
_G.JolytYTB_Gui = {
    AimbotPage = aimbotPage,
    MiscPage = miscPage,
    CrosshairPage = crosshairPage
}

local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "JolytYTB_KeySystem"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 0, 0, 0)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.Active = true
frame.Draggable = true
frame.BackgroundTransparency = 1

-- ANIMATION D'OUVERTURE
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local goal = {Size = UDim2.new(0, 400, 0, 200), BackgroundTransparency = 0}
TweenService:Create(frame, tweenInfo, goal):Play()

-- TITRE
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "🔐 JolytYTB HUB Key System"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.BackgroundTransparency = 1

-- TEXTBOX POUR LA CLE
local textbox = Instance.new("TextBox", frame)
textbox.PlaceholderText = "Enter Key (hubjolyt)"
textbox.Size = UDim2.new(0, 350, 0, 40)
textbox.Position = UDim2.new(0.5, -175, 0.5, -20)
textbox.Text = ""
textbox.Font = Enum.Font.Gotham
textbox.TextColor3 = Color3.new(1, 1, 1)
textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- CONFIRM BUTTON
local confirm = Instance.new("TextButton", frame)
confirm.Text = "✅ Confirm"
confirm.Size = UDim2.new(0, 200, 0, 40)
confirm.Position = UDim2.new(0.5, -100, 1, -50)
confirm.TextColor3 = Color3.new(1, 1, 1)
confirm.BackgroundColor3 = Color3.fromRGB(0, 170, 0)

confirm.MouseButton1Click:Connect(function()
    if textbox.Text == "hubjolyt" then
        screenGui:Destroy()
        print("✅ Correct Key ➔ GUI MENU OPEN")
        createMainGUI()
    else
        confirm.Text = "❌ Incorrect Key"
        confirm.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    end
end)


-- Variables pour l'aimbot
local aimEnabled = false
local fov = 100
local aimPart = "Head"

-- FOV Circle
local FovCircle = Drawing.new("Circle")
FovCircle.Color = Color3.fromRGB(255, 0, 0)
FovCircle.Thickness = 2
FovCircle.NumSides = 100
FovCircle.Filled = false
FovCircle.Visible = true

-- Service requis
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

-- Onglet Aimbot (on utilise celui créé dans le GUI)
local AimbotPage = _G.JolytYTB_Gui.AimbotPage

-- Crée un bouton pour activer/désactiver l'aimbot
local aimbotToggle = Instance.new("TextButton", AimbotPage)
aimbotToggle.Position = UDim2.new(0, 20, 0, 10)
aimbotToggle.Size = UDim2.new(0, 200, 0, 30)
aimbotToggle.Text = "🎯 Aimbot OFF"
aimbotToggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
aimbotToggle.TextColor3 = Color3.new(1, 1, 1)

aimbotToggle.MouseButton1Click:Connect(function()
    aimEnabled = not aimEnabled
    aimbotToggle.Text = aimEnabled and "🎯 Aimbot ON" or "🎯 Aimbot OFF"
    aimbotToggle.BackgroundColor3 = aimEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
end)

-- Crée le slider FOV
local function createSlider(parent, titleText, min, max, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(0, 400, 0, 60)
    frame.Position = UDim2.new(0, 20, 0, 60)
    frame.BackgroundTransparency = 1

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 20)
    title.Text = titleText .. ": " .. default
    title.TextColor3 = Color3.new(1, 1, 1)
    title.BackgroundTransparency = 1
    title.TextXAlignment = Enum.TextXAlignment.Left

    local sliderBar = Instance.new("Frame", frame)
    sliderBar.Position = UDim2.new(0, 0, 0, 30)
    sliderBar.Size = UDim2.new(0, 400, 0, 10)
    sliderBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    local sliderBtn = Instance.new("TextButton", sliderBar)
    sliderBtn.Size = UDim2.new(0, 10, 0, 20)
    sliderBtn.Position = UDim2.new((default - min) / (max - min), -5, 0.5, -10)
    sliderBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    sliderBtn.Text = ""

    local dragging = false
    sliderBtn.MouseButton1Down:Connect(function()
        dragging = true
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    RunService.RenderStepped:Connect(function()
        if dragging then
            local mouseX = UserInputService:GetMouseLocation().X
            local relativeX = math.clamp(mouseX - sliderBar.AbsolutePosition.X, 0, sliderBar.AbsoluteSize.X)
            local value = math.floor(min + (relativeX / sliderBar.AbsoluteSize.X) * (max - min))
            sliderBtn.Position = UDim2.new(relativeX / sliderBar.AbsoluteSize.X, -5, 0.5, -10)
            title.Text = titleText .. ": " .. value
            callback(value)
        end
    end)
end

-- On crée le slider du FOV
createSlider(AimbotPage, "FOV", 10, 500, fov, function(val)
    fov = val
end)

-- Fonction pour récupérer le joueur le plus proche
local function getClosestPlayer()
    local closest = nil
    local shortest = math.huge
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(aimPart) then
            local pos, visible = Camera:WorldToViewportPoint(player.Character[aimPart].Position)
            if visible then
                local distance = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                if distance < shortest and distance <= fov then
                    shortest = distance
                    closest = player
                end
            end
        end
    end
    return closest
end

-- RenderStepped ➔ Aimbot et FOV Circle
RunService.RenderStepped:Connect(function()
    -- FOV Circle
    FovCircle.Position = UserInputService:GetMouseLocation()
    FovCircle.Radius = fov
    FovCircle.Visible = true

    -- Aimbot (clic droit maintenu)
    if aimEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = getClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild(aimPart) then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character[aimPart].Position)
        end
    end
end)

-- Variables pour le Misc
local walkspeed = 16
local flyEnabled = false
local noclipEnabled = false
local espEnabled = false
local clickTPEnabled = false

local FlyControl = {Forward = 0, Back = 0, Left = 0, Right = 0, Up = 0, Down = 0}
local FlySpeed = 100

-- ESP Functions
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
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("ESP") then
            player.Character:FindFirstChild("ESP"):Destroy()
        end
    end
end

-- Onglet Misc (on utilise celui créé dans le GUI)
local MiscPage = _G.JolytYTB_Gui.MiscPage

-- WalkSpeed Slider
createSlider(MiscPage, "WalkSpeed", 16, 200, walkspeed, function(val)
    walkspeed = val
    local char = game:GetService("Players").LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = walkspeed
    end
end)

-- Fly Toggle Button
local flyToggle = Instance.new("TextButton", MiscPage)
flyToggle.Position = UDim2.new(0, 20, 0, 100)
flyToggle.Size = UDim2.new(0, 200, 0, 30)
flyToggle.Text = "🕊️ Fly OFF"
flyToggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
flyToggle.TextColor3 = Color3.new(1, 1, 1)

flyToggle.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    flyToggle.Text = flyEnabled and "🕊️ Fly ON" or "🕊️ Fly OFF"
    flyToggle.BackgroundColor3 = flyEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
end)

-- ESP Toggle Button
local espToggle = Instance.new("TextButton", MiscPage)
espToggle.Position = UDim2.new(0, 20, 0, 140)
espToggle.Size = UDim2.new(0, 200, 0, 30)
espToggle.Text = "👁️ ESP OFF"
espToggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
espToggle.TextColor3 = Color3.new(1, 1, 1)

espToggle.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    espToggle.Text = espEnabled and "👁️ ESP ON" or "👁️ ESP OFF"
    espToggle.BackgroundColor3 = espEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
end)

-- Noclip Toggle Button
local noclipToggle = Instance.new("TextButton", MiscPage)
noclipToggle.Position = UDim2.new(0, 20, 0, 180)
noclipToggle.Size = UDim2.new(0, 200, 0, 30)
noclipToggle.Text = "🧱 Noclip OFF"
noclipToggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
noclipToggle.TextColor3 = Color3.new(1, 1, 1)

noclipToggle.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    noclipToggle.Text = noclipEnabled and "🧱 Noclip ON" or "🧱 Noclip OFF"
    noclipToggle.BackgroundColor3 = noclipEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
end)

-- Click TP Toggle Button
local clickTPToggle = Instance.new("TextButton", MiscPage)
clickTPToggle.Position = UDim2.new(0, 20, 0, 220)
clickTPToggle.Size = UDim2.new(0, 200, 0, 30)
clickTPToggle.Text = "🖱️ Click TP OFF"
clickTPToggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
clickTPToggle.TextColor3 = Color3.new(1, 1, 1)

clickTPToggle.MouseButton1Click:Connect(function()
    clickTPEnabled = not clickTPEnabled
    clickTPToggle.Text = clickTPEnabled and "🖱️ Click TP ON" or "🖱️ Click TP OFF"
    clickTPToggle.BackgroundColor3 = clickTPEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
end)

-- TP Direct Button
local tpDirect = Instance.new("TextButton", MiscPage)
tpDirect.Position = UDim2.new(0, 20, 0, 260)
tpDirect.Size = UDim2.new(0, 200, 0, 30)
tpDirect.Text = "🚀 TP Forward"
tpDirect.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
tpDirect.TextColor3 = Color3.new(1, 1, 1)

tpDirect.MouseButton1Click:Connect(function()
    local char = game:GetService("Players").LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + (char.HumanoidRootPart.CFrame.LookVector * 50)
    end
end)

-- Fly Movement Control
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if flyEnabled then
        if input.KeyCode == Enum.KeyCode.W then FlyControl.Forward = 1 end
        if input.KeyCode == Enum.KeyCode.S then FlyControl.Back = 1 end
        if input.KeyCode == Enum.KeyCode.A then FlyControl.Left = 1 end
        if input.KeyCode == Enum.KeyCode.D then FlyControl.Right = 1 end
        if input.KeyCode == Enum.KeyCode.Space then FlyControl.Up = 1 end
        if input.KeyCode == Enum.KeyCode.LeftShift then FlyControl.Down = 1 end
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if flyEnabled then
        if input.KeyCode == Enum.KeyCode.W then FlyControl.Forward = 0 end
        if input.KeyCode == Enum.KeyCode.S then FlyControl.Back = 0 end
        if input.KeyCode == Enum.KeyCode.A then FlyControl.Left = 0 end
        if input.KeyCode == Enum.KeyCode.D then FlyControl.Right = 0 end
        if input.KeyCode == Enum.KeyCode.Space then FlyControl.Up = 0 end
        if input.KeyCode == Enum.KeyCode.LeftShift then FlyControl.Down = 0 end
    end
end)

-- RenderStepped ➔ ESP / Fly / Noclip / ClickTP
game:GetService("RunService").RenderStepped:Connect(function()
    -- ESP
    if espEnabled then
        clearESP()
        for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
            if p ~= game:GetService("Players").LocalPlayer then
                createESP(p)
            end
        end
    else
        clearESP()
    end

    -- Fly
    if flyEnabled then
        local move = Vector3.new(
            FlyControl.Right - FlyControl.Left,
            FlyControl.Up - FlyControl.Down,
            FlyControl.Back - FlyControl.Forward
        )
        local char = game:GetService("Players").LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.Velocity = workspace.CurrentCamera.CFrame:VectorToWorldSpace(move) * FlySpeed
        end
    end

    -- Noclip
    if noclipEnabled then
        local char = game:GetService("Players").LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

-- Click TP ➔ Clique Gauche
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if clickTPEnabled and input.UserInputType == Enum.UserInputType.MouseButton1 then
        local mouse = game:GetService("Players").LocalPlayer:GetMouse()
        local char = game:GetService("Players").LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 3, 0))
        end
    end
end)

-- Onglet Crosshair (on utilise celui créé dans le GUI)
local CrosshairPage = _G.JolytYTB_Gui.CrosshairPage

-- Crosshair Image
local crosshairImage = Instance.new("ImageLabel")
crosshairImage.Parent = game.CoreGui
crosshairImage.Size = UDim2.new(0, 50, 0, 50)
crosshairImage.Position = UDim2.new(0.5, -25, 0.5, -25)
crosshairImage.BackgroundTransparency = 1
crosshairImage.Image = ""

-- TextBox pour entrer l'ID du Crosshair
local crosshairInput = Instance.new("TextBox", CrosshairPage)
crosshairInput.Position = UDim2.new(0, 20, 0, 10)
crosshairInput.Size = UDim2.new(0, 300, 0, 30)
crosshairInput.PlaceholderText = "🎯 Entre l'ID de l'image Crosshair"
crosshairInput.Text = ""
crosshairInput.TextColor3 = Color3.new(1, 1, 1)
crosshairInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
crosshairInput.Font = Enum.Font.Gotham
crosshairInput.TextSize = 14

-- Bouton Appliquer le Crosshair
local applyButton = Instance.new("TextButton", CrosshairPage)
applyButton.Position = UDim2.new(0, 20, 0, 50)
applyButton.Size = UDim2.new(0, 140, 0, 30)
applyButton.Text = "✅ Appliquer"
applyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
applyButton.TextColor3 = Color3.new(1, 1, 1)

applyButton.MouseButton1Click:Connect(function()
    local id = crosshairInput.Text
    if id and id ~= "" then
        crosshairImage.Image = "rbxassetid://" .. id
    end
end)

-- Bouton Enlever le Crosshair
local removeButton = Instance.new("TextButton", CrosshairPage)
removeButton.Position = UDim2.new(0, 180, 0, 50)
removeButton.Size = UDim2.new(0, 140, 0, 30)
removeButton.Text = "❌ Enlever"
removeButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
removeButton.TextColor3 = Color3.new(1, 1, 1)

removeButton.MouseButton1Click:Connect(function()
    crosshairImage.Image = ""
end)

-- Suivre le centre de l'écran
game:GetService("RunService").RenderStepped:Connect(function()
    crosshairImage.Position = UDim2.new(0.5, -crosshairImage.Size.X.Offset/2, 0.5, -crosshairImage.Size.Y.Offset/2)
end)
