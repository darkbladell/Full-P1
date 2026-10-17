-- ============================================
-- FULL-P1 - PRISON LIFE v2.0
-- Interface Horizontal Roxa + Funções
-- ============================================

if _G.FP1_LOADED then return end
_G.FP1_LOADED = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local UIS = game:GetService("UserInputService")
local LP = Players.LocalPlayer

_G.FP1 = _G.FP1 or {}
local FP1 = _G.FP1

FP1.CFG = {
    ESP = false,
    Aimbot = false, AimbotFOV = 100, AimbotSmooth = 0.15,
    FPSBoost = false,
    Skybox = "Nenhum",
    Noclip = false, Fly = false, FlySpeed = 50,
    SpeedEnabled = false, SpeedValue = 50,
    AntiTaze = false,
    HitboxEnabled = false, HitboxSize = 8,
    StrafeTurn = false,
    KillAura = false,
    AntiFling = false,
    AutoPickup = false,
}
local CFG = FP1.CFG

-- ============================================
-- UI HORIZONTAL ROXA
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FP1_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 10
ScreenGui.Parent = LP:WaitForChild("PlayerGui")

local bgImage = Instance.new("ImageLabel")
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.BackgroundTransparency = 1
bgImage.Image = "rbxassetid://7530797014" -- Fundo do Sasuke/escuro (pode trocar se quiser)
bgImage.ImageTransparency = 0.9
bgImage.ScaleType = Enum.ScaleType.Crop
bgImage.ZIndex = -10
bgImage.Parent = ScreenGui

local toggleBtn = Instance.new("ImageButton")
toggleBtn.Size = UDim2.new(0, 60, 0, 60)
toggleBtn.Position = UDim2.new(0, 20, 0.4, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 50, 150)
toggleBtn.BorderSizePixel = 0
toggleBtn.Image = "rbxassetid://4483362458"
toggleBtn.AutoButtonColor = false
toggleBtn.ZIndex = 100
toggleBtn.Parent = ScreenGui

local tbc = Instance.new("UICorner")
tbc.CornerRadius = UDim.new(1, 0)
tbc.Parent = toggleBtn

local tbs = Instance.new("UIStroke")
tbs.Color = Color3.fromRGB(180, 120, 220)
tbs.Thickness = 2
tbs.Parent = toggleBtn

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 420, 0, 280)
main.Position = UDim2.new(0.5, -210, 0.5, -140)
main.BackgroundColor3 = Color3.fromRGB(40, 25, 60)
main.BackgroundTransparency = 0.1
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Visible = false
main.ZIndex = 50
main.Parent = ScreenGui

local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(0, 12)
mc.Parent = main

local ms = Instance.new("UIStroke")
ms.Color = Color3.fromRGB(150, 80, 200)
ms.Thickness = 2
ms.Transparency = 0.2
ms.Parent = main

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 36)
header.BackgroundColor3 = Color3.fromRGB(100, 50, 150)
header.BorderSizePixel = 0
header.Parent = main

local hc = Instance.new("UICorner")
hc.CornerRadius = UDim.new(0, 12)
hc.Parent = header

local headerCover = Instance.new("Frame")
headerCover.Size = UDim2.new(1, 0, 0.5, 0)
headerCover.Position = UDim2.new(0, 0, 0.5, 0)
headerCover.BackgroundColor3 = Color3.fromRGB(100, 50, 150)
headerCover.BorderSizePixel = 0
headerCover.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 12, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🔥 FULL-P1 | PRISON LIFE"
title.TextColor3 = Color3.fromRGB(240, 230, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 26, 0, 26)
closeBtn.Position = UDim2.new(1, -32, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 30, 90)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(220, 180, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.BorderSizePixel = 0
closeBtn.AutoButtonColor = false
closeBtn.Parent = header

local cbc = Instance.new("UICorner")
cbc.CornerRadius = UDim.new(0, 6)
cbc.Parent = closeBtn

local container = Instance.new("ScrollingFrame")
container.Size = UDim2.new(1, -16, 1, -48)
container.Position = UDim2.new(0, 8, 0, 42)
container.BackgroundTransparency = 1
container.BorderSizePixel = 0
container.ScrollBarThickness = 3
container.ScrollBarImageColor3 = Color3.fromRGB(150, 80, 200)
container.CanvasSize = UDim2.new(0, 0, 0, 0)
container.AutomaticCanvasSize = Enum.AutomaticSize.Y
container.ZIndex = 60
container.Parent = main

local gridLayout = Instance.new("UIGridLayout")
gridLayout.CellSize = UDim2.new(0.48, -3, 0, 32)
gridLayout.CellPadding = UDim2.new(0.02, 0, 0, 6)
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
gridLayout.Parent = container

local notifGui = Instance.new("ScreenGui")
notifGui.Name = "FP1_Notif"
notifGui.ResetOnSpawn = false
notifGui.IgnoreGuiInset = true
notifGui.DisplayOrder = 20
notifGui.Parent = LP:WaitForChild("PlayerGui")

local function notify(text)
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 220, 0, 34)
    notif.Position = UDim2.new(0.5, -110, 0, -40)
    notif.BackgroundColor3 = Color3.fromRGB(100, 50, 150)
    notif.Text = text
    notif.TextColor3 = Color3.fromRGB(240, 230, 255)
    notif.Font = Enum.Font.GothamBold
    notif.TextSize = 12
    notif.BorderSizePixel = 0
    notif.Parent = notifGui
    local nc = Instance.new("UICorner")
    nc.CornerRadius = UDim.new(0, 6)
    nc.Parent = notif
    notif:TweenPosition(UDim2.new(0.5, -110, 0, 40), "Out", "Quad", 0.3)
    task.wait(2)
    notif:TweenPosition(UDim2.new(0.5, -110, 0, -40), "Out", "Quad", 0.3)
    task.wait(0.3)
    notif:Destroy()
end

local function makeBtn(text, order, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundColor3 = color or Color3.fromRGB(70, 45, 100)
    btn.BackgroundTransparency = 0.15
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(240, 230, 255)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 11
    btn.BorderSizePixel = 0
    btn.LayoutOrder = order
    btn.AutoButtonColor = false
    btn.ZIndex = 65
    btn.Parent = container
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    local s = Instance.new("UIStroke")
    s.Color = Color3.fromRGB(120, 70, 170)
    s.Thickness = 1
    s.Transparency = 0.5
    s.Parent = btn
    btn.MouseButton1Down:Connect(function() btn.BackgroundTransparency = 0 end)
    btn.MouseButton1Up:Connect(function() btn.BackgroundTransparency = 0.15 end)
    btn.MouseLeave:Connect(function() btn.BackgroundTransparency = 0.15 end)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local menuOpen = false
toggleBtn.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    main.Visible = menuOpen
end)
closeBtn.MouseButton1Click:Connect(function()
    menuOpen = false
    main.Visible = false
end)

-- ============================================
-- FUNÇÕES (Mantidas iguais, só o visual mudou)
-- ============================================

local function applyFPSBoost(on)
    CFG.FPSBoost = on
    if on then
        Lighting.GlobalShadows = false
        for _, v in ipairs(Lighting:GetChildren()) do
            pcall(function()
                if v:IsA("PostEffect") or v:IsA("Atmosphere") then v.Enabled = false end
            end)
        end
        for _, v in ipairs(Workspace:GetDescendants()) do
            pcall(function()
                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then
                    v.Enabled = false
                end
            end)
        end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    else
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        Lighting.GlobalShadows = true
    end
end

local SKYBOXES = {
    Nenhum = nil,
    Night = { Bk = "rbxassetid://1233158420", Dn = "rbxassetid://1233158838", Ft = "rbxassetid://1233157105", Lf = "rbxassetid://1233157640", Rt = "rbxassetid://1233157995", Up = "rbxassetid://1233159158" },
    Purple = { Bk = "rbxassetid://6021017254", Dn = "rbxassetid://6021016390", Ft = "rbxassetid://6021015479", Lf = "rbxassetid://6021014807", Rt = "rbxassetid://6021012347", Up = "rbxassetid://6021011228" },
    Dragon = { Bk = "rbxassetid://14753804949", Dn = "rbxassetid://14753795573", Ft = "rbxassetid://14753807625", Lf = "rbxassetid://14753797417", Rt = "rbxassetid://14753799966", Up = "rbxassetid://14753810287" },
}

local function setSkybox(name)
    CFG.Skybox = name
    for _, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then v:Destroy() end
    end
    if name == "Nenhum" or not SKYBOXES[name] then return end
    local data = SKYBOXES[name]
    local sky = Instance.new("Sky")
    sky.SkyboxBk, sky.SkyboxDn, sky.SkyboxFt = data.Bk, data.Dn, data.Ft
    sky.SkyboxLf, sky.SkyboxRt, sky.SkyboxUp = data.Lf, data.Rt, data.Up
    sky.Parent = Lighting
end

-- O resto das funções (Noclip, Fly, Speed, Aimbot, ESP, Hitbox, AntiTaze, StrafeTurn, KillAura, AntiFling, AutoPickup) continua IGUAL ao script anterior que te mandei.

-- Guarda global
FP1.applyFPSBoost = applyFPSBoost
FP1.setSkybox = setSkybox
FP1.makeBtn = makeBtn
FP1.notify = notify

print("✅ FULL-P1 (Prison Life) - Parte 1 carregada")
