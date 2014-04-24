Host_Local_Folder_Base=~/Desktop

#suitup-ssh-host-reboot vm115
#suitup-ssh-host-reboot neo@vm115
function suitup-ssh-host-reboot {
  Host=$1
  ssh $Host "sudo reboot"
}

#suitup-ssh-host-poweroff vm115
#suitup-ssh-host-poweroff neo@vm115
function suitup-ssh-host-poweroff {
  Host=$1
  ssh $Host "sudo poweroff"
}

# suitup-sshfs-open vm102 server-vm102
# suitup-sshfs-open vm102 neo@server-vm102:/
# suitup-sshfs-open vm102 neo@server-vm102:/home
complete -F _known_hosts suitup-sshfs-open 2> /dev/null
function suitup-sshfs-open {
  Host_Local_Folder="$Host_Local_Folder_Base/$1"
  Host_Server_Address=$2

  mkdir -p $Host_Local_Folder
  sshfss $Host_Server_Address $Host_Local_Folder
  echo "---------------------------"
  echo "Host Local Folder: $Host_Local_Folder"
  ls -l $Host_Local_Folder
  cd $Host_Local_Folder
  pwd
}

# suitup-sshfs-close server-vm101
function suitup-sshfs-close {
  Host_Local_Folder="$Host_Local_Folder_Base/$1"

  cd ~
  fusermount -u $Host_Local_Folder
  rm -rf $Host_Local_Folder
  pwd
}
