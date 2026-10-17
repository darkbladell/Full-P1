-- ============================================
-- FULL-P1 - LOADER
-- ============================================
local BASE = "https://raw.githubusercontent.com/darkbladell/Full-P1/main/"

local function loadScript(nome, cache)
    local url = BASE .. nome .. "?v=" .. cache
    local ok, resultado = pcall(function() return game:HttpGet(url, true) end)
    if ok and resultado and #resultado > 100 then
        local success, err = pcall(function() loadstring(resultado)() end)
        if not success then warn("[FULL-P1] Erro no " .. nome .. ": " .. tostring(err)) end
    else
        warn("[FULL-P1] Falha ao baixar " .. nome)
    end
end

loadScript("Drive-P1.lua", "202")
task.wait(0.5) -- Espera a interface carregar
loadScript("Drive-P2.lua", "202")
