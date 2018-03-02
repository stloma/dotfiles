mkdir -p ~/.cache/vim
mkdir -p ~/.config/vundle/bundle
mkdir -p ~/.config/tmux
mkdir ~/.fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.2.0/Inconsolata.zip -P ~/.fonts
unzip ~/.fonts/Inconsolata.zip

ln -s $PWD/vim/vimrc ~/.vimrc
ln -s $PWD/vim/vim ~/.vim
ln -s $PWD/zsh/zsh ~/.zsh
ln -s $PWD/zsh/zshrc ~/.zshrc
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf
ln -s $PWD/tmux/plugins ~/.config/tmux 
ln -s $PWD/nvim ~/.config/nvim
ln -s $PWD/ranger/config ~/.config/ranger

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/vundle/bundle/Vundle.vim
