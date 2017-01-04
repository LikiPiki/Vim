#!/bin/bash

echo "[MES] installing likipiki config"

if [ -f ~/.zshrc ]; then
	echo "[OK] find zsh and replace config"
	rm -rf ~/.zshrc
	mv zshrc ~/.zshrc
fi
if [ ! -f ~/.zshrc ]; then
	echo "[OOPS] zsh is not installed"
	echo "[INSTALL] installing zsh"
	sh -c "\$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	rm -rf ~/.zshrc
	mv zshrc ~/.zshrc
	echo "[OK] installing zshrc config done"
fi

if [ -f ~/.tmux.conf ]; then
	rm -rf ~/.tmux.conf
	mv tmux.conf ~/.tmux.conf
	echo "[OK] Tmux conf installed successfuly"
fi

echo "[READ] Enter you .nvim directory abs"
read $nvim_directory
mv init.vim $nvim_directory

echo "[FINISH] Setup successfuly installed"
