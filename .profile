export HISTCONTROL=ignoredups
export PROMPT_COMMAND='history -a'

# C/C++
# export CC="/usr/local/opt/llvm/bin/clang" # brew version for OpenMP
# export CXX="/usr/local/opt/llvm/bin/clang++" # brew version for OpenMP

# other
export LC_ALL="en_US.UTF-8" # Language
export LANG="en_US"
export LESS_TERMCAP_md="${yellow}"; # Highlight section titles in man pages
export MANPAGER='less -X'; # Keep showing man page after exit

# ALIASES
####################################################################

# various
alias cd='cd -P'
alias df='df -kTh'
alias dirsizes='du --max-depth=1 -h --exclude="\./\.*"'
#alias du='du -kh'       # Makes a more readable output.
alias ducksn='du -cks -- * | sort -nr'
alias ducks='du -cksh -- * | sort -hr'
alias echo='echo -e'
alias grep='grep -n --color'
alias ll='ls -lA'
alias mkdir='mkdir -p'
alias more='less'
alias mv='mv -vn'
alias psgrep='psgrep -i'
alias rmrf='rm -rf'
alias sai='sudo apt-get install'
alias which='type -a'

# Editing

# FUNCTIONS
############################################################

# Git functions
function clonegithub() { git clone "$git/$1" $2; }
function gcm() { git commit -a -m "No_message"; git push; }
function glog() { git log -1 --stat --pretty=format:"%H"; }
function gch() { git pull; }

  # functions scp
function cpd() { cp $@ ~/Desktop/ ; }
function scpp() { scp $@ $pm:~/.www/ ; }

# search and replace with ag
function agr () {
  # find and replace
  regex=s/${1}/${2}/g;
  ag $1 -l | xargs sed -i.agr_backup $regex;
  # delete backups
  ag -G .agr_backup -l | xargs rm
}


# export PATH=$PATH:/bin:/usr/bin:/usr/local/bin:$HOME/bin:/usr/sbin:/usr/local/sbin:$HOME/local/bin:
eval $(dircolors ~/.dircolors)


# THE END
