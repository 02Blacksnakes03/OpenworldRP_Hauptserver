fx_version 'cerulean'
games {'gta5'}

author 'Nemesus.de'
description 'Adds the ability to crack open vehicles'
contact 'info@nemesus.de'
version '1.1'

dependencies {
	"es_extended"
}

server_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'locales/de.lua',
	'locales/en.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'locales/de.lua',
	'locales/en.lua',
	'client/main.lua'
}

ui_page 'html/lockpicking.html'

files {
    'html/lockpicking.html',
    'html/style.css',
    'html/lockpicking.js',
}