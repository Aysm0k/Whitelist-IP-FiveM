fx_version 'adamant'

game 'gta5'

description 'Keolo Whitelist'

version '1.1'


server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'locale.lua', -- Credit es_extended
	'locales/fr.lua',
	'config.lua',
	'server/server.lua'
}


dependencies {
	'mysql-async',
	'essentialmode',
	'esplugin_mysql'
}
