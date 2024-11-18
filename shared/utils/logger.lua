--- level string: info, error, warn, debug, success, log
local logLevels <const> = {
    ["info"] = { color = "^9", debugLevel = 1  },
    ["warn"] = { color = "^3", debugLevel = 1 },
    ["debug"] = { color = "^5", debugLevel = 2 },
    ["success"] = { color = "^2", debugLevel = 1 },
    ["trace"] = { color = "^6", debugLevel = 2 },
    ["log"] = { color = "^7", debugLevel = 1 },
}

local logQueue = {}
local isProcessingQueue = false

--- Display a log message
--- @param level string: info, error, warn, debug, success, log
--- @param module string: Module name
--- @param message string: Message to log
local function logMessage(level, module, message)
    if not message or type(message) ~= "string" then
        return
    end

    local timestamp = IsDuplicityVersion() and os.date("%d/%m/%Y %H:%M:%S") or "CLIENT"
    local levelColor = logLevels[level].color or "^7LOG"
    local m = "[" .. timestamp .. " : " .. (module or "Naara") .. "] " .. levelColor .. "" .. message .. "^7"

    print(m)
end

--- Process the log queue
local function processQueue()
    isProcessingQueue = true
    CreateThread(function()
        while #logQueue > 0 do
            local logEntry = table.remove(logQueue, 1)
            logMessage(logEntry.level, logEntry.module, logEntry.message)
            Wait(99)
        end

        isProcessingQueue = false
    end)
end

--- Add a message to the log queue
--- @param level string: info, error, warn, debug, success, log
--- @param module string: Module name
--- @param message string: Message to log
function log(level, module, message)
    local debugLevel <const> = tonumber(GetConvar("naara:debugLevel"))

    if debugLevel == 0 or logLevels[level].debugLevel > debugLevel then
        return
    end

    logQueue[#logQueue + 1] = {level = level, module = module, message = message}

    if not isProcessingQueue then
        processQueue()
    end
end