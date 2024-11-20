local _Wait <const> = Wait
local _GetPlayerIdentifierByType <const> = GetPlayerIdentifierByType
local _GetPlayerEndpoint <const> = GetPlayerEndpoint
local _GetPlayerGuid <const> = GetPlayerGuid
local _GetPlayerTokens <const> = GetPlayerTokens
local _GetConvar <const> = GetConvar

---@param username string
---@return boolean
local function isValidUsername(username)
    return string.len(username) >= 3 and not string.match(username, "[^%w_]")
end

---@param password string
---@return boolean
local function isValidPassword(password) 
    return string.len(password) >= 6 
        and string.match(password, "%l") -- Require at least 1 lowercase letter
        and string.match(password, "%d") -- Require at least 1 number
end

local ERROR_MESSAGES <const> = {
    USERNAME_REQUIRED = "Veuillez entrer un nom d'utilisateur, veuillez patienter.",
    USERNAME_INVALID = "Le nom d'utilisateur doit contenir au moins 3 caractères et uniquement des lettres, chiffres et underscore.",
    PASSWORD_REQUIRED = "Veuillez entrer un mot de passe, veuillez patienter.",
    PASSWORD_INVALID = "Le mot de passe doit contenir au moins 6 caractères, un chiffre et une lettre.",
    PASSWORD_CONFIRM_REQUIRED = "Veuillez confirmer votre mot de passe, veuillez patienter.",
    PASSWORD_MISMATCH = "Les mots de passe ne correspondent pas, veuillez patienter.",
    USERNAME_ALREADY_USED = "Ce nom d'utilisateur est déjà utilisé, veuillez patienter.",
    USER_NOT_FOUND = "Nom d'utilisateur ou mot de passe incorrect, veuillez patienter."
}

---@param tempId integer: Temporary Identifier
---@param d any: Defferals
---@param callback fun(tempId: integer, d: any): void
local function openRegistrationCard(tempId, d, callback)
    local c <const> = cards.registrationCard

    d.presentCard(c, function(data)
        if data.action == "submitReturnButton" then
            callback(tempId, d)
        elseif data.action == "submitRegisterButton" then
            local username = data?.username
            local password = data?.password
            local passwordConfirm = data?.passwordConfirm

            if not username then
                d.update(ERROR_MESSAGES.USERNAME_REQUIRED)
                _Wait(3500)
                return openRegistrationCard(tempId, d, callback)
            end

            if not isValidUsername(username) then
                d.update(ERROR_MESSAGES.USERNAME_INVALID)
                _Wait(3500)
                return openRegistrationCard(tempId, d, callback)
            end

            if not password then
                d.update(ERROR_MESSAGES.PASSWORD_REQUIRED)
                _Wait(3500)
                return openRegistrationCard(tempId, d, callback)
            end

            if not isValidPassword(password) then
                d.update(ERROR_MESSAGES.PASSWORD_INVALID)
                _Wait(3500)
                return openRegistrationCard(tempId, d, callback)
            end

            if not passwordConfirm then
                d.update(ERROR_MESSAGES.PASSWORD_CONFIRM_REQUIRED)
                _Wait(3500)
                return openRegistrationCard(tempId, d, callback)
            end

            if password ~= passwordConfirm then
                d.update(ERROR_MESSAGES.PASSWORD_MISMATCH)
                _Wait(3500)
                return openRegistrationCard(tempId, d, callback)
            end

            if mysql.checkIfUserExist(username) then
                d.update(ERROR_MESSAGES.USERNAME_ALREADY_USED)
                _Wait(3500)
                return openRegistrationCard(tempId, d, callback)
            end

            mysql.createAccount(tostring(username), tostring(password), {
                license = _GetPlayerIdentifierByType(tempId, "license"),
                endpoint = _GetPlayerEndpoint(tempId),
                guid = _GetPlayerGuid(tempId),
                discord = _GetPlayerIdentifierByType(tempId, "discord"),
                fivem = _GetPlayerIdentifierByType(tempId, "fivem"),
                steam = _GetPlayerIdentifierByType(tempId, "steam"),
                tokens = _GetPlayerTokens(tempId)
            })

            if _GetConvar("naara:webhook:accountCreation", "") ~= "" then
                discordLog(_GetConvar("naara:webhook:accountCreation", ""), {
                    title = "Account Creation",
                    message = 
                        'New Account Username ```' .. (username or "Unknown") ..'```\n'..
                        'New Account Password ```' .. (password or "Unknown") ..'```\n'..
                        'Username ```' .. (GetPlayerName(tempId) or "Unknown") ..'```\n'..
                        'Temp ID ```' .. (tempId or "Unknown") ..'```\n'..
                        'Guid ```' .. (_GetPlayerGuid(tempId) or "Unknown") ..'```\n'..
                        'License ```' .. (_GetPlayerIdentifierByType(tempId, "license") or "Unknown") ..'```\n'..
                        'FiveM ID ```' .. (_GetPlayerIdentifierByType(tempId, "fivem") or "Unknown") ..'```\n'..
                        'Discord ID ```' .. (_GetPlayerIdentifierByType(tempId, "discord") or "Unknown") ..'```\n'..
                        'Steam ID ```' .. (_GetPlayerIdentifierByType(tempId, "steam") or "Unknown") ..'```\n'..
                        'Tokens ```' .. (json.encode(_GetPlayerTokens(tempId)) or "Unknown") ..'```\n'..
                        'Endpoint ```' .. (_GetPlayerEndpoint(tempId) or "Unknown") ..'```\n',
                    color = 16753920,
                    footer = "made by Atoshi",
                    image = _GetConvar("naara:serverIcon", "")
                })
            end

            d.update("Inscription en cours, veuillez patienter.")
            _Wait(2500)
            d.update("Inscription réussie, retour à l'accueil.")
            _Wait(2500)
            callback(tempId, d)
        end
    end)
end

---@param tempId integer: Temporary Identifier
---@param d any: Defferals
---@param callback fun(tempId: integer, d: any): void
local function openLoginCard(tempId, d, callback)
    local c <const> = cards.loginCard

    d.presentCard(c, function(data)
        if data.action == "submitReturnButton" then
            callback(tempId, d)
        elseif data.action == "submitLoginButton" then
            local username = data?.username
            local password = data?.password

            if not username then
                d.update(ERROR_MESSAGES.USERNAME_REQUIRED)
                _Wait(3500)
                return openLoginCard(tempId, d, callback)
            end

            if not password then
                d.update(ERROR_MESSAGES.PASSWORD_REQUIRED)
                _Wait(3500)
                return openLoginCard(tempId, d, callback)
            end

            local userExists <const> = mysql.loginToAccount(username, password)
            if not userExists then
                d.update(ERROR_MESSAGES.USER_NOT_FOUND)

                if _GetConvar("naara:webhook:accountFailedLogin", "") ~= "" then
                    discordLog(_GetConvar("naara:webhook:accountFailedLogin", ""), {
                        title = "Account Failed Login",
                        message = 
                            'Failed Username ```' .. (username or "Unknown") ..'```\n'..
                            'Failed Password ```' .. (password or "Unknown") ..'```\n'..
                            'Player Username ```' .. (GetPlayerName(tempId) or "Unknown") ..'```\n'..
                            'Temp ID ```' .. (tempId or "Unknown") ..'```\n'..
                            'Guid ```' .. (_GetPlayerGuid(tempId) or "Unknown") ..'```\n'..
                            'License ```' .. (_GetPlayerIdentifierByType(tempId, "license") or "Unknown") ..'```\n'..
                            'FiveM ID ```' .. (_GetPlayerIdentifierByType(tempId, "fivem") or "Unknown") ..'```\n'..
                            'Discord ID ```' .. (_GetPlayerIdentifierByType(tempId, "discord") or "Unknown") ..'```\n'..
                            'Steam ID ```' .. (_GetPlayerIdentifierByType(tempId, "steam") or "Unknown") ..'```\n'..
                            'Tokens ```' .. (json.encode(_GetPlayerTokens(tempId)) or "Unknown") ..'```\n'..
                            'Endpoint ```' .. (_GetPlayerEndpoint(tempId) or "Unknown") ..'```\n',
                        color = 16753920,
                        footer = "made by Atoshi",
                        image = _GetConvar("naara:serverIcon", "")
                    })
                end

                _Wait(3500)
                return openLoginCard(tempId, d, callback)
            end

            d.update("Connexion au compte réussie, connexion au serveur en cours...")

            if _GetConvar("naara:webhook:accountLogin", "") ~= "" then
                discordLog(_GetConvar("naara:webhook:accountLogin", ""), {
                    title = "Account Login",
                    message = 
                        'Account Username ```' .. (username or "Unknown") ..'```\n'..
                        'Account Password ```' .. (password or "Unknown") ..'```\n'..
                        'Account ID ```' .. (userExists or "Unknown") ..'```\n'..
                        'Player Username ```' .. (GetPlayerName(tempId) or "Unknown") ..'```\n'..
                        'Temp ID ```' .. (tempId or "Unknown") ..'```\n'..
                        'Guid ```' .. (_GetPlayerGuid(tempId) or "Unknown") ..'```\n'..
                        'License ```' .. (_GetPlayerIdentifierByType(tempId, "license") or "Unknown") ..'```\n'..
                        'FiveM ID ```' .. (_GetPlayerIdentifierByType(tempId, "fivem") or "Unknown") ..'```\n'..
                        'Discord ID ```' .. (_GetPlayerIdentifierByType(tempId, "discord") or "Unknown") ..'```\n'..
                        'Steam ID ```' .. (_GetPlayerIdentifierByType(tempId, "steam") or "Unknown") ..'```\n'..
                        'Tokens ```' .. (json.encode(_GetPlayerTokens(tempId)) or "Unknown") ..'```\n'..
                        'Endpoint ```' .. (_GetPlayerEndpoint(tempId) or "Unknown") ..'```\n',
                    color = 16753920,
                    footer = "made by Atoshi",
                    image = _GetConvar("naara:serverIcon", "")
                })
            end

            _Wait(2500)
            return d.done()
        end
    end)
end

---@param tempId integer: Temporary Identifier
---@param d any: Defferals
---@param callback fun(tempId: integer, d: any): void
local function openInfoCard(tempId, d, callback)
    local c <const> = cards.infoCard

    d.presentCard(c, function(data) 
        if data.action == "submitReturnButton" then
            callback(tempId, d)
        end
    end)
end

---@param tempId integer: Temporary Identifier
---@param d any: Defferals
function openHomeCard(tempId, d)
    local c <const> = cards.homeCard

    d.presentCard(c, function(data)
        if data.action == "submitInfoButton" then
            openInfoCard(tempId, d, openHomeCard)
        elseif data.action == "submitRegistrationButton" then
            openRegistrationCard(tempId, d, openHomeCard)
        elseif data.action == "submitLoginButton" then
            openLoginCard(tempId, d, openHomeCard)
        end
    end)
end