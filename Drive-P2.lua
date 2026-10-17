-- ============================================
-- FULL-P1 | DRIVE WORLD - P2 (Funções)
-- ============================================
local FP1 = _G.FP1
if not FP1 then return end

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local LP = Players.LocalPlayer
local CFG = FP1.CFG
local makeBtn = FP1.makeBtn

local function notify(text)
    local n = Instance.new("TextLabel")
    n.Size = UDim2.new(0, 200, 0, 34)
    n.Position = UDim2.new(0.5, -100, 0, -40)
    n.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
    n.Text = text
    n.TextColor3 = Color3.fromRGB(255, 255, 255)
    n.Font = Enum.Font.GothamBold
    n.TextSize = 12
    n.ZIndex = 200
    n.Parent = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("FP1_UI")
    local nc = Instance.new("UICorner")
    nc.CornerRadius = UDim.new(0, 6)
    nc.Parent = n
    n:TweenPosition(UDim2.new(0.5, -100, 0, 40), "Out", "Quad", 0.3)
    task.wait(2)
    n:TweenPosition(UDim2.new(0.5, -100, 0, -40), "Out", "Quad", 0.3)
    task.wait(0.3)
    n:Destroy()
end

local function savePosition()
    local char = LP.Character
    if not char then return end
    local seat = char:FindFirstChildOfClass("Humanoid") and char.Humanoid.SeatPart
    local target = seat and seat.Parent and seat.Parent.PrimaryPart or char:FindFirstChild("HumanoidRootPart")
    if target then
        CFG.SavedCFrame = target.CFrame
        notify("Posição salva!")
    end
end

local function teleportToSaved()
    if not CFG.SavedCFrame then return notify("Salve uma posição!") end
    local char = LP.Character
    if not char then return end
    local seat = char:FindFirstChildOfClass("Humanoid") and char.Humanoid.SeatPart
    local target = seat and seat.Parent and seat.Parent.PrimaryPart or char:FindFirstChild("HumanoidRootPart")
    if target then
        target.CFrame = CFG.SavedCFrame + Vector3.new(0, 5, 0)
        notify("Teleportado!")
    end
end

makeBtn("📍 Salvar Posição", 1, savePosition)
makeBtn("🚀 Teleportar", 2, teleportToSaved)
makeBtn("🌍 Gravidade Normal", 3, function() Workspace.Gravity = 196; notify("Gravidade: 196") end)
makeBtn("🌙 Gravidade Baixa", 4, function() Workspace.Gravity = 50; notify("Gravidade: 50") end)
makeBtn("🌑 Gravidade Lunar", 5, function() Workspace.Gravity = 20; notify("Gravidade: 20") end)
makeBtn("❌ Fechar Menu", 6, function() FP1.main.Visible = false end)

notify("Full-P1 Carregado!")
print("✅ Parte 2 carregada")
