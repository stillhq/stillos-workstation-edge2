# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100
setopt autocd nomatch
unsetopt beep extendedglob notify
bindkey -e

## stillOS additions
PROMPT='%B%F{blue}%n%f // %F{cyan}%~%f >>%b ' # custom prompt used by stillOS

# plugins (still-zsh bundled)
if [ -d /usr/share/still-zsh/plugins ]; then
  source /usr/share/still-zsh/plugins/git-prompt/git-prompt.plugin.zsh
  source /usr/share/still-zsh/plugins/copyfile.plugin.zsh
  source /usr/share/still-zsh/plugins/copypath.plugin.zsh
  [[ -f /usr/share/still-zsh/plugins/colors.plugin.zsh ]] && source /usr/share/still-zsh/plugins/colors.plugin.zsh
  [[ -f /usr/share/still-zsh/plugins/colorize.plugin.zsh ]] && source /usr/share/still-zsh/plugins/colorize.plugin.zsh
  [[ -f /usr/share/still-zsh/plugins/zsh-z/zsh-z.plugin.zsh ]] && source /usr/share/still-zsh/plugins/zsh-z/zsh-z.plugin.zsh
  [[ -f /usr/share/still-zsh/plugins/web-search.plugin.zsh ]] && source /usr/share/still-zsh/plugins/web-search.plugin.zsh
  [[ -f /usr/share/still-zsh/plugins/autoswitch_virtualenv.plugin.zsh ]] && source /usr/share/still-zsh/plugins/autoswitch_virtualenv.plugin.zsh
  [[ -f /usr/share/still-zsh/plugins/extract/extract.plugin.zsh ]] && source /usr/share/still-zsh/plugins/extract/extract.plugin.zsh
  [[ -f /usr/share/still-zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]] && source /usr/share/still-zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi

if [ -d /usr/share/zsh-autosuggestions ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# syntax highlighting last (separate package)
if [ -d /usr/share/zsh-fast-syntax-highlighting ]; then
  source /usr/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fi

# Plugin Credits (some are slightly modified):
# copyfile (modified for Wayland): https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copyfile
# copypath (modified for Wayland): https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copypath
# git-prompt: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-prompt
# web-search: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
# extract: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract
# colors: https://github.com/zpm-zsh/colors
# colorize: https://github.com/zpm-zsh/colorize
# zsh-z: https://github.com/agkozak/zsh-z
# zsh-autocomplete: https://github.com/marlonrichert/zsh-autocomplete
# autoswitch_virtualenv: https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv
# zsh-autosuggestions: https://github.com/zsh-users/zsh-autosuggestions
# zsh-fast-syntax-highlighting (package): https://github.com/zdharma-continuum/fast-syntax-highlighting

# aliases
alias rm=rm -i

# binds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
export EDITOR=micro

# still-fetch
still-fetch
