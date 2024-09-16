fx_version 'cerulean'
game 'gta5'

author 'ZzMaMaDzZ'
description 'A shop for buy pets !'
version '0.0.1'

client_scripts {
    '@es_extended/locale.lua',
	'locales/en.lua',
    'config.lua',
    'client/main.lua'
}
server_scripts {
    "@mysql-async/lib/MySQL.lua",
    '@es_extended/locale.lua',
	'locales/en.lua',
    'config.lua',
    'server/main.lua'
}