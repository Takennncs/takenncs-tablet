fx_version 'adamant'
game 'gta5'

description 'takenncsDev Sell item tablet'
author 'takenncs Discord: takenncss'


ui_page 'ui/index.html'

shared_scripts {
	'@ox_lib/init.lua'
} 

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server/*.lua'
}

client_scripts {
    'config.lua',
    'client/*.lua'
}
files {
    'ui/index.html',
    'ui/script.js',
}

lua54 'yes'
