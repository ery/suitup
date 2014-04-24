#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "source $DIR/script/suitup_bash.sh" >> ~/.bashrc
echo "source $DIR/script/suitup_zsh.sh" >> ~/.zshrc

echo "Install done."
echo "  Updated ~/.bashrc"
echo "  Updated ~/.zshrc"
