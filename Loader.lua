-- ============================================
-- LOADER EXCLUSIVO: FULL-P1 | DRIVE WORLD
-- ============================================

-- O "?v=999" no final força o executor a baixar a versão mais nova e ignorar o cache antigo
local URL = "https://raw.githubusercontent.com/darkbladell/Full-P1/main/Drive-Full.lua?v=999"

print("[FULL-P1] Carregando Drive World...")

local sucesso, resultado = pcall(function()
    return game:HttpGet(URL, true)
end)

if sucesso and resultado and #resultado > 100 then
    -- Verifica se o código baixado é realmente do Drive World (procura a palavra DRIVE WORLD no texto)
    if string.find(resultado, "DRIVE WORLD") then
        local ok, err = pcall(function()
            loadstring(resultado)()
        end)
        if ok then
            print("[FULL-P1] ✅ Drive World carregado com sucesso")
        else
            warn("[FULL-P1] ❌ Erro ao executar o script: " .. tostring(err))
        end
    else
        warn("[FULL-P1] ❌ ERRO CRÍTICO: O arquivo baixado não é o Drive World!")
        warn("[FULL-P1] Verifique se você colou o código certo no arquivo Drive-Full.lua no GitHub.")
    end
else
    warn("[FULL-P1] ❌ Falha ao baixar. O arquivo Drive-Full.lua existe no seu GitHub?")
end
