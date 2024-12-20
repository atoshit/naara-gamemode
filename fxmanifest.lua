-- Naara Gamemode

fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

author 'Atoshi'
description 'Naara PvP'
version '1.0.0'

shared_scripts {
    'shared/utils/libs/*.lua',
    'shared/utils/logger.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/requests.lua',
    'server/wrap/**/*.lua',
    'server/onResourceStart.lua',
    'addons/defferals/server/*.lua',
    'server/class/player/playerObj.lua',
    'server/playerConnecting.lua',
    'server/playerDropped.lua',
    'server/commands.lua',
    'addons/discord/server/*.lua'
}

client_scripts {
    'addons/discord/client/*.lua'
}