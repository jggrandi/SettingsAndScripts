# /etc/bash.bashrc
#
# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

#Enable TAB completion
source ~/.git-completion.bash

green="\[\e[38;5;82m\]"
grey="\[\e[38;5;247m\]"
blue="\[\e[38;5;33m\]"
red="\[\e[38;5;124m\]"
reset="\[\033[0m\]"

source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1



# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.
shopt -s histappend

case ${TERM} in
	xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
		;;
	screen)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
		;;
esac

# sanitize TERM:
safe_term=${TERM//[^[:alnum:]]/?}
match_lhs=""

	PS1="$(if [[ ${EUID} == 0 ]]; then echo $red'\h'; else echo $green'\u'$grey'@'$green'\h'; fi)$green\$(__git_ps1)$blue \w \$ $reset"

	#PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"
	# Use this other PS1 string if you want \W for root and \w for all other users:
	# PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h\[\033[01;34m\] \W'; else echo '\[\033[01;32m\]\u@\h\[\033[01;34m\] \w'; fi) \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\$\[\033[00m\] "

	alias ls="ls --color=auto"
	alias dir="dir --color=auto"
	alias grep="grep --colour=auto"
PS2="> "
PS3="> "
PS4="+ "

# Try to keep environment pollution down, EPA loves us.
unset safe_term match_lhs

# Try to enable the auto-completion (type: "pacman -S bash-completion" to install it).
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Try to enable the "Command not found" hook ("pacman -S pkgfile" to install it).
# See also: https://wiki.archlinux.org/index.php/Bash#The_.22command_not_found.22_hook
[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash

#ALIASES by Jeronimo
#alias devel="cd /mnt/truecrypt1/Dropbox/UFRGS/Pesquisa/Devel"
#alias data="cd /run/media/jeronimo/Data"

#[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
