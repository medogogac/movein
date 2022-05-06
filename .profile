# ENVIRONMENT VARIABLES
####################################################################
# detect the OS type (for both WSL and linux OSTYPE returns
# linux-gnu for $OSTYPE, so we need to check the full
# description in the file /proc/version)
export OS=$OSTYPE
if [[ "$OSTYPE" == linux-gnu ]]; then
 OS_VERSION=`cat /proc/version`
 if [[ $OS_VERSION == *"Microsoft"* ]]; then
  OS="wsl"
 else
  OS="linux (not wsl)"
 fi
fi

# set variables depending on the OS
case "$OS" in 
   darwin*)
      export TEXMFHOME=$HOME/Library/texmf
      export SUBLCONFIG=$HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
      export OPENCOMMAND="open"
      export EDITORCOMMAND="subl"
      export OPENTEX="code"
      export DOCS=$HOME
      export PAPERSDIR=$HOME/papers
      ;;
   wsl*)  
     # need to put sublime and sumatra in PATH in windows
     export TEXMFHOME=$HOME/texmf
     export SUBLCONFIG=$HOME/.config/sublime # must be linked
     export OPENCOMMAND="xdg-open"
     export EDITORCOMMAND="vim"
     export OPENTEX="subl.exe"
     export DOCS="$HOME"
     export DISPLAY=:0
     export PAPERSDIR=$HOME/winhome/Documents/papers
     alias nq="/mnt/c/Program\ Files/Neovim/bin/nvim-qt.exe"
     alias ls="ls --color=always"
     alias lm="ls | less -R"
     alias jupyter-notebook="~/.local/bin/jupyter-notebook --no-browser"
     ;;
  *)
    export TEXMFHOME=$HOME/texmf
    export SUBLCONFIG=$HOME/.config/sublime-text-3/Packages/User 
    export OPENCOMMAND="xdg-open"
    # export EDITORCOMMAND="gvim"
    export EDITORCOMMAND="nvim"
    export OPENTEX="subl"
    export DOCS=$HOME
    export PAPERSDIR=$HOME/papers
    alias open="xdg-open"
    alias lm="ls --color=always -lAg | less -R"
    alias ls="ls --color=always"
    ;;
esac

# various other
export HOSTFILE=$HOME/.hosts    # Put list of remote hosts in ~/.hosts ...
export CLSDIR=$TEXMFHOME/tex/latex
export DEFSFILE=$CLSDIR/mydefs/mydefs.sty
export BIBDIR=$TEXMFHOME/bibtex/bib
export BIBFILE=$BIBDIR/mybib.bib
export DROPBOXDIR=$HOME/Dropbox
export BINDIR=$HOME/bin
export DOTDIR=$HOME/dotfiles
export HISTCONTROL=ignoredups
export PROMPT_COMMAND='history -a'

# C/C++
# export CC="/usr/local/opt/llvm/bin/clang" # brew version for OpenMP
# export CXX="/usr/local/opt/llvm/bin/clang++" # brew version for OpenMP



# user dependent
case "$USER" in
  gordanz*)
    # need full  paths
    GITS=( $DOCS/work $DOCS/official $DOCS/teaching $HOME/ ) 
    export BOOKMARKS=$HOME/.bmks
    export BOOKMARKALIASES=$HOME/.bmks_al
    ;;
  *)
    GITS=( $HOME/prase $HOME/dotfiles $TEXMFHOME $HOME/bin ) # need full paths
    export BOOKMARKS=$HOME/.bmksP
    export BOOKMARKALIASES=$HOME/.bmksP_al
    ;;
esac

# utexas servers
export gm=gordanz@ssh.ma.utexas.edu # or @needs a key, no passwords
export gm=gordanz@ma.utexas.edu # or @needs a key, no passwords
export gma=gordanz@martingale.ma.utexas.edu
export gf=gordanz@feller.ma.utexas.edu # or @linux34.ma.utexas.edu
export pm=mcudina@ssh.ma.utexas.edu # or @needs a key, no passwords
export gmac=gordanz@gordans-imac # local network
export WWWDIR=$gm:.www/

# git
export githttps=https://gordanz@github.com/gordanz
export gitssh=git@github.com:gordanz
export git=$gitssh

# other
export LC_ALL="en_US.UTF-8" # Language
export LANG="en_US"
export LESS_TERMCAP_md="${yellow}"; # Highlight section titles in man pages
export MANPAGER='less -X'; # Keep showing man page after exit
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket # nvim backward search

# ALIASES
####################################################################

# various
alias e='$EDITORCOMMAND'
alias cd='cd -P'

alias df='df -kTh'
alias dirsizes='du --max-depth=1 -h --exclude="\./\.*"'
#alias du='du -kh'       # Makes a more readable output.
alias ducksn='du -cks -- * | sort -nr'
alias ducks='du -cksh -- * | sort -hr'
alias echo='echo -e'
alias gpg="gpg2"
alias grep='grep -n --color'
alias grep='grep -n --color'
alias linkit='$DOTDIR/dotlinks.sh'
alias ll='ls -lA'
alias lmk='latexmk -pdf'
alias lmv='latexmk -pdf -pvc'
alias lmc='latexmk -pdf -pvc -view=none'
alias lmkx='latexmk -pdfxe'
alias mkdir='mkdir -p'
alias more='less'
alias mv='mv -vn'
alias nb='source newbuild'
#alias nvim='nvim --servername nvim-server'
alias psgrep='psgrep -i'
alias q='exit'
alias rmrf='trash'
hash trash 2>/dev/null || { alias rmrf='rm -rf'; }

alias rrr='rcm ; rch'
alias sai='sudo apt-get install'
alias which='type -a'

# Editing
alias ebashrc='$EDITORCOMMAND $HOME/.bashrc'
alias eb=ebashrc
alias emb='$OPENTEX $BIBDIR/mybib.bib'
alias emd='$OPENTEX $CLSDIR/mydefs/mydefs.sty'
alias emybib='$OPENTEX $BIBDIR/mybib.bib'
alias emydefs='$OPENTEX $CLSDIR/mydefs/mydefs.sty'
alias eprofile='$EDITORCOMMAND $HOME/.profile'
alias ep=eprofile
alias ezshenv='$EDITORCOMMAND $HOME/.zshenv'
alias ezshrc='$EDITORCOMMAND $HOME/.zshrc'
alias ez=ezshrc
alias open='$OPENCOMMAND'

# SSH aliases
alias sm='ssh $gm'
alias sma='ssh $gma'
alias sf='ssh $gf'
alias smac='ssh $gmac'
alias stac='ssh gordanz@stampede2.tacc.utexas.edu'

# Python
# alias python='python3'
# alias pip='pip3'
function jn() { jupyter notebook --notebook-dir `pwd` $1 > /tmp/jupyter-log.log 2>&1 &; }
function jl() { jupyter-lab > /tmp/jupyter-lab-log.log 2>&1 &; }
alias ca='conda activate `pwd`'

# tmux
alias tm="tmux new-session \; split-window -h -p 50\; select-pane -t 0"

# bookmark aliasesk 
source $BOOKMARKALIASES

# FUNCTIONS
############################################################

# WSL
alias eh='explorer.exe .'

# bookmark aliasses
source $BOOKMARKALIASES


# FUNCTIONS
############################################################

# Git functions
function clonegithub() { git clone "$git/$1" $2; }
function gcm() { git commit -a -m "No_message"; git push; }
function glog() { git log -1 --stat --pretty=format:"%H"; }
function gch() { git pull; }
function rcm() { for repo in "${GITS[@]}"; do pushd "$repo" ; echo ".... $repo"; git add . ; gcm; popd ; done ; }
function rch() { for repo in "${GITS[@]}"; do pushd "$repo" ; echo "....
  $repo"; gch ; popd ; done ; bm -r ;}

  # functions scp
function lcd() { `golocator $@` ; }
function cpd() { cp $@ ~/Desktop/ ; }
function drop() { cp $@ $DROPBOXDIR ; }
function scpp() { scp $@ $pm:~/.www/ ; }
function put() { scp $@ $gm:~/tmp ; }
function putfeller() { scp $@ $gf:~/Desktop/ ; }
function putwww() { scp $@ $gm:~/.www/ ; }
function putteach() { scp $@ $gm:~/.www/teaching ; }
function putnotes() { scp $@ $gm:~/.www/notes ; }
function putpp() { scp $@ $gm:~/.www/pp; }
function get() { scp $gm:~/tmp/$@ . ; }
function putslides() { scp $@ $gm:~/.www/slides/M362M/; };

function knit() {
    R -e "rmarkdown::render('$1')"
}

# search and replace with ag
function agr () {
  # find and replace
  regex=s/${1}/${2}/g;
  ag $1 -l | xargs sed -i.agr_backup $regex;
  # delete backups
  ag -G .agr_backup -l | xargs rm
}

# other alias-like functions

  # other alias-like functions
function bm() { bookmarks $@ ; source $BOOKMARKALIASES ; }

#
####################################################################
export PATH=$PATH:/bin:/usr/bin:/usr/local/bin:$HOME/bin:/usr/sbin:/usr/local/sbin:$HOME/local/bin:

if [[ "$OSTYPE" == darwin* ]]; then
	if [ -n "$brewdir"]; then
		export PATH=$PATH:$brewdir/coreutils/libexec/gnubin
                # ~/.dircolors/themefile
                eval $(gdircolors ~/.dircolors)

                # Aliases
                alias ls='gls --color=auto'
                alias ll='ls -al'
	fi
	export PATH=$PATH:/Library/TeX/texbin
        # make GNU commands available
        #export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
        #export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"
      else
                eval $(dircolors ~/.dircolors)
fi



export PATH=$PATH:/home/gordanz/.local/bin

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# THE END
