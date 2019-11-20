#!/bin/bash

source "/vagrant/scripts/common.sh"

function setupUtilities {
    # update the locate database
    updatedb
}

function setupVIM {
#    Use the full vim version 
    apt-get remove -y vim.tiny
    add-apt-repository -y ppa:neovim-ppa/stable
    apt-get update
    apt-get install -y neovim
}

function setupNetStat {
#   Setup netstat (usful for debug)
    apt-get install -y net-tools
}
echo "finalize ubuntu"
setupUtilities
echo "setup vim"
setupVIM
echo "setup netstat"
setupNetStat
