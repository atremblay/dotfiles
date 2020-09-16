#!/usr/bin/env bash

if [ -e $HOME/.vimrc ]; then
    echo "Moving old \$HOME/.vimrc to \$HOME/.vimrc.old"
    mv $HOME/.vimrc $HOME/.vimrc.old
fi
ln -s $HOME/dotfiles/vim/vimrc $HOME/.vimrc

if [ -e $HOME/.config/nvim ]; then
    echo "Moving old \$HOME/.config/nvim to \$HOME/.config/nvim.old"
    mv $HOME/.config/nvim $HOME/.config/nvim.old
fi
ln -s $HOME/dotfiles/nvim $HOME/.config/

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

if [ -e $HOME/.p10k.zsh ]; then
    echo "Moving old \$HOME/.p10k.zsh to \$HOME/.p10k.zsh.old"
    mv $HOME/.p10k.zsh $HOME/.p10k.zsh.old
fi
ln -s $HOME/dotfiles/zsh/p10k.zsh $HOME/.p10k.zsh

mkdir -p $HOME/.config/alacritty/
if [ -e $HOME/.config/alacritty/alacritty.yml ]; then
    echo "Moving old \$HOME/.config/alacritty/alacritty.yml to \$HOME/.config/alacritty/alacritty.yml.old"
    mv $HOME/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml.old
fi
ln -s $HOME/dotfiles/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

mkdir -p $HOME/.config/kitty/
if [ -e $HOME/.config/kitty/kitty.yml ]; then
    echo "Moving old \$HOME/.config/kitty/kitty.yml to \$HOME/.config/kitty/kitty.yml.old"
    mv $HOME/.config/kitty/kitty.yml $HOME/.config/kitty/kitty.yml.old
fi
ln -s $HOME/dotfiles/kitty/kitty.yml $HOME/.config/kitty/kitty.yml
