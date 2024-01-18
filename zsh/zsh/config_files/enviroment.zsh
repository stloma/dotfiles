if [[ $(uname -s) == Linux ]]; then
    export EDITOR="/usr/bin/nvim"
fi
if [[ $(uname -s) == Darwin ]]; then
    export EDITOR="/opt/homebrew/bin/nvim"
fi
if [[ $(uname -s) == FreeBSD ]]; then
    export EDITOR="/usr/local/bin/vim"
fi
if [[ $(uname -s) == OpenBSD ]]; then
    export EDITOR="/usr/local/bin/vim"
fi

export PAGER="less -m"
export MANPAGER="less -m"
export RIPGREP_CONFIG_PATH="~/.ripgreprc"

#export LESS="-R"
