
#suitup-ssh-host-reboot vm115
#suitup-ssh-host-reboot neo@vm115
function suitup-ssh-host-reboot {
  local host=$1
  ssh $host "sudo reboot"
}

#suitup-ssh-host-poweroff vm115
#suitup-ssh-host-poweroff neo@vm115
function suitup-ssh-host-poweroff {
  local host=$1
  ssh $host "sudo poweroff"
}
