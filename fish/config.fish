# startup
fish_default_key_bindings

if test -z $TMUX
    tmux attach; or tmux new -s main
end

# environment variables
set -gx MANPAGER less
set -gx SHELL (which fish)
set -U EDITOR nvim
set -U VISUAL nvim
set -U fisher_copy true

# cheat.sh
curl -s cheat.sh/:fish | source

# completion
test -e /usr/share/fish/completions; and source /usr/share/fish/completions/*
test -e ~/.config/fish/completions; and source ~/.config/fish/completions/*
not test -e ~/.local/share/fish/generated_completions; and fish_update_completions

# phpbrew
test -e ~/.phpbrew; and source ~/.phpbrew/phpbrew.fish

# go
test -e ~/go; and set -gx GOPATH ~/go; set -gx PATH ~/go/bin $PATH

# composer 
test -e ~/.composer; and set -gx PATH ~/.composer/vendor/bin $PATH
test -e ~/.config/composer; and set -gx PATH ~/.config/composer/vendor/bin $PATH

# aliases
alias g "googler -n 5 -c en -l en"

# common
abbr l "ls"
abbr ll "ls -l"
abbr c cd
abbr m mkdir
abbr r "rm -rf"

# dirs
abbr . "cd .."
abbr .. "cd ../.."
abbr ... "cd ../../.."
abbr .... "cd ../../../.."

# git
abbr gs "git status"
abbr gd "git diff"
abbr ga "git add ."
abbr gc "git checkout"
abbr gci "git commit"
abbr gcim "git commit -m"
abbr gco "git checkout"
abbr gss "git stash"
abbr gsa "git stash apply"
abbr gb "git branch"
abbr grh "git reset --hard"
abbr pull "git pull"
abbr push "git push"
abbr gd "git diff"

# docker-compose
abbr dcu "docker-compose up -d"
abbr dcd "docker-compose down"
abbr dcp "docker-compose ps"
abbr dcs "docker-compose stop"
abbr dcl "docker-compose logs -f"
abbr dce "docker-compose exec"
abbr dcr "docker-compose restart"
abbr dcb "docker-compose build"

# apps
abbr ag "ag --follow --hidden"
abbr vim nvim
abbr vi nvim
abbr v nvim
abbr mc vifm
abbr f vifm
abbr p pass
abbr df "df -h"
abbr xm "xrdb -merge ~/.Xresources"

# fish config
abbr fc "nvim ~/.config/fish/config.fish; source ~/.config/fish/config.fish"
