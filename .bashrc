
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -la'
alias taillog='tail -f /var/log/maillog'
#alias ls='ls --color=auto' # I do this near the end already.
alias mkdir='mkdir -p -v'
alias df='df -h'
alias du='du -h -c'
alias reload='source ~/.bashrc'
alias biggest='BLOCKSIZE=1048576; du -x | sort -nr | head -10'
alias mwatch='watch "echo stats | nc 127.0.0.1 11211"'
alias stamp='date "+%Y%m%d%a%H%M"'
alias da='date "+%Y-%m-%d %A    %T %Z"'
alias ports='netstat -nape --inet'
alias kernal='uname -smr'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export EDITOR="vim"
export VISUAL="vim"

export JAVA_HOME=/usr/lib/jvm/jre-1.6.0-openjdk.x86_64
#export M2_HOME=/usr/local/maven
#export PATH=${M2_HOME}/bin:${PATH}
export M2_HOME=/usr/local/maven
export PATH=/usr/local/mahout/trunk/bin:${M2_HOME}/bin:${PATH}

extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# Makes directory then moves into it
function mkcdr {
    mkdir -p -v $1
    cd $1
}

# Creates an archive from given directory - I should use these more - but I never remember...
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }


# requires gpg
# the proper way to use these functions is simply to enter "encrypt filename" or "decrypt filename"
encrypt ()
{
gpg -ac --no-options "$1"
}

decrypt ()
{
gpg --no-options "$1"
}

function ii() # get current host related info
{
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Memory stats :$NC " ; free
    my_ip 2>&. ;
    echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:."Not connected"}
    echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:."Not connected"}
    echo
}

# enable color support of ls and also add handy aliases
unamestr=`uname`
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.php=36:*.html=37'
    export LS_COLORS
elif [[ "$unamestr" == 'Darwin' ]]; then
    alias ls='ls -G'
    alias grep='grep -G'
    alias fgrep='fgrep -G'
    alias egrep='egrep -G'
    export LSCOLORS=dxfxcxdxbxegedabagacad
fi

# Set the prompt:
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
