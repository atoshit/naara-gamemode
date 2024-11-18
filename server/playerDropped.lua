AddEventHandler("playerDropped", function(reason)
    log("info", "playerDropped", (GetPlayerName(source) or "Unknown") .. " has left the server [reason: " .. (reason or "Unknown") .. ", endpoint: " .. (GetPlayerEndpoint(source) or "Unknown") .. ", id: " .. (source or "Unknown") .. ", guid: " .. (GetPlayerGuid(source) or "Unknown") .. ", license: " .. (GetPlayerIdentifierByType(source, "license") or "Unknown") .. ", fivem: " .. (GetPlayerIdentifierByType(source, "fivem") or "Unknown") .. ", discord: " .. (GetPlayerIdentifierByType(source, "discord") or "Unknown") .. ", steam: " .. (GetPlayerIdentifierByType(source, "steam") or "Unknown") .. ", tokens: " .. (json.encode(GetPlayerTokens(source)) or "Unknown") .. "]")

    if GetConvar("naara:webhook:playerDropped", "") ~= "" then
        discordLog(GetConvar("naara:webhook:playerDropped", ""), {
            title = "Player Dropped",
            message = 
                'Player Name ```' .. (GetPlayerName(source) or "Unknown") ..'```\n'..
                'ID ```' .. (source or "Unknown") ..'```\n'..
                'Ping ```' .. (GetPlayerPing(source) or "Unknown") ..'```\n'..
                'Guid ```' .. (GetPlayerGuid(source) or "Unknown") ..'```\n'..
                'License ```' .. (GetPlayerIdentifierByType(source, "license") or "Unknown") ..'```\n'..
                'FiveM ID ```' .. (GetPlayerIdentifierByType(source, "fivem") or "Unknown") ..'```\n'..
                'Discord ID ```' .. (GetPlayerIdentifierByType(source, "discord") or "Unknown") ..'```\n'..
                'Steam ID ```' .. (GetPlayerIdentifierByType(source, "steam") or "Unknown") ..'```\n'..
                'Tokens ```' .. (json.encode(GetPlayerTokens(source)) or "Unknown") ..'```\n'..
                'Endpoint ```' .. (GetPlayerEndpoint(source) or "Unknown") ..'```\n',
            color = 16753920,
            footer = "made by Atoshi",
            image = GetConvar("naara:serverIcon", "")
        })
    end
end)