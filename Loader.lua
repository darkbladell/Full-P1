-- ============================================
-- FULL P1 - LOADER
-- ============================================

local URL = "https://raw.githubusercontent.com/darkbladell/the-parralax/main/Full-P1.lua"

print("[FP1] Carregando script...")

local sucesso, resultado = pcall(function()
    return game:HttpGet(URL, true)
end)

if sucesso and resultado and #resultado > 100 then
    local ok, err = pcall(function()
        loadstring(resultado)()
    end)
    if ok then
        print("[FP1] ✅ Full P1 carregado")
    else
        warn("[FP1] ❌ Erro ao executar: " .. tostring(err))
    end
else
    warn("[FP1] ❌ Falha ao baixar o script")
end
