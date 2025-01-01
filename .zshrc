# clirc
source $HOME/.config/sh/clirc

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' expand prefix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' ignore-parents parent
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle :compinstall filename "$HOME/.zshrc"

mkdir -p ~/.local/share/zsh_completions
fpath=(~/.local/share/zsh_completions $fpath)
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
mkdir -p ~/.local/state/zsh/
HISTFILE=~/.local/state/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd nomatch prompt_subst
unsetopt beep extendedglob notify
# End of lines configured by zsh-newuser-install

if [ "$TERM" = "xterm-256color" ]; then
    # create a zkbd compatible hash;
    # to add other keys to this hash, see: man 5 terminfo
    typeset -A key

    key[Home]=${terminfo[khome]}

    key[End]=${terminfo[kend]}
    key[Insert]=${terminfo[kich1]}
    key[Delete]=${terminfo[kdch1]}
    key[Up]=${terminfo[kcuu1]}
    key[Down]=${terminfo[kcud1]}
    key[Left]=${terminfo[kcub1]}
    key[Right]=${terminfo[kcuf1]}
    key[PageUp]=${terminfo[kpp]}
    key[PageDown]=${terminfo[knp]}

    # setup key accordingly
    [[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
    [[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
    [[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
    [[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
    [[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
    [[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
    [[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
    [[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
    [[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
    [[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

    bindkey '^[[1;5C' emacs-forward-word
    bindkey '^[[1;5D' emacs-backward-word
    bindkey '^H'      backward-kill-word
    bindkey "^[[3;5~" delete-word

    # Finally, make sure the terminal is in application mode, when zle is
    # active. Only then are the values from $terminfo valid.
    if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	function zle-line-init () {
	    printf '%s' "${terminfo[smkx]}"
	}
	function zle-line-finish () {
	    printf '%s' "${terminfo[rmkx]}"
	}
	zle -N zle-line-init
	zle -N zle-line-finish
    fi
elif [ "$TERM" = "linux" ]; then
    bindkey "^[[4~" end-of-line
    bindkey "^[[1~" beginning-of-line
    bindkey "^[[3~"  delete-char
fi

# Prompt

if [ -f "$HOME/.config/omp/config.yml" ] && hash oh-my-posh; then
    # Fix omp not being all the way to the right
    ZLE_RPROMPT_INDENT=0
    eval "$(oh-my-posh init zsh --config ~/.config/omp/config.yml)"
elif [[ "$TERM" != "dumb" && "$(which git_status_prompt)" != "" ]]; then
    export PROMPT='%B%(?..[%?] )%b%n@%U%m%u%b${$(git_status_prompt)}> '
    export RPROMPT="%F{${1:-green}}%~%f"
else
    export PROMPT="%(?..[%?] )%n@%m:%~> "
fi



if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then # Arch
   source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then # Ubuntu
   source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
   echo "zshrc: failed to source zsh-syntax-highlighting.zsh"
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#4c4c4c'
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then # Arch
   source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then # Ubuntu
   source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
   echo "zshrc: failed to source zsh-autosuggestions.zsh"
fi


