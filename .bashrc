#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# clirc
source $HOME/.config/sh/clirc

# enable completions for doas
complete -cf doas

