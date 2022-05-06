[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# OPTIONS
###################################################################
# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD
# Now we can pipe to multiple outputs!
setopt MULTIOS
# Spell check commands!  (Sometimes annoying)
# setopt CORRECT
# This makes cd=pushd
setopt AUTO_PUSHD
# This will use named dirs when possible
setopt AUTO_NAME_DIRS
# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS
# No more annoying pushd messages...
setopt PUSHD_SILENT
# blank pushd goes to home
setopt PUSHD_TO_HOME
# this will ignore multiple directories for the stack.  Useful?  I dunno.
setopt PUSHD_IGNORE_DUPS
# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT
#use magic (this is default, but it can't hurt!)
setopt ZLE
setopt NO_HUP
setopt VI
setopt IGNORE_EOF
# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL
# beeps are annoying
setopt NO_BEEP
# Keep echo "station" > station from clobbering station
setopt NO_CLOBBER
# Case insensitive globbing
setopt NO_CASE_GLOB
# Be Reasonable!
setopt NUMERIC_GLOB_SORT
# I don't know why I never set this before.
setopt EXTENDED_GLOB
# hows about arrays be awesome?  (that is, frew${cool}frew has frew surrounding all the variables, not just first and last
setopt RC_EXPAND_PARAM

setopt PROMPT_SUBST

# PROMPT AND COLORS
####################################################################
autoload -U colors && colors # ls colors

# ZMV (batch rename)
autoload -U zmv

PS1="%n@%m:%~%# " # # Apply theming defaults
PROMPT='%{${fg_bold[yelow]}%}%n%{$reset_color%}%{${fg[yellow]}%}@%m%{$reset_color%} %(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )%{$fg[yellow]%}%#%{$reset_color%} '
RPROMPT='%{$fg[green]%}%~%{$reset_color%}'





# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/gordanz/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/gordanz/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/gordanz/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/gordanz/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/opt/binutils/bin:$PATH"
