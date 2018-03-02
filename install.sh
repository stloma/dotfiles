mkdir -p ~/.cache/vim
mkdir -p ~/.config/vundle/bundle
mkdir -p ~/.config/tmux

ln -s $PWD/vim/vimrc ~/.vimrc
ln -s $PWD/vim/vim ~/.vim
ln -s $PWD/zsh/zsh ~/.zsh
ln -s $PWD/zsh/zshrc ~/.zshrc
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf
ln -s $PWD/tmux/plugins ~/.config/tmux 
ln -s $PWD/nvim ~/.config/nvim
ln -s $PWD/ranger/config ~/.config/ranger

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/vundle/bundle/Vundle.vim
