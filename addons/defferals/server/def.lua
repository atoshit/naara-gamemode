local _Wait <const> = Wait

local function isValidUsername(username)
    return string.len(username) >= 3 and not string.match(username, "[^%w_]")
end

local function isValidPassword(password) 
    return string.len(password) >= 6 
        and string.match(password, "%l") -- Au moins 1 minuscule
        and string.match(password, "%d") -- Au moins 1 chiffre
end

local ERROR_MESSAGES <const> = {
    USERNAME_REQUIRED = "Veuillez entrer un nom d'utilisateur, veuillez patienter.",
    USERNAME_INVALID = "Le nom d'utilisateur doit contenir au moins 3 caractères et uniquement des lettres, chiffres et underscore.",
    PASSWORD_REQUIRED = "Veuillez entrer un mot de passe, veuillez patienter.",
    PASSWORD_INVALID = "Le mot de passe doit contenir au moins 6 caractères, un chiffre et une lettre.",
    PASSWORD_CONFIRM_REQUIRED = "Veuillez confirmer votre mot de passe, veuillez patienter.",
    PASSWORD_MISMATCH = "Les mots de passe ne correspondent pas, veuillez patienter."
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

            d.update("Inscription en cours, veuillez patienter.")
            _Wait(2500)
            d.update("Inscription réussie, retour à l'accueil.")
            _Wait(2500)
            callback(tempId, d)
        end
    end)
end

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

            d.update("Connexion en cours, veuillez patienter.")
            _Wait(2500)
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