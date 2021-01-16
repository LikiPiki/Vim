echo "Creating .config/ folder..."
mkdir -p ~/.config

echo "Cloning repo!"
git clone https://github.com/LikiPiki/Vim ~/.config/nvim

echo "Installing Vim-Plug plugin manager"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Install all plugins"
nvim +PlugInstall
