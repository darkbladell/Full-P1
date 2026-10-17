-- ============================================
-- FULL-P1 - LOADER EXCLUSIVO DRIVE WORLD
-- ============================================

-- Link direto para o arquivo do Drive World
local URL = "https://raw.githubusercontent.com/darkbladell/Full-P1/main/Full-P1.lua"

print("[FULL-P1] Iniciando carregamento do Drive World...")

-- Faz o download do script
local sucesso, resultado = pcall(function()
    return game:HttpGet(URL, true)
end)

-- Verifica se o download funcionou e se o código é válido
if sucesso and resultado and #resultado > 100 then
    -- Executa o script baixado
    local ok, err = pcall(function()
        loadstring(resultado)()
    end)
    
    if ok then
        print("[FULL-P1] ✅ Drive World carregado com sucesso")
    else
        warn("[FULL-P1] ❌ Erro ao executar o Drive World: " .. tostring(err))
    end
else
    warn("[FULL-P1] ❌ Falha ao baixar o script. Verifique se o repositório está público e o nome do arquivo está correto.")
end
