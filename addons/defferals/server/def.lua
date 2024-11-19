---@param tempId integer: Temporary Identifier
---@param d any: Defferals
---@param callback fun(tempId: integer, d: any): void
local function openRegistrationCard(tempId, d, callback)
    local c <const> = cards.registrationCard

    d.presentCard(c, function(action)
        if action.action == "submitReturnButton" then
            callback(tempId, d)
        end
    end)
end

local function openLoginCard(tempId, d, callback)
    local c <const> = cards.loginCard

    d.presentCard(c, function(action)
        if action.action == "submitReturnButton" then
            callback(tempId, d)
        end
    end)
end

---@param tempId integer: Temporary Identifier
---@param d any: Defferals
---@param callback fun(tempId: integer, d: any): void
local function openInfoCard(tempId, d, callback)
    local c <const> = cards.infoCard

    d.presentCard(c, function(action) 
        if action.action == "submitReturnButton" then
            callback(tempId, d)
        end
    end)
end

---@param tempId integer: Temporary Identifier
---@param d any: Defferals
function openHomeCard(tempId, d)
    local c <const> = cards.homeCard

    d.presentCard(c, function(action)
        if action.action == "submitInfoButton" then
            openInfoCard(tempId, d, openHomeCard)
        elseif action.action == "submitRegistrationButton" then
            openRegistrationCard(tempId, d, openHomeCard)
        elseif action.action == "submitLoginButton" then
            openLoginCard(tempId, d, openHomeCard)
        end
    end)
end