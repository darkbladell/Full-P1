-- ============================================
-- FULL-P1 - LOADER (Drive World)
-- ============================================

local URL = "https://raw.githubusercontent.com/darkbladell/the-parralax/main/Full-P1.lua"

print("[FULL-P1] Carregando script...")

local sucesso, resultado = pcall(function()
    return game:HttpGet(URL, true)
end)

if sucesso and resultado and #resultado > 100 then
    local ok, err = pcall(function()
        loadstring(resultado)()
    end)
    if ok then
        print("[FULL-P1] ✅ Script carregado com sucesso")
    else
        warn("[FULL-P1] ❌ Erro ao executar: " .. tostring(err))
    end
else
    warn("[FULL-P1] ❌ Falha ao baixar o script. Verifique se o repositório está público.")
end
