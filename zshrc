# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=/home/$USERNAME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="risto"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux)

source $ZSH/oh-my-zsh.sh
export GOPATH=/home/$USERNAME/.go/
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
export LD_LIBRARY_PATH=/usr/lib

alias dockerX11run='docker run  -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd -e DISPLAY=unix$DISPLAY'
alias gpom='git push origin master'
alias gpo='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gcom='git commit -m'
alias gadd='git add'
alias ipgrp='grep -Po --color=none "inet \K[\d.]+"'
alias bootwrp='fastboot boot ~/Documents/twrp-dragon.img'
alias gcs='git add . && git commit-suicide && gpo'
alias gps='for i in {origin,supsi}; do echo "Pushing to $i"; git push $i denvit/dev; done;'
alias gpa='for i in $(git remote); do echo "Pushing to $i"; git push $i $(git rev-parse --abbrev-ref HEAD); done'
alias reboot='echo "Reboot prevented. Use rreboot to really reboot."'
alias rreboot='/usr/bin/reboot'

source ~/.dotfiles/.private-aliases

function disk-usage(){
  du -skh $1/* | sort -h
}

function yt-live-sonos(){
  streamlink --hls-live-edge=`date "+%M*60/2+%S/2" | bc` https://www.youtube.com/watch\?v\=$1 best --stdout | ffmpeg -i pipe:0 -q:a 0 -map a -f mp3 pipe:1 | cvlc -vvv - --sout '#standard{access=http,mux=mp3,dst=0.0.0.0:8080}'
}

function gagh(){
  git remote add origin git@github.com:$1.git
}

archfeed() {
  echo -e "$(echo $(curl --silent https://www.archlinux.org/feeds/news//// | sed -e ':a;N;$!ba;s/\n/ /g') | \
  sed -e 's/&gt;/ç/g' |
  sed -e 's/&lt;\/aç/£/g' |
  sed -e 's/href\=\"/§/g' |
  sed -e 's/<title>/\\n\\n\\n   :: \\e[01;31m/g' -e 's/<\/title>/\\e[00m ::\\n/g' |
  sed -e 's/<link>/ [ \\e[01;36m/g' -e 's/<\/link>/\\e[00m ]/g' |
  sed -e 's/<description>/\\n\\n\\e[00;37m/g' -e 's/<\/description>/\\e[00m\\n\\n/g' |
  sed -e 's/&lt;pç/\n/g' |
  sed -e 's/&lt;bç\|&lt;strongç/\\e[01;30m/g' -e 's/&lt;\/bç\|&lt;\/strongç/\\e[00;37m/g' |
  sed -e 's/&lt;a[^§]*§\([^\"]*\)\"[^ç]*ç\([^£]*\)[^£]*£/\\e[01;32m\2\\e[00;37m \\e[01;34m[ \\e[01;35m\1\\e[00;37m\\e[01;34m ]\\e[00;37m/g' |
  sed -e 's/&lt;liç/\n \\e[01;34m*\\e[00;37m /g' |
  sed -e 's/<[^>]*>/ /g' |
  sed -e 's/&lt;[^ç]*ç//g' |
  sed -e 's/[ç£§]//g')\n\n" | less -R
}

PATH="/home/$USERNAME/.gem/ruby/2.5.0/bin:/home/$USERNAME/.yarn/bin:/home/$USERNAME/.opam/default/bin/:/home/$USERNAME/.cargo/bin:/home/$USERNAME/.go/bin:/home/$USERNAME/.gem/ruby/2.4.0/bin:/home/$USERNAME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/$USERNAME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/$USERNAME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/$USERNAME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/$USERNAME/perl5"; export PERL_MM_OPT;

function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=' '
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    echo "$EXIT_CODE_PROMPT"
  fi
}
RPROMPT='$(check_last_exit_code)'

export ANDROID_HOME=/home/$USERNAME/Android/Sdk
export RUST_SRC_PATH=/home/$USERNAME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/

# added by travis gem
[ -f /home/$USERNAME/.travis/travis.sh ] && source /home/$USERNAME/.travis/travis.sh
