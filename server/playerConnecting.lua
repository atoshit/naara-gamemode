AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    local tempId = source

    log("info", "playerConnecting", playerName .. " is connecting [tempId: " .. tempId .. ", endpoint: " .. GetPlayerEndpoint(tempId) .. "]")
end)