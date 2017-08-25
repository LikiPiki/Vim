# install config

if [ "$(uname)" == "Darwin" ]; then
	echo "[MSG]: Running OSX!"
	echo "[MSG]: Finding brew"

	if [ "$(which brew)" ]; then
		echo "[OK] Brew here!"
	else
		echo "[MSG] Brew not found!"
		echo "[INS] Installing brew!"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	echo -e "[MSG]: Finding dependency!"
	if [ "$(which git)" ]; then
		echo "[OK] Git here!"
	else
		echo "[MSG] Git not found!"
		echo "[INS] Installing git!"
	fi
	echo "[GIT] clonnig Vim repo"
	git clone https://github.com/LikiPiki/Vim
	cd Vim
	if [ "$(which nvim)" ]; then
		echo "[OK] Neovim here"
	else
		echo "[MSG] Neovim not found!"
		echo "[INS] Installing Neovim!"
		brew install neovim/neovim/neovim
	fi

	if [ "$(which python)" ]; then
		echo "[MSG] Python2 here"
		if [ "$(which pip2)" ]; then
			echo "[MSG] pip here"
		else
			echo "[SUDO] please enter sudo password"
			sudo easy_install pip2
			sudo easy_install pip3
		fi
	else
		brew install python
	fi
	#check python3 here

	echo "[SUDO] please enter sudo password"
	# sudo pip2 install neovim
	# sudo pip3 install neovim

	# move files!!!
	echo "[INS] Installing vim-plug"
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "[MOV] Move init file"
	if [ -e $HOME/.config/nvim/init.vim ]; then
		echo "[DEL] DELETING"
		rm -rf $HOME/.config/nvim/init.vim
	fi
	mkdir -p $HOME/.config/nvim/
	mv init.vim $HOME/.config/nvim/init.vim
	echo "[MOV] tmux config file"
	if [ -e $HOME/.tmux.conf ]; then
		echo "[DEL] DELETING"
		rm -rf $HOME/.tmux.conf
	fi
	mv tmux.conf $HOME/.tmux.conf

	# move files end

	echo "[CLN] Cleaning Vim folder"
	rm -rf Vim
	echo "[SUCCESS] Installed"
fi



