### Config Variables ###
set apache_path /etc/apache2/
set code_path /vagrant/project/
### End Config Variables ###


### Symfony Custom Functions ###
function symfony
    app/console $argv
end

function symfony-symlink
    symfony assets:install --symlink web
end

function symfony-assetic-dump
    symfony assetic:dump --env=dev --no-debug
end

function symfony-cc
    symfony cache:clear --env=dev --no-debug
end

function symfony-migrations-show-versions
    symfony doctrine:migrations:status --show-versions
end

function symfony-migrations-diff
    symfony doctrine:migrations:diff
end

function symfony-migrations-migrate
    symfony doctrine:migrations:migrate
end
### End Symfony Custom Functions   ###


### Apache Transports ###
function vhost
    cd {$apache_path}/sites-enabled/
end
### End Apache Transports ###


### Project Transports ###
function project
    cd {$code_path}/
end
### End Project Transports ###


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
