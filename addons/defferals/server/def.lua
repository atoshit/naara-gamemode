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
        end
    end)
end