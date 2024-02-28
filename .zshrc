# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  aliases
  git-prompt
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# get machine's ip address
alias ip="ipconfig getifaddr en0"
# edit global zsh configuration
alias zshconfig="vim ~/.zshrc"
# reload zsh configuration
alias zshsource="source ~/.zshrc"
# reload zsh configuration
alias ohmyzsh="cd ~/.oh-my-zsh"
# navigate to global ssh directory
alias sshhome="cd ~/.ssh"
# edit global ssh configuration
alias sshconfig="nvim ~/.ssh/config"
# edit global git configuration
alias gitconfig="nvim ~/.gitconfig"
# Change default editor when in SSH
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Uncomment the following line if pasting URLs and other text is messed up.
 DISABLE_MAGIC_FUNCTIONS="true"


# ALIASES

# Alias for managing dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME" 

# Testing nvim kickstart for a new config with sane defaults
alias nvimk='NVIM_APPNAME="nvim-kickstart-modular" nvim'

# open new window and panes in tmux, IDE style.
alias ide='tmux new-window -n IDE \; split-window -v -p 25 \; split-window -h -p 40 \; select-pane -t 0 \; send-keys "nvim" C-m \; select-pane -t 1 \; send-keys "ls" C-m \; select-pane -t 0'
# test
alias websplit="tmux new-window -n WebSplit \; split-window -v -p 25 \; select-pane -t 0 \; send-keys "nvim" C-m \; select-pane -t 1 \; send-keys "lhost" C-m \;" 
# open localhost:3000 in Arc.
alias lhost="open -a Arc http://localhost:3000"
# open finder in current directory
alias finder="open ."
# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# FZF Aliases
export FZF_DEFAULT_OPTS="--bind='j:down,k:up'"
export FZF_DEFAULT_OPTS="--bind='ctrl-j:down,ctrl-k:up,ctrl-d:page-down,ctrl-u:page-up'"
# Search through files in a directory for specific text patterns
alias fzfgrep='grep -r "" . | fzf'
# Interactively list and select files in the current directory
alias fzfls='ls | fzf'
# Select a file and edit it in the default editor (or a specified one)
alias fzfn='EDITOR=nvim; export EDITOR; ${EDITOR} "$(fzf)"'
# Search through command history
alias fzfhist='history | fzf'
# Interactively select and kill processes
alias fzfkill='ps -ef | fzf -m | awk '\''{print $2}'\'' | xargs kill -9'
# Interactively select a directory and cd into it
alias fzfcd='cd "$(dirname "$(fzf)")"'

# ls stuff, most are set in lib/directories.zsh
# I use lsd (https://github.com/Peltoche/lsd) for certain listings
alias ls='ls -GFh' # Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -GFhl' # Same as above, but in long listing format
alias lh='ls -d .*' # show hidden files/directories only
alias lt='ls -ltFho'   #long list,sorted by date,show type,human readable
alias ldot='ls -ld .*' #list dot files
alias dus='du -sckx * | sort -nr' #directories sorted by size

alias wordy='wc -w * | sort | tail -n10' # sort files in current directory by the number of words they contain
alias filecount='find . -type f | wc -l' # number of files (not directories)

alias ttop='top -ocpu -R -F -s 2 -n30' # fancy top

# CD Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias docs="cd ~/Documents"
alias dev="cd ~/Development/"
alias odin="cd ~/Development/Projects/the-odin-project/"
alias rby="cd ~/Development/Projects/rby"
alias school="cd ~/Development/School"
alias projects="cd ~/Development/Projects/"

# Quick edit to my aliases and zshrc config
alias zshrc="nvim ~/.zshrc"

# Clear terminal
alias cl='clear'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Recursively delete logs, speeds up iterm2 start time
alias clearlogs='sudo rm -rf /var/log/asl/*.asl'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"


alias loc="npx sloc --format cli-table --format-option head --exclude 'build|\.svg$\.xml' ./"

# load zsh-completions
autoload -U compinit && compinit

# use nvm
source /opt/homebrew/opt/nvm/nvm.sh

# use starship theme (needs to be at the end)
# eval "$(starship init zsh)"
#
ZSH_THEME="powerlevel10k/powerlevel10k"
#
 source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
 [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /Users/ruben/Repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/ruben/Repos/zsh-autocomplete/zsh-autocomplete.plugin.zsh
