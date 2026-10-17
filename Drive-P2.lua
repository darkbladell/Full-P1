-- ============================================
-- FULL-P1 | DRIVE WORLD - PARTE 2
-- Botões e Funções
-- ============================================

local FP1 = _G.FP1
if not FP1 then return end

local CFG = FP1.CFG
local makeBtn = FP1.makeBtn
local notify = FP1.notify

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local LP = Players.LocalPlayer

-- ============================================
-- FUNÇÕES
-- ============================================
local function savePosition()
    local char = LP.Character
    if not char then return end
    local seat = char:FindFirstChildOfClass("Humanoid") and char.Humanoid.SeatPart
    local target = seat and seat.Parent and seat.Parent.PrimaryPart or char:FindFirstChild("HumanoidRootPart")
    if target then
        CFG.SavedCFrame = target.CFrame
        notify("Posição salva!")
    else
        notify("Não achei o carro/player")
    end
end

local function teleportToSaved()
    if not CFG.SavedCFrame then
        notify("Salve uma posição primeiro!")
        return
    end
    local char = LP.Character
    if not char then return end
    local seat = char:FindFirstChildOfClass("Humanoid") and char.Humanoid.SeatPart
    local target = seat and seat.Parent and seat.Parent.PrimaryPart or char:FindFirstChild("HumanoidRootPart")
    if target then
        target.CFrame = CFG.SavedCFrame + Vector3.new(0, 5, 0)
        notify("Teleportado!")
    else
        notify("Não achei o carro/player")
    end
end

local SKYBOXES = {
    Normal = nil,
    Night = { Bk = "rbxassetid://1233158420", Dn = "rbxassetid://1233158838", Ft = "rbxassetid://1233157105", Lf = "rbxassetid://1233157640", Rt = "rbxassetid://1233157995", Up = "rbxassetid://1233159158" },
    Purple = { Bk = "rbxassetid://6021017254", Dn = "rbxassetid://6021016390", Ft = "rbxassetid://6021015479", Lf = "rbxassetid://6021014807", Rt = "rbxassetid://6021012347", Up = "rbxassetid://6021011228" },
}

local function setSkybox(name)
    CFG.Skybox = name
    for _, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then v:Destroy() end
    end
    if name == "Normal" or not SKYBOXES[name] then return end
    local data = SKYBOXES[name]
    local sky = Instance.new("Sky")
    sky.SkyboxBk, sky.SkyboxDn, sky.SkyboxFt = data.Bk, data.Dn, data.Ft
    sky.SkyboxLf, sky.SkyboxRt, sky.SkyboxUp = data.Lf, data.Rt, data.Up
    sky.Parent = Lighting
end

local function setGravity(value)
    Workspace.Gravity = value
    CFG.Gravity = value
end

local ccEffect = nil
local bloomEffect = nil

local function updateShaders()
    if not ccEffect then
        ccEffect = Instance.new("ColorCorrectionEffect")
        ccEffect.Parent = Lighting
    end
    if not bloomEffect then
        bloomEffect = Instance.new("BloomEffect")
        bloomEffect.Threshold = 0.8
        bloomEffect.Intensity = 0.5
        bloomEffect.Size = 24
        bloomEffect.Parent = Lighting
    end
    ccEffect.Saturation = CFG.Saturation
    bloomEffect.Intensity = CFG.Bloom
end

-- ============================================
-- BOTÕES DO MENU
-- ============================================
makeBtn("📍 Salvar Posição", 1, savePosition)
makeBtn("🚀 Teleportar", 2, teleportToSaved)

makeBtn("🌌 Skybox: Normal", 3, function() setSkybox("Normal"); notify("Sky: Normal") end)
makeBtn("🌌 Skybox: Night", 4, function() setSkybox("Night"); notify("Sky: Night") end)
makeBtn("🌌 Skybox: Purple", 5, function() setSkybox("Purple"); notify("Sky: Purple") end)

makeBtn("✨ Ativar Shaders", 6, function()
    CFG.Saturation = 0.4
    CFG.Bloom = 1
    updateShaders()
    notify("Shaders ON")
end)
makeBtn("❌ Desativar Shaders", 7, function()
    CFG.Saturation = 0
    CFG.Bloom = 0
    updateShaders()
    notify("Shaders OFF")
end)

-- Correção: Procurar a ScrollingFrame de forma segura
local container = nil
for _, child in ipairs(FP1.main:GetChildren()) do
    if child:IsA("ScrollingFrame") then
        container = child
        break
    end
end

if container then
    local gravLabel = Instance.new("TextLabel")
    gravLabel.Size = UDim2.new(0.48, -3, 0, 20)
    gravLabel.BackgroundTransparency = 1
    gravLabel.Text = "Gravidade: 196"
    gravLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    gravLabel.Font = Enum.Font.GothamBold
    gravLabel.TextSize = 11
    gravLabel.LayoutOrder = 8
    gravLabel.ZIndex = 6
    gravLabel.Parent = container
end

makeBtn("🌍 Gravidade Normal", 9, function()
    setGravity(196)
    notify("Gravidade: Normal")
end)
makeBtn("🌙 Gravidade Baixa", 10, function()
    setGravity(50)
    notify("Gravidade: Baixa")
end)
makeBtn("🌑 Gravidade Lunar", 11, function()
    setGravity(20)
    notify("Gravidade: Lunar")
end)

makeBtn("🔄 Resetar Tudo", 12, function()
    setSkybox("Normal")
    setGravity(196)
    CFG.Saturation = 0
    CFG.Bloom = 0
    updateShaders()
    notify("Tudo resetado")
end)

makeBtn("❌ Fechar Menu", 13, function()
    FP1.main.Visible = false
end)

notify("Full-P1 | Drive World carregado!")
print("✅ FULL-P1 | Drive World (Parte 2) carregado com sucesso")
