---@class playerObj
---@field playerId number
---@field accountId number
---@field createdAt string
---@field license string
---@field tokens number
---@field endpoint string
---@field guid string
---@field discordId string
---@field fivemId string
---@field steamId string
local playerObj = {}
playerObj.__index = playerObj

---@type playerObj[]
local playersInstance = {}

---@param playerId number
---@param accountId number
---@param accountData table
---@return playerObj?
function playerObj.createWithAccount(playerId, accountId, accountData)
    if playersInstance[playerId] then
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

    playersInstance[playerId] = self

    return self
end

---@param playerId number
---@return playerObj?
function playerObj.get(playerId)
    return playersInstance[playerId]
end

---@return playerObj[]
function playerObj.getAll()
    return playersInstance
end

---@param playerId number
---@return boolean
function playerObj.remove(playerId)
    if not playersInstance[playerId] then
        return false
    end

    playersInstance[playerId] = nil
    return true
end

_ENV.playerObj = playerObj