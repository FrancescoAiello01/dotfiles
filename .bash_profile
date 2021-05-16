# source bashrc
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# source aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# for Brew
export PATH="/usr/local/bin:$PATH"

# hides the default login message
export BASH_SILENCE_DEPRECATION_WARNING=1

# set a fancy prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# enable colors in bash
export CLICOLOR=1
export LSCOLORS=GxBxCxDxexegedabagaced
 
# get current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# find username@hostname:$ 
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[0;32m\]\$(parse_git_branch)\[\033[00m\]\$ "

# for bash completion
export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d"
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
