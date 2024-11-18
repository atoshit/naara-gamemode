AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    local tempId = source

    log("info", "playerConnecting", (playerName or "Unknown") .. " is connecting [tempId: " .. (tempId or "Unknown") .. ", endpoint: " .. (GetPlayerEndpoint(tempId) or "Unknown") .. ", guid: " .. (GetPlayerGuid(tempId) or "Unknown") .. ", license: " .. (GetPlayerIdentifierByType(tempId, "license") or "Unknown") .. ", fivem: " .. (GetPlayerIdentifierByType(tempId, "fivem") or "Unknown") .. ", discord: " .. (GetPlayerIdentifierByType(tempId, "discord") or "Unknown") .. ", steam: " .. (GetPlayerIdentifierByType(tempId, "steam") or "Unknown") .. ", tokens: " .. (json.encode(GetPlayerTokens(tempId)) or "Unknown") .. "]")
    
    if GetConvar("naara:webhook:playerConnecting", "") ~= "" then   
        discordLog(GetConvar("naara:webhook:playerConnecting", ""), {
            title = "Player Connecting",
            message = 
                'Player Name ```' .. (playerName or "Unknown") ..'```\n'..
                'Temp ID ```' .. (tempId or "Unknown") ..'```\n'..
                'Ping ```' .. (GetPlayerPing(tempId) or "Unknown") ..'```\n'..
                'Guid ```' .. (GetPlayerGuid(tempId) or "Unknown") ..'```\n'..
                'License ```' .. (GetPlayerIdentifierByType(tempId, "license") or "Unknown") ..'```\n'..
                'FiveM ID ```' .. (GetPlayerIdentifierByType(tempId, "fivem") or "Unknown") ..'```\n'..
                'Discord ID ```' .. (GetPlayerIdentifierByType(tempId, "discord") or "Unknown") ..'```\n'..
                'Steam ID ```' .. (GetPlayerIdentifierByType(tempId, "steam") or "Unknown") ..'```\n'..
                'Tokens ```' .. (json.encode(GetPlayerTokens(tempId)) or "Unknown") ..'```\n'..
                'Endpoint ```' .. (GetPlayerEndpoint(tempId) or "Unknown") ..'```\n',
            color = 16753920,
            footer = "made by Atoshi",
            image = GetConvar("naara:serverIcon", "")
        })
    end
end)