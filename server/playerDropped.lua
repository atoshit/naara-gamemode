local _GetPlayerIdentifierByType <const> = GetPlayerIdentifierByType
local _GetConvar <const> = GetConvar

AddEventHandler("playerDropped", function(reason)
    local _source = source
    local playerName = GetPlayerName(_source)

    log("info", "playerDropped", (playerName or "Unknown") .. " has left the server [reason: " .. (reason or "Unknown") .. ", endpoint: " .. (GetPlayerEndpoint(_source) or "Unknown") .. ", id: " .. (_source or "Unknown") .. ", guid: " .. (GetPlayerGuid(_source) or "Unknown") .. ", license: " .. (_GetPlayerIdentifierByType(_source, "license") or "Unknown") .. ", fivem: " .. (_GetPlayerIdentifierByType(_source, "fivem") or "Unknown") .. ", discord: " .. (_GetPlayerIdentifierByType(_source, "discord") or "Unknown") .. ", steam: " .. (_GetPlayerIdentifierByType(_source, "steam") or "Unknown") .. ", tokens: " .. (json.encode(GetPlayerTokens(_source)) or "Unknown") .. "]")

    if _GetConvar("naara:webhook:playerDropped", "") ~= "" then
        discordLog(_GetConvar("naara:webhook:playerDropped", ""), {
            title = "Player Dropped",
            message = 
                'Player Name ```' .. (playerName or "Unknown") ..'```\n'..
                'ID ```' .. (_source or "Unknown") ..'```\n'..
                'Ping ```' .. (GetPlayerPing(_source) or "Unknown") ..'```\n'..
                'Guid ```' .. (GetPlayerGuid(_source) or "Unknown") ..'```\n'..
                'License ```' .. (_GetPlayerIdentifierByType(_source, "license") or "Unknown") ..'```\n'..
                'FiveM ID ```' .. (_GetPlayerIdentifierByType(_source, "fivem") or "Unknown") ..'```\n'..
                'Discord ID ```' .. (_GetPlayerIdentifierByType(_source, "discord") or "Unknown") ..'```\n'..
                'Steam ID ```' .. (_GetPlayerIdentifierByType(_source, "steam") or "Unknown") ..'```\n'..
                'Tokens ```' .. (json.encode(GetPlayerTokens(_source)) or "Unknown") ..'```\n'..
                'Endpoint ```' .. (GetPlayerEndpoint(_source) or "Unknown") ..'```\n',
            color = 16753920,
            footer = "made by Atoshi",
            image = _GetConvar("naara:serverIcon", "")
        })
    end
end)