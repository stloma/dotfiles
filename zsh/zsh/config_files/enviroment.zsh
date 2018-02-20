if [[ $(uname -s) == Linux ]]; then
    export EDITOR="/usr/bin/vim"
fi
if [[ $(uname -s) == FreeBSD ]]; then
    export EDITOR="/usr/local/bin/vim"
fi
if [[ $(uname -s) == OpenBSD ]]; then
    export EDITOR="/usr/local/bin/vim"
fi

export PAGER="less -m"

#export LESS="-R"
