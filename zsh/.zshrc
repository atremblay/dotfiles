# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Terminal supports 256 colors
export TERM="xterm-256color"

# Use neovim as default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

#ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="powerlevel10k/powerlevel10k"
#Ignores duplicate in history
setopt HIST_IGNORE_DUPS


# Autocompletion
autoload -U compinit
compinit
zstyle ':completion:*' menu select

# Autocompletion of command line switches for aliases
setopt completealiases

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
plugins=(git last-working-dir vi-mode docker-compose docker)

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{white}+%f"
INSERT_MODE_INDICATOR="%F{yellow}+%f"

# User configuration

export PATH=/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

mkdir -p $HOME/local/bin
export PATH="$HOME/local/bin:$PATH"
 
mkdir -p $HOME/local/lib
export LD_LIBRARY_PATH="$HOME/local/lib:$LD_LIBRARY_PATH"
 
export PKG_CONFIG_PATH="$HOME/local/lib/pkgconfig/:$HOME/local/lib/pkg-config/"


# Keypad
# # 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# # 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# # 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# # 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# # + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

# Jump words
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

## Make zsh behave like vim
bindkey -v
export KEYTIMEOUT=15

## Change cursor shape for different vi modes.
#function zle-keymap-select {
  #if [[ ${KEYMAP} == vicmd ]] ||
     #[[ $1 = 'block' ]]; then
    #echo -ne '\e[1 q'
  #elif [[ ${KEYMAP} == main ]] ||
       #[[ ${KEYMAP} == viins ]] ||
       #[[ ${KEYMAP} = '' ]] ||
       #[[ $1 = 'beam' ]]; then
    #echo -ne '\e[5 q'
  #fi
#}
#zle -N zle-keymap-select
#zle-line-init() {
    #zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    #echo -ne "\e[5 q"
#}
#zle -N zle-line-init
#echo -ne '\e[5 q' # Use beam shape cursor on startup.
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
    
# Only past commands beginning with the current input will be shown
#[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
#[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
# jq
export PATH=$PATH:/opt/local/bin


# ipython notebook to pdf
# The library is located in this path and using:
# jupyter nbconvert --to pdf <name of notebook> requires this
export PATH=/Library/TeX/texbin:$PATH

# Java
#export JAVA_HOME=$(/usr/libexec/java_home)
#export PATH=$PATH:$JAVA_HOME/bin

# Hadoop
#export HADOOP_HOME=/usr/local/Cellar/hadoop/2.7.3
#export HADOOP_CONF_DIR=$HADOOP_HOME/libexec/etc/hadoop

# Pig
#export PIG_HOME=/usr/local/Cellar/pig/0.16.0

# Hive
#export HIVE_HOME=/usr/local/Cellar/hive/2.1.0

# anaconda
export PATH=$HOME/miniconda3/bin:$PATH

# mysql
#export MYSQL_HOME=/usr/local/Cellar/mysql/5.7.14
#export PATH=$PATH:$MYSQL_HOME/bin

# Cargo (Rust package manager)
export PATH=$PATH:$HOME/.cargo/bin
# cuda
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"

# hugging face
#export HF_DATASETS_CACHE="/data-fast/data3/common/huggingface_datasets"
#export HF_HOME="/data-fast/data3/common/huggingface_datasets"
#export OLLAMA_MODELS="/data-fast/data3/common/ollama/.ollama/models"

# mssql tools
export PATH="$PATH:/opt/mssql-tools/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/alexis/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Keep at the end of the file. Some aliases defined in this file
# will overwrite aliases provided by oh-my-zsh. This is easier to
# maintain rather than go play in oh-my-zsh configs

source $ZSH/oh-my-zsh.sh
source $HOME/.zshaliases
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load Angular CLI autocompletion.
__ng_setup="$('ng' 'completion' 'script' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
fi
unset __ng_setup

export PATH=$PATH:/Users/alexis/.spicetify
eval "$(uv generate-shell-completion zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/alexis/.lmstudio/bin"
