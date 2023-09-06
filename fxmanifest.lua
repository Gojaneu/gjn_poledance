fx_version 'cerulean'
games { 'gta5' }

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua'
}

client_script {
    'client/*.lua'
}

files {
    'locales/*.json'
}