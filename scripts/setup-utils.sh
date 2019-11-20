#!/bin/bash
source "/vagrant/scripts/common.sh"

function cloneRepo {
	echo "clone dotfiles repo"
	git clone https://github.com/martinprobson/dotfiles.git /home/vagrant/dotfiles
}

function setupDotfiles {
	echo "Setup dotfiles"
 	add-apt-repository -y ppa:neovim-ppa/stable
	cd /home/vagrant/dotfiles && stow vim && stow bash && stow tmux && stow nvim
}

function bashrcLocal {
	#
	# This turns off fetch remote github status - we don't have a ssh key for that in the VM
	#
	echo "setup .bashrc_local"
	echo "GIT_PROMPT_FETCH_REMOTE_STATUS=1" > /home/vagrant/.bashrc_local
}

echo "setup sbt"
cloneRepo
setupDotfiles
bashrcLocal

