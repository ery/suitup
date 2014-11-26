
function suitup-path {
  echo $_suitup_path
}

# suitup-show suitup-path
function suitup-show {
  type -f $1
}

function suitup-reload-bashrc {
  source ~/.bashrc
}

function suitup-reload-zshrc {
  source ~/.zshrc
}

function suitup-gem-remove-all {
  for gem_name in `gem list --no-versions`
  do
    gem uninstall $gem_name -a -x -I
  done
}

function suitup-rm-ssh-known-hosts {
  rm ~/.ssh/known_hosts
}

function suitup-run {
  COMMAND=$1
  echo "Run: $COMMAND"
  echo "------------------------------------"
  eval $COMMAND
  echo ""
}

function suitup-bash-ps1-color {

  Black="\[\033[1;30m\]"
  Red="\[\033[1;31m\]"
  Green="\[\033[1;32m\]"
  Yellow="\[\033[0;33m\]"
  Blue="\[\033[1;34m\]"
  Magenta="\[\033[1;35m\]"
  Cyan="\[\033[1;36m\]"
  White="\[\033[0m\]"

  C_Mark=$White
  C_User=$Blue
  C_Host=$White
  C_Folder=$Blue
  C_Branch=$Yellow

  #PS1="\$(~/.rvm/bin/rvm-prompt v g)-\u:\W\$ "
  #PS1="\u:\W\$ "
  #PS1="\w:$YELLOW\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)$WHITE\$ "
  #PS1="\u:\W:$YELLOW\$(git-current-branch)$WHITE\$ "
  #PS1="$BRIGHTBLUE\u:$WHITE\W:$YELLOW\$(git-current-branch)$WHITE\$ "

  PS1="$C_User\u$C_Mark@$C_Host\h$C_Mark:$C_Folder\W$C_Mark:$C_Branch\$(suitup-git-current-branch)$C_Mark\$ $WHITE"
}

function suitup-hostname-setup {
  local host_name=$1
  sudo bash -c "echo '127.0.0.1 $host_name' >> /etc/hosts"
  sudo bash -c "echo '$host_name' > /etc/hostname"
  sudo hostname $host_name
}

function suitup-hostname {
  hostname
}

function suitup-upgrede {
  suitup-cd-suitup
  git pull
}
