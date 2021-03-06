### Config Variables ###
set apache_path /etc/apache2/
set code_path /vagrant/project/
### End Config Variables ###


### Apache Transports ###
function siav
    cd {$apache_path}/sites-available/
end

function sien
    cd {$apache_path}/sites-enabled/
end
### End Apache Transports ###


### Project Transports ###
function project
    cd {$code_path}/
end
### End Project Transports ###


### Begin Symfony ###
function sf
    bin/console $argv
end

function sf-requirements
    bin/symfony_requirements
end

function sf-security-checker
    bin/security-checker
end

function sf-symlink
    sf assets:install --relative web
end

function sf-assetic-dump
    sf assetic:dump --env=dev --no-debug
end

function sf-cc
    sf cache:clear --env=dev --no-warmup --no-debug
end

function sf-router-debug
    switch (count $argv)
        case 0
            sf debug:router
        case 1
            sf debug:router $argv[1]
    end
end

function sf-router-match
    switch (count $argv)
        case 0
            echo Missing URL to perform the match!
        case 1
            sf router:match $argv[1]
    end
end

function sf-server-run
    sf server:run localhost:9090
end

function sf-schema-update
    sf doctrine:schema:update --force
end

function sf-fixtures-load
    sf doctrine:fixtures:load
end

function env-sql-dump
    sf doctrine:schema:update --dump-sql
end
### End Symfony ###


### Config Shortcuts ###
function editgit
    vim ~/.gitconfig
end

function editfish
    vim ~/.config/fish/config.fish
end

function edithosts
    sudo vim /etc/hosts
end

function editvim
    vim ~/.vimrc
end
### End Config Shortcuts ###


### Misc Helpers ###
function reap
    sudo /etc/init.d/apache2 restart
end

function phpserve
    php -S 192.168.33.11:8000
end

function pyserve
    python -m "SimpleHTTPServer" $argv[1]
end
### End Misc Helpers ###


### Fish Specific ###
function fish_prompt -d "Write out the prompt"
    set_color purple
        set branch (git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /')
        printf '%s@%s%s %s%s%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color yellow) (echo $branch) (set_color normal)
end
### End Fish Specific ###


### Vim ###
function vim -d 'Vi improved'
    set old_shell $SHELL
    set SHELL /bin/sh
    command vim $argv
    set SHELL $old_shell
end

function vi -d 'Vi improved'
    vim $argv
end
### End Vim ###
