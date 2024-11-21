local _GetPlayerIdentifierByType <const> = _GetPlayerIdentifierByType

---@class playerObject
---@field id integer
---@field accountId integer
---@field license string
---@field endpoint string
---@field guid string
---@field discord string
---@field fivem string
---@field steam string
---@field tokens table<string, number>
local playerObject = {}
playerObject.__index = playerObject
_ENV.players = {}

---@param playerId integer
---@param accountId integer
---@param data table<string, any>
---@return playerObject
function playerObject.create(playerId, accountId, data)
    local self = setmetatable({}, playerObject)
    
    self.id = playerId
    self.accountId = accountId
    self.license = _GetPlayerIdentifierByType(playerId, "license") or "Unknown"
    self.endpoint = GetPlayerEndpoint(playerId) or "Unknown"
    self.guid = GetPlayerGuid(playerId) or "Unknown"
    self.discord = _GetPlayerIdentifierByType(playerId, "discord") or "Unknown"
    self.fivem = _GetPlayerIdentifierByType(playerId, "fivem") or "Unknown"
    self.steam = _GetPlayerIdentifierByType(playerId, "steam") or "Unknown"
    self.tokens = GetPlayerTokens(playerId) or {}

    return self
end

function playerObject:getDatas()
    return self
end

--- Add Player Object
---@param playerId integer
---@param accountId integer
---@param data table<string, any>
---@return boolean
function addPlayer(playerId, accountId, data)
    if not players[playerId] then
        local player = playerObject.create(playerId, accountId, data)
        players[playerId] = player
        log("trace", "Player Class", "New player added with id " .. playerId .. " and account id " .. accountId)
        return true
    end

    return false
end

--- Remove player Object
---@param playerId integer
---@return boolean
function removePlayer(playerId)
    if not players[playerId] then return end

    log("trace", "Player Class", "Player with id " .. playerId .. " removed")
    players[playerId] = nil
    return true
end

--- Get player Object
---@param playerId integer
---@return playerObject?
function getPlayer(playerId)
    if not players[playerId] then return end

    return players[playerId]
end

--- Get all players Object
---@return table<integer, playerObject>
function getPlayers()
    return players
end

_ENV.playerObject = playerObject