-- ============================================
-- FULL-P1 | DRIVE WORLD - PARTE 1 (Corrigida)
-- ============================================

if _G.FP1_LOADED then return end
_G.FP1_LOADED = true

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local LP = Players.LocalPlayer

_G.FP1 = _G.FP1 or {}
local FP1 = _G.FP1

FP1.CFG = {
    SavedCFrame = nil,
    Skybox = "Normal",
    Gravity = 196,
    Saturation = 0,
    Bloom = 0,
}
local CFG = FP1.CFG

-- ============================================
-- TELA DE LOADING
-- ============================================
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "FP1_Loading"
loadingGui.ResetOnSpawn = false
loadingGui.IgnoreGuiInset = true
loadingGui.DisplayOrder = 50
loadingGui.Parent = LP:WaitForChild("PlayerGui")

local lBg = Instance.new("Frame")
lBg.Size = UDim2.new(1, 0, 1, 0)
lBg.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
lBg.BorderSizePixel = 0
lBg.Parent = loadingGui

local lTitle = Instance.new("TextLabel")
lTitle.Size = UDim2.new(1, 0, 0, 60)
lTitle.Position = UDim2.new(0, 0, 0.4, -60)
lTitle.BackgroundTransparency = 1
lTitle.Text = "🚗 FULL-P1 | DRIVE WORLD"
lTitle.TextColor3 = Color3.fromRGB(255, 80, 80)
lTitle.Font = Enum.Font.GothamBold
lTitle.TextSize = 28
lTitle.Parent = lBg

local lBarBg = Instance.new("Frame")
lBarBg.Size = UDim2.new(0, 300, 0, 8)
lBarBg.Position = UDim2.new(0.5, -150, 0.5, 20)
lBarBg.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
lBarBg.BorderSizePixel = 0
lBarBg.Parent = lBg

local lBarC = Instance.new("UICorner")
lBarC.CornerRadius = UDim.new(1, 0)
lBarC.Parent = lBarBg

local lFill = Instance.new("Frame")
lFill.Size = UDim2.new(0, 0, 1, 0)
lFill.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
lFill.BorderSizePixel = 0
lFill.Parent = lBarBg

local lFillC = Instance.new("UICorner")
lFillC.CornerRadius = UDim.new(1, 0)
lFillC.Parent = lFill

local lPct = Instance.new("TextLabel")
lPct.Size = UDim2.new(1, 0, 0, 20)
lPct.Position = UDim2.new(0, 0, 0.5, 40)
lPct.BackgroundTransparency = 1
lPct.Text = "Carregando Drive World... 0%"
lPct.TextColor3 = Color3.fromRGB(200, 200, 210)
lPct.Font = Enum.Font.GothamMedium
lPct.TextSize = 12
lPct.Parent = lBg

task.spawn(function()
    for i = 1, 100 do
        lFill.Size = UDim2.new(i / 100, 0, 1, 0)
        lPct.Text = "Carregando Drive World... " .. i .. "%"
        task.wait(0.015)
    end
    task.wait(0.3)
    local fade = TweenService:Create(lBg, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 })
    local fadeTitle = TweenService:Create(lTitle, TweenInfo.new(0.4), {TextTransparency = 1})
    local fadeBar = TweenService:Create(lBarBg, TweenInfo.new(0.4), {BackgroundTransparency = 1})
    local fadePct = TweenService:Create(lPct, TweenInfo.new(0.4), {TextTransparency = 1})
    fade:Play(); fadeTitle:Play(); fadeBar:Play(); fadePct:Play()
    task.wait(0.5)
    loadingGui:Destroy()
end)

-- ============================================
-- UI PRINCIPAL
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FP1_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 10
ScreenGui.Parent = LP:WaitForChild("PlayerGui")

local toggleBtn = Instance.new("ImageButton")
toggleBtn.Size = UDim2.new(0, 55, 0, 55)
toggleBtn.Position = UDim2.new(0, 20, 0.4, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
toggleBtn.BorderSizePixel = 0
toggleBtn.Image = "rbxassetid://4483362458"
toggleBtn.AutoButtonColor = false
toggleBtn.ZIndex = 100
toggleBtn.Parent = ScreenGui

local tbc = Instance.new("UICorner")
tbc.CornerRadius = UDim.new(1, 0)
tbc.Parent = toggleBtn

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 500, 0, 250)
main.Position = UDim2.new(0.5, -250, 0.5, -125)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Visible = false
main.ZIndex = 50
main.ClipsDescendants = true
main.Parent = ScreenGui

local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(0, 10)
mc.Parent = main

local ms = Instance.new("UIStroke")
ms.Color = Color3.fromRGB(255, 80, 80)
ms.Thickness = 2
ms.Parent = main

-- 🔑 IMAGEM DE FUNDO: Forçada pro fundo e bem transparente
local bgImage = Instance.new("ImageLabel")
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.BackgroundTransparency = 1
bgImage.Image = "rbxassetid://106757687330670"
bgImage.ImageTransparency = 0.85 -- Deixa a imagem quase invisível pra não cobrir os botões
bgImage.ScaleType = Enum.ScaleType.Stretch
bgImage.ZIndex = 0 -- Fica lá atrás de tudo
bgImage.Parent = main

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 36)
header.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
header.BackgroundTransparency = 0.1
header.BorderSizePixel = 0
header.ZIndex = 10
header.Parent = main

local hc = Instance.new("UICorner")
hc.CornerRadius = UDim.new(0, 10)
hc.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 12, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🚗 FULL-P1 | DRIVE WORLD"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 11
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 26, 0, 26)
closeBtn.Position = UDim2.new(1, -32, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 180, 180)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.BorderSizePixel = 0
closeBtn.AutoButtonColor = false
closeBtn.ZIndex = 11
closeBtn.Parent = header

local cbc = Instance.new("UICorner")
cbc.CornerRadius = UDim.new(0, 6)
cbc.Parent = closeBtn

-- 🔑 CONTAINER DOS BOTÕES: Forçado pra frente
local container = Instance.new("ScrollingFrame")
container.Size = UDim2.new(1, -16, 1, -48)
container.Position = UDim2.new(0, 8, 0, 42)
container.BackgroundTransparency = 1
container.BorderSizePixel = 0
container.ScrollBarThickness = 2
container.ScrollBarImageColor3 = Color3.fromRGB(255, 80, 80)
container.CanvasSize = UDim2.new(0, 0, 0, 0)
container.AutomaticCanvasSize = Enum.AutomaticSize.Y
container.ZIndex = 20 -- Fica na frente da imagem de fundo
container.Parent = main

local gridLayout = Instance.new("UIGridLayout")
gridLayout.CellSize = UDim2.new(0.48, -3, 0, 34)
gridLayout.CellPadding = UDim2.new(0.04, 0, 0, 6)
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
gridLayout.Parent = container

local function notify(text)
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 200, 0, 34)
    notif.Position = UDim2.new(0.5, -100, 0, -40)
    notif.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
    notif.Text = text
    notif.TextColor3 = Color3.fromRGB(255, 255, 255)
    notif.Font = Enum.Font.GothamBold
    notif.TextSize = 12
    notif.BorderSizePixel = 0
    notif.ZIndex = 200
    notif.Parent = ScreenGui
    local nc = Instance.new("UICorner")
    nc.CornerRadius = UDim.new(0, 6)
    nc.Parent = notif
    notif:TweenPosition(UDim2.new(0.5, -100, 0, 40), "Out", "Quad", 0.3)
    task.wait(2)
    notif:TweenPosition(UDim2.new(0.5, -100, 0, -40), "Out", "Quad", 0.3)
    task.wait(0.3)
    notif:Destroy()
end

local function makeBtn(text, order, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(60, 30, 30)
    btn.BackgroundTransparency = 0.2
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(240, 240, 245)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 11
    btn.BorderSizePixel = 0
    btn.LayoutOrder = order
    btn.AutoButtonColor = false
    btn.ZIndex = 21 -- Botão na frente
    btn.Parent = container
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    local s = Instance.new("UIStroke")
    s.Color = Color3.fromRGB(255, 100, 100)
    s.Thickness = 1
    s.Transparency = 0.5
    s.Parent = btn
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

FP1.CFG = CFG
FP1.makeBtn = makeBtn
FP1.notify = notify
FP1.main = main

print("✅ FULL-P1 | Parte 1 carregada")
