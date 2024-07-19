# only because I like ll
alias ll='ls -l'

# color setting: enable color support for ls and add handy aliases
export CLICOLOR=1
export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=32:bd=34;46:cd=34;43:su=37;41:sg=30;43:tw=30;42:ow=34;42:"
alias ls='ls --color=auto'

# Optional: Customize the prompt with colors
PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\w\[\033[00m\]\$ '


# do this after /cvmfs/sw-nightlies.hsf.org/key4hep/setup.sh to warm up ROOT
echo $ROOTSYS
ls $ROOTSYS/lib/root/libCore.so
ls $ROOTSYS/bin/root
