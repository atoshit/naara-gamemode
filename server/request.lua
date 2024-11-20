local mysql <const> = {}

local CHECK_IF_USER_EXIST <const> = "SELECT 1 FROM users WHERE username = ?"
---@param username string
---@return boolean
function mysql.checkIfUserExist(username)
    return MySQL.scalar.await(CHECK_IF_USER_EXIST, {username}) ~= nil
end

local CREATE_ACCOUNT <const> = "INSERT INTO users (username, password, createdAt, license, tokens, endpoint, guid, discordId, fivemId, steamId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
---@param username string
---@param password string
---@param identifiers table<string, string>
---@return integer
function mysql.createAccount(username, password, identifiers)
    return MySQL.insert.await(CREATE_ACCOUNT, {username, password, os.date("%Y-%m-%d %H:%M:%S"), identifiers.license or "Unknown", json.encode(identifiers.tokens) or "{}", identifiers.endpoint or "Unknown", identifiers.guid or "Unknown", identifiers.discord or "Unknown", identifiers.fivem or "Unknown", identifiers.steam or "Unknown"})
end

local LOGIN_TO_ACCOUNT <const> = "SELECT `id` FROM users WHERE username = ? AND password = ?"
---@param username string
---@param password string
---@return integer | nil
function mysql.loginToAccount(username, password)
    return MySQL.scalar.await(LOGIN_TO_ACCOUNT, {username, password})
end

_ENV.mysql = mysql