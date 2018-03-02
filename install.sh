mkdir -p ~/.cache/vim
mkdir -p ~/.config/tmux

ln -s vim/vimrc ~/.vimrc
ln -s vim/vim ~/.vim
ln -s zsh/zsh ~/.zsh
ln -s zsh/zshrc ~/.zshrc
ln -s tmux/tmux.conf ~/.tmux.conf
ln -s nvim ~/.config/nvim
ln -s ranger/config ~/.config/ranger

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
