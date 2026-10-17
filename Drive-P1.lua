-- ============================================
-- FULL-P1 | DRIVE WORLD - P1 (UI)
-- ============================================
if _G.FP1_LOADED then return end
_G.FP1_LOADED = true

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
_G.FP1 = _G.FP1 or {}
local FP1 = _G.FP1

FP1.CFG = { SavedCFrame = nil }

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FP1_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = LP:WaitForChild("PlayerGui")

-- Botão flutuante
local toggleBtn = Instance.new("ImageButton")
toggleBtn.Size = UDim2.new(0, 55, 0, 55)
toggleBtn.Position = UDim2.new(0, 20, 0.4, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
toggleBtn.Image = "rbxassetid://4483362458"
toggleBtn.Parent = ScreenGui
local tbc = Instance.new("UICorner")
tbc.CornerRadius = UDim.new(1, 0)
tbc.Parent = toggleBtn

-- Painel Principal
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 500, 0, 250)
main.Position = UDim2.new(0.5, -250, 0.5, -125)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Visible = false
main.ClipsDescendants = true
main.Parent = ScreenGui
local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(0, 10)
mc.Parent = main
local ms = Instance.new("UIStroke")
ms.Color = Color3.fromRGB(255, 80, 80)
ms.Thickness = 2
ms.Parent = main

-- Fundo PNG
local bgImage = Instance.new("ImageLabel")
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.BackgroundTransparency = 1
bgImage.Image = "rbxassetid://106757687330670"
bgImage.ImageTransparency = 0.8
bgImage.ScaleType = Enum.ScaleType.Stretch
bgImage.ZIndex = 0
bgImage.Parent = main

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 36)
header.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
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
closeBtn.ZIndex = 11
closeBtn.Parent = header

-- Container
local container = Instance.new("ScrollingFrame")
container.Size = UDim2.new(1, -16, 1, -48)
container.Position = UDim2.new(0, 8, 0, 42)
container.BackgroundTransparency = 1
container.ScrollBarThickness = 2
container.AutomaticCanvasSize = Enum.AutomaticSize.Y
container.ZIndex = 20
container.Parent = main

local gridLayout = Instance.new("UIGridLayout")
gridLayout.CellSize = UDim2.new(0.48, -3, 0, 34)
gridLayout.CellPadding = UDim2.new(0.04, 0, 0, 6)
gridLayout.Parent = container

-- Funções Globais
local menuOpen = false
toggleBtn.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    main.Visible = menuOpen
end)
closeBtn.MouseButton1Click:Connect(function()
    menuOpen = false
    main.Visible = false
end)

FP1.makeBtn = function(text, order, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(60, 30, 30)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(240, 240, 245)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 11
    btn.LayoutOrder = order
    btn.ZIndex = 21
    btn.Parent = container
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    btn.MouseButton1Click:Connect(callback)
    return btn
end

FP1.main = main
print("✅ Parte 1 (UI) carregada")
