ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/.screenrc ~/.screenrc
if [ "$(uname)" == "Darwin" ]; then
  mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
  ln -s ~/.vim $XDG_CONFIG_HOME/nvim
  ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
fi
vim -u bundlerc.vim +PluginInstall +qall

