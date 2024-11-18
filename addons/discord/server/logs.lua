local webhookQueue = {}
local isProcessingWebhooks = false

---@param webhook string: The webhook URL to send the log to
---@param content table: The content of the log
local function send(webhook, content)
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = {
        {
            ['title'] = content.title or "Title not defined",
            ['description'] = content.message or "Message not defined",
            ['color'] = content.color or 16776960,
            ["footer"] = {
                ["text"] = content.footer or "Footer not defined",
            },
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            ["thumbnail"] = { 
                ["url"] = content.image or GetConvar("naara:serverIcon", "")
            }
        }
    }}), {['Content-Type'] = 'application/json'})
end

local function processWebhookQueue()
    isProcessingWebhooks = true

    CreateThread(function()
        while #webhookQueue > 0 do
            local webhookData = table.remove(webhookQueue, 1)
            send(webhookData.webhook, webhookData.content)
            Wait(1000)
        end
        isProcessingWebhooks = false
    end)
end

---@param webhook string: The webhook URL to send the log to
---@param content table: The content of the log
function discordLog(webhook, content)
    webhookQueue[#webhookQueue+1] = {webhook = webhook, content = content}

    if not isProcessingWebhooks then
        processWebhookQueue()
    end
end