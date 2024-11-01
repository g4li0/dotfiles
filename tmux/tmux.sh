#!/bin/bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;
mkdir ~/.config/tmux/ && touch ~/.config/tmux/tmux.conf;

echo 'set-option -sa terminal-overrides ",xterm*:Tc"' > ~/.config/tmux/tmux.conf
echo "set -g mouse on" >> ~/.config/tmux/tmux.conf
echo "bind '\"' split-window -v -c \"#{pane_current_path}\"" >> ~/.config/tmux/tmux.conf
echo 'bind % split-window -h -c "#{pane_current_path}"' >> ~/.config/tmux/tmux.conf

echo "unbind C-b" >> ~/.config/tmux/tmux.conf
echo "set -g prefix C-Space" >> ~/.config/tmux/tmux.conf
echo "bind C-Space send-prefix" >> ~/.config/tmux/tmux.conf

echo "set -g base-index 1" >> ~/.config/tmux/tmux.conf
echo "set -g pane-base-index 1" >> ~/.config/tmux/tmux.conf
echo "set-window-option -g pane-base-index 1" >> ~/.config/tmux/tmux.conf
echo "set-option -g renumber-windows on" >> ~/.config/tmux/tmux.conf

echo "set -g @plugin 'tmux-plugins/tpm'" >> ~/.config/tmux/tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-sensible'" >> ~/.config/tmux/tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-yank'" >> ~/.config/tmux/tmux.conf

echo "set -g @plugin 'egel/tmux-gruvbox'" >> ~/.config/tmux/tmux.conf
echo "set -g @tmux-grubvox 'dark'" >> ~/.config/tmux/tmux.conf

echo "run '~/.tmux/plugins/tpm/tpm'" >> ~/.config/tmux/tmux.conf