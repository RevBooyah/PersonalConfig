
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
alias bigtime='watch -n1 "date '+%D%n%T'|figlet -k -f big"'
alias topclock='while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &'
alias dups='find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate'
alias colors'for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done'
alias distro='cat /etc/issue'
alias memhogs='ps auxgww | sort -nk +4 | tail'
alias weather='curl -s wttr.in/87120'
alias weather2='curl =s v2.wttr.in/87120'


#I'm using vim - efficiency matters. My vim-golf-fu is strong...
alias v='/usr/local/bin/vim'

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
          *.xz)        unxz $1        ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.txz)       tar xvJf $1    ;;
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
mktxz() { tar cvJf "${1%%/}.txz" "${1%%/}/"; }

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

# Get unread gmail. $1 is username (email) and $2 is password
function unreadGmail() {
        curl -u $1:"$2" --silent "https://mail.google.com/mail/feed/atom" | tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' | sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p"
}

# recursive grep
function rgrep() {
        grep --color=auto -RnisI $1 *
}

function todo() {
        egrep --color -n -r --include=*.c --include=*.cpp --include=*.py --include=*.r --include=*.js --include=*.css --include=*.sh --include=*.php -i "todo" *
} 

# ls with a "tree" view.
function tree() {
        ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'
}

function hostConnections() {
        netstat -an | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1) ; for (i = 0; i < $1; i++) {printf("*")}; print "" }'
}
# ps with a grep (I do this a lot, so why not shorten?)
function psg() {
        ps auxgww | egrep $@
}

# Intercept the stdio/err of the process id (1st arg is the proc id
function intercept() {
        strace -ff -e trace=write -e write=1,2 -p $1
}

function ripsite() {
        wget --random-wait -r -p -e robots=off -U mozilla $@
#        --limit-rate=20k limits the rate at which it downloads files.
#       -b continues wget after logging out.
#       -o $HOME/wget_log.txt logs the output
}

function getYoutube() {
        wget http://www.youtube.com/watch?v=$1 -qO- | sed -n "/fmt_url_map/{s/[\'\"\|]/\n/g;p}" | sed -n '/^fmt_url_map/,/videoplayback/p' | sed -e :a -e '$q;N;5,$D;ba' | tr -d '\n' | sed -e 's/\(.*\),\(.\)\{1,3\}/\1/' | wget -i - -O output.flv
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
