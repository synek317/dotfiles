#!/bin/bash

#git
alias gst='git status'
alias gd='git diff'
alias gup='git pull --rebase'
alias gc='git commit -v'
alias gca='git commit -v --amend -m'
alias gc!='git commit -v --amend --no-edit'
alias gco='git checkout'
alias glog='git log --oneline --decorate --color --graph'

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

alias ggpull='git pull origin $(current_branch)'
alias ggreset='git reset --hard origin/$(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpush!='git push --force origin $(current_branch)'

#ruby
alias bi='bundle install'
alias be='bundle exec'
alias ber='bundle exec rake'
alias bert='bundle exec rake -T'

#ssh
alias pozpmx2='ssh pozpmx2'
alias pozpp3='ssh pozpp3'
alias pozpp4='ssh pozpp4'
alias pozpp5='ssh pozpp5'
alias pozppacc='ssh pozppacc'
alias tfr1='ssh tfr1'
alias tfr2='ssh tfr2'
alias maint1='ssh maint1'
alias maint2='ssh maint2'

#.dotfiles
alias update='~/install.sh --dotfiles'

#exports
alias ei_vlcb_ari='echo 54d27e3212886b20c800000d'