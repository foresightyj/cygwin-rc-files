alias vi='vim'
alias rmtemp='rm *~'
alias rmswp='rm -f .*.swp .*.swo'
alias gitpushall='git push -u --all origin'

HISTFILESIZE=5000


#copied from some guy's
# some more ls aliases
alias ls="ls --color=auto"
alias ll='ls -alh' 
alias la='ls -A' 
# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r | less"
# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print0 | xargs -0 -I{} du -sk {} | sort -nr"


alias vimhc='vim *.{c,h}'
alias gitrmdeleted='git ls-files -z --deleted | xargs -I{} --null git rm {}'



