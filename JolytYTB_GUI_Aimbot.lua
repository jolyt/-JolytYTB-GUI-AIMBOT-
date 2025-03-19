-- Variables et Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- States
local aimEnabled = false
local espEnabled = false
local noclipEnabled = false
local clickTPEnabled = false
local flyEnabled = false
local menuVisible = true
local fov = 100
local walkspeed = 16
local aimPart = "Head"

-- FLY CONTROL
local FlyVelocity = Vector3.new(0,0,0)
local FlySpeed = 100
local FlyKeys = {Forward=false,Back=false,Left=false,Right=false,Up=false,Down=false}

-- KEY SYSTEM
local function createKeySystem()
    local screenGui = Instance.new("ScreenGui", game.CoreGui)
    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 400, 0, 200)
    frame.Position = UDim2.new(0.5, -200, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.Active = true
    frame.Draggable = true

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Text = "🔐 JolytYTB HUB Key System"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 22
    title.BackgroundTransparency = 1

    local textbox = Instance.new("TextBox", frame)
    textbox.PlaceholderText = "Enter Key (hint: hubjolyt)"
    textbox.Size = UDim2.new(0, 350, 0, 40)
    textbox.Position = UDim2.new(0.5, -175, 0.5, -20)
    textbox.Text = ""
    textbox.Font = Enum.Font.Gotham
    textbox.TextColor3 = Color3.new(1, 1, 1)
    textbox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    local confirm = Instance.new("TextButton", frame)
    confirm.Text = "✅ Confirm"
    confirm.Size = UDim2.new(0, 200, 0, 40)
    confirm.Position = UDim2.new(0.5, -100, 1, -50)
    confirm.TextColor3 = Color3.new(1, 1, 1)
    confirm.BackgroundColor3 = Color3.fromRGB(0, 170, 0)

    confirm.MouseButton1Click:Connect(function()
        if textbox.Text == "hubjolyt" then
            screenGui:Destroy()
            createMainGUI()
        else
            confirm.Text = "❌ Incorrect Key"
            confirm.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
        end
    end)
end

-- MAIN GUI
function createMainGUI()
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 450, 0, 400)
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
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 20
    Title.BackgroundTransparency = 1

    local TabButtons = Instance.new("Frame", MainFrame)
    TabButtons.Size = UDim2.new(1, 0, 0, 30)
    TabButtons.Position = UDim2.new(0, 0, 0, 40)
    TabButtons.BackgroundTransparency = 1

    -- Tab Buttons
    local AimbotBtn = Instance.new("TextButton", TabButtons)
    AimbotBtn.Size = UDim2.new(0, 150, 1, 0)
    AimbotBtn.Text = "🎯 Aimbot"
    AimbotBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
    AimbotBtn.TextColor3 = Color3.new(1, 1, 1)

    local MiscBtn = Instance.new("TextButton", TabButtons)
    MiscBtn.Size = UDim2.new(0, 150, 1, 0)
    MiscBtn.Position = UDim2.new(0, 150, 0, 0)
    MiscBtn.Text = "⚙️ Misc"
    MiscBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
    MiscBtn.TextColor3 = Color3.new(1, 1, 1)

    -- Pages
    local AimbotPage = Instance.new("Frame", MainFrame)
    AimbotPage.Size = UDim2.new(1, 0, 1, -70)
    AimbotPage.Position = UDim2.new(0, 0, 0, 70)
    AimbotPage.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    AimbotPage.Visible = true

    local MiscPage = AimbotPage:Clone()
    MiscPage.Parent = MainFrame
    MiscPage.Visible = false

    -- Tab Functions
    AimbotBtn.MouseButton1Click:Connect(function()
        AimbotPage.Visible = true
        MiscPage.Visible = false
    end)

    MiscBtn.MouseButton1Click:Connect(function()
        AimbotPage.Visible = false
        MiscPage.Visible = true
    end)

    -- AIMBOT PAGE
    local ToggleAimbot = Instance.new("TextButton", AimbotPage)
    ToggleAimbot.Position = UDim2.new(0, 20, 0, 10)
    ToggleAimbot.Size = UDim2.new(0, 200, 0, 30)
    ToggleAimbot.Text = "🎯 Aimbot OFF"
    ToggleAimbot.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    ToggleAimbot.TextColor3 = Color3.new(1, 1, 1)

    ToggleAimbot.MouseButton1Click:Connect(function()
        aimEnabled = not aimEnabled
        ToggleAimbot.Text = aimEnabled and "🎯 Aimbot ON" or "🎯 Aimbot OFF"
    end)

    local FovLabel = Instance.new("TextLabel", AimbotPage)
    FovLabel.Position = UDim2.new(0, 20, 0, 50)
    FovLabel.Size = UDim2.new(0, 200, 0, 30)
    FovLabel.Text = "📏 FOV : " .. fov
    FovLabel.TextColor3 = Color3.new(1, 1, 1)
    FovLabel.BackgroundTransparency = 1

    local IncreaseFov = Instance.new("TextButton", AimbotPage)
    IncreaseFov.Position = UDim2.new(0, 20, 0, 90)
    IncreaseFov.Size = UDim2.new(0, 90, 0, 30)
    IncreaseFov.Text = "➕"
    IncreaseFov.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    IncreaseFov.TextColor3 = Color3.new(1, 1, 1)

    IncreaseFov.MouseButton1Click:Connect(function()
        fov = fov + 10
        FovLabel.Text = "📏 FOV : " .. fov
    end)

    local DecreaseFov = Instance.new("TextButton", AimbotPage)
    DecreaseFov.Position = UDim2.new(0, 130, 0, 90)
    DecreaseFov.Size = UDim2.new(0, 90, 0, 30)
    DecreaseFov.Text = "➖"
    DecreaseFov.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    DecreaseFov.TextColor3 = Color3.new(1, 1, 1)

    DecreaseFov.MouseButton1Click:Connect(function()
        fov = math.max(10, fov - 10)
        FovLabel.Text = "📏 FOV : " .. fov
    end)

    -- MISC PAGE
    local FlyBtn = Instance.new("TextButton", MiscPage)
    FlyBtn.Position = UDim2.new(0, 20, 0, 10)
    FlyBtn.Size = UDim2.new(0, 200, 0, 30)
    FlyBtn.Text = "🕊️ Fly OFF"
    FlyBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    FlyBtn.TextColor3 = Color3.new(1, 1, 1)

    FlyBtn.MouseButton1Click:Connect(function()
        flyEnabled = not flyEnabled
        FlyBtn.Text = flyEnabled and "🕊️ Fly ON" or "🕊️ Fly OFF"
    end)

    -- Noclip & ClickTP stays same, à toi d'ajouter si tu veux :)
end

--== AIMBOT FUNCTION ==
local function getClosestPlayer()
    local closest, shortest = nil, math.huge
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

RunService.RenderStepped:Connect(function()
    if aimEnabled then
        local target = getClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild(aimPart) then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character[aimPart].Position)
        end
    end

    -- Fly Logic
    if flyEnabled then
        local move = Vector3.new(
            (FlyKeys.Right and 1 or 0) - (FlyKeys.Left and 1 or 0),
            (FlyKeys.Up and 1 or 0) - (FlyKeys.Down and 1 or 0),
            (FlyKeys.Back and 1 or 0) - (FlyKeys.Forward and 1 or 0)
        )
        LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Velocity = Camera.CFrame:VectorToWorldSpace(move) * FlySpeed
    end
end)

UserInputService.InputBegan:Connect(function(input)
    local key = input.KeyCode
    if flyEnabled then
        if key == Enum.KeyCode.W then FlyKeys.Forward = true end
        if key == Enum.KeyCode.S then FlyKeys.Back = true end
        if key == Enum.KeyCode.A then FlyKeys.Left = true end
        if key == Enum.KeyCode.D then FlyKeys.Right = true end
        if key == Enum.KeyCode.Space then FlyKeys.Up = true end
        if key == Enum.KeyCode.LeftShift then FlyKeys.Down = true end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    local key = input.KeyCode
    if flyEnabled then
        if key == Enum.KeyCode.W then FlyKeys.Forward = false end
        if key == Enum.KeyCode.S then FlyKeys.Back = false end
        if key == Enum.KeyCode.A then FlyKeys.Left = false end
        if key == Enum.KeyCode.D then FlyKeys.Right = false end
        if key == Enum.KeyCode.Space then FlyKeys.Up = false end
        if key == Enum.KeyCode.LeftShift then FlyKeys.Down = false end
    end
end)

--== FOV CIRCLE ==
local FovCircle = Drawing.new("Circle")
FovCircle.Color = Color3.fromRGB(255, 0, 0)
FovCircle.Thickness = 2
FovCircle.NumSides = 100
FovCircle.Filled = false

RunService.RenderStepped:Connect(function()
    FovCircle.Position = UserInputService:GetMouseLocation()
    FovCircle.Radius = fov
    FovCircle.Visible = true
end)

--== START ==--
createKeySystem()
