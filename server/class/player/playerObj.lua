---@class playerObj
local playerObj = {}
playerObj.__index = playerObj

local players = {}

function playerObj.createWithAccount(playerId, accountId, accountData)
    if players[playerId] then
        return false
    end

    local self = setmetatable({}, playerObj)
    self.playerId = playerId
    self.accountId = accountId
    self.createdAt = accountData.createdAt
    self.license = accountData.license
    self.tokens = accountData.tokens
    self.endpoint = accountData.endpoint
    self.guid = accountData.guid
    self.discordId = accountData.discordId
    self.fivemId = accountData.fivemId
    self.steamId = accountData.steamId

    players[playerId] = self

    return self
end

_ENV.playerObj = playerObj
_ENV.players = players