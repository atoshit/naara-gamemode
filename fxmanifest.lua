-- Naara Gamemode

fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

author 'Atoshi'
description 'Naara PvP'
version '1.0.0'

shared_scripts {
    'shared/utils/logger.lua',
}

server_scripts {
    'server/onResourceStart.lua',
    'addons/defferals/server/*.lua',
    'server/playerConnecting.lua',
    'server/playerDropped.lua',
    'addons/discord/server/*.lua'
}

client_scripts {
    'addons/discord/client/*.lua'
}