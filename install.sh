#!/usr/bin/env bash

if [ -e $HOME/.vimrc ]; then
    echo "Moving old \$HOME/.vimrc to \$HOME/.vimrc.old"
    mv $HOME/.vimrc $HOME/.vimrc.old
fi
ln -s $HOME/dotfiles/vim/vimrc $HOME/.vimrc

if [ -e $HOME/.config/nvim/init.vim ]; then
    echo "Moving old \$HOME/.config/nvim/init.vim to \$HOME/.config/nvim/init.vim.old"
    mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim.old
fi
ln -s $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim

if [ -e $HOME/.tmux.conf ]; then
    echo "Moving old \$HOME/.tmux.conf to \$HOME/.tmux.conf.old"
    mv $HOME/.tmux.conf $HOME/.tmux.conf.old
fi
ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf

if [ -e $HOME/.zshrc ]; then
    echo "Moving old \$HOME/.zshrc to \$HOME/.zshrc.old"
    mv $HOME/.zshrc $HOME/.zshrc.old
fi
ln -s $HOME/dotfiles/zsh/zshrc $HOME/.zshrc

if [ -e $HOME/.zshaliases ]; then
    echo "Moving old \$HOME/.zshaliases to \$HOME/.zshaliases.old"
    mv $HOME/.zshaliases $HOME/.zshaliases.old
fi
ln -s $HOME/dotfiles/zsh/zshaliases $HOME/.zshaliases

