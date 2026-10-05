export PATH="$PATH:$(go env /usr/local/go/bin/go)/bin"
export PATH=$PATH:$HOME/go/bin

## Colorize the ls output ##
alias ls='ls --color=auto'
alias hbr="brew update && brew upgrade && brew doctor && brew autoremove"

export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3
export PATH="/Library/Frameworks/Python.framework/Versions/3.14/bin:$PATH"

eval "$(starship init bash)"

alias vps="ssh vaqas@142.93.58.120"
