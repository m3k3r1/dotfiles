if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export GPG_TTY=`tty`
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh
source "$HOME/.cargo/env"


eval "$(zoxide init zsh)"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"


alias cat=bat
alias cd=z
alias esp32-init=" . /Users/m3k3r1/export-esp.sh && cargo generate https://github.com/esp-rs/esp-idf-template cargo"
alias esp32-env=" . /Users/m3k3r1/export-esp.sh"

function secondcolumn() { awk '{print $2}'; }
alias dev='kubectl config get-contexts | grep development | secondcolumn | xargs kubectl config use-context'
alias prod="kubectl config get-contexts | grep prod | secondcolumn | xargs kubectl config use-context"
alias mt="kubectl config get-contexts | grep machine-translation | secondcolumn | xargs kubectl config use-context"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

