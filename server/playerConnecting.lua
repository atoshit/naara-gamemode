local _GetPlayerIdentifierByType <const> = GetPlayerIdentifierByType
local _GetConvar <const> = GetConvar

AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    local tempId = source

    log("info", "playerConnecting", (playerName or "Unknown") .. " is connecting [tempId: " .. (tempId or "Unknown") .. ", endpoint: " .. (GetPlayerEndpoint(tempId) or "Unknown") .. ", guid: " .. (GetPlayerGuid(tempId) or "Unknown") .. ", license: " .. (_GetPlayerIdentifierByType(tempId, "license") or "Unknown") .. ", fivem: " .. (_GetPlayerIdentifierByType(tempId, "fivem") or "Unknown") .. ", discord: " .. (_GetPlayerIdentifierByType(tempId, "discord") or "Unknown") .. ", steam: " .. (_GetPlayerIdentifierByType(tempId, "steam") or "Unknown") .. ", tokens: " .. (json.encode(GetPlayerTokens(tempId)) or "Unknown") .. "]")
    
    if _GetConvar("naara:webhook:playerConnecting", "") ~= "" then   
        discordLog(_GetConvar("naara:webhook:playerConnecting", ""), {
            title = "Player Connecting",
            message = 
                'Player Name ```' .. (playerName or "Unknown") ..'```\n'..
                'Temp ID ```' .. (tempId or "Unknown") ..'```\n'..
                'Guid ```' .. (GetPlayerGuid(tempId) or "Unknown") ..'```\n'..
                'License ```' .. (_GetPlayerIdentifierByType(tempId, "license") or "Unknown") ..'```\n'..
                'FiveM ID ```' .. (_GetPlayerIdentifierByType(tempId, "fivem") or "Unknown") ..'```\n'..
                'Discord ID ```' .. (_GetPlayerIdentifierByType(tempId, "discord") or "Unknown") ..'```\n'..
                'Steam ID ```' .. (_GetPlayerIdentifierByType(tempId, "steam") or "Unknown") ..'```\n'..
                'Tokens ```' .. (json.encode(GetPlayerTokens(tempId)) or "Unknown") ..'```\n'..
                'Endpoint ```' .. (GetPlayerEndpoint(tempId) or "Unknown") ..'```\n',
            color = 16753920,
            footer = "made by Atoshi",
            image = _GetConvar("naara:serverIcon", "")
        })
    end

    deferrals.defer()

    Wait(50)

    openHomeCard(tempId, deferrals)
end)