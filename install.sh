mkdir -p ~/.cache/vim
mkdir -p ~/.config/vundle
mkdir -p ~/.config/tmux
mkdir ~/.fonts

#wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Inconsolata.zip ~/.fonts
#unzip ~/.fonts/Inconsolata.zip -d ~/.fonts

ln -s $PWD/psql/psqlrc ~/.psqlrc
ln -s $PWD/zsh/zsh ~/.zsh
ln -s $PWD/zsh/zshrc ~/.zshrc
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf
ln -s $PWD/tmux/plugins ~/.config/tmux
ln -s $PWD/nvim ~/.config/nvim
ln -s $PWD/ranger/config ~/.config/ranger
ln -s $PWD/rofi ~/.config/rofi
ln -s $PWD/git/.gitignore_global ~

git config --global core.excludesfile ~/.gitignore_global
touch ~/.config/nvim/dbext.conf
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/vundle/Vundle.vim
