
function suitup-kill {
  for pid in `suitup-find-ps-id $1`
  do
    suitup-kill-pid $pid
  done
}

function suitup-kill-pid {
  pid=$1
  echo "Kill -9 $pid"
  sudo kill -9 $pid
}

function suitup-kill-nginx {
  suitup-run 'suitup-kill nginx'
}

function suitup-kill-redis {
  suitup-run 'suitup-kill redis'
}

function suitup-kill-resque {
  suitup-run 'suitup-kill resque'
}

function suitup-kill-unicorn {
  suitup-run 'suitup-kill unicorn'
}
