# Env Variables
export ENV="dev"

# change config home
export XDG_CONFIG_HOME=$HOME/.config

# Nvim default editor
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
# Prompt config
## Enable colors
force_color_prompt=yes
color_prompt=yes

## Function to get the current Git branch
git_branch() {
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo " ($branch)" # Only the branch name without any color codes
    fi
}

## Set up PS1 (prompt)
PS1="\[\e]0;\w\a\]"             # Set terminal window title to full path
PS1+="\[\e[1;32m\]\W"           # Show only the current folder name in green
PS1+="\$(git_branch)"           # Append Git branch if inside a repo
PS1+=" \[\e[1;33m\]❯\[\e[0m\] " # Yellow ❯ as prompt symbol

# History control
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE="${HISTSIZE}"

# Autocompletion
source /usr/share/bash-completion/bash_completion

# Load envs
## Rust
. "$HOME/.cargo/env"
## Bun
export BUN_INSTALL="$HOME/.bun"
export XDG_CONFIG_HOME="$HOME/.config"

## path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/omakub/bin"
export PATH="$PATH:./bin"
export PATH="$PATH:$BUN_INSTALL/bin"

set +h

# Aliases
## Misc
alias b='cd ~/blog && n ./content/_index.md'
alias v='source .venv/bin/activate'
alias nv='python -m venv .venv'
alias dv='deactivate'
alias tmplupd='go install github.com/a-h/templ/cmd/templ@latest'

## File system
alias ls='eza -lh --group-directories-first --icons'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'batcat --style=numbers --color=always {}'"
alias fd='fdfind'
alias cd='z'

## Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

## Tools
alias n='nvim-pyvenv'
alias g='git'
alias d='docker'
alias dc='docker compose'
alias bat='batcat'
alias lzg='lazygit'
alias lzd='lazydocker'

## Git
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'

## Compression
compress() { tar -czf "${1%/}.tar.gz" "${1%/}"; }
alias decompress="tar -xzf"

## Convert webm files generated by the Gnome screenshot video recorder to mp4s that are more compatible
webm2mp4() {
    input_file="$1"
    output_file="${input_file%.webm}.mp4"
    ffmpeg -i "$input_file" -c:v libx264 -preset slow -crf 22 -c:a aac -b:a 192k "$output_file"
}

# Init Tools
if command -v mise &>/dev/null; then
    eval "$(mise activate bash)"
fi

if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
fi

if command -v fzf &>/dev/null; then
    source /usr/share/bash-completion/completions/fzf
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi
