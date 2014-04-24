
function suitup-find-ps {
  ps aux | grep -v grep | grep $1
}

function suitup-find-ps-id {
  ps aux | grep -v grep | grep $1 | awk '{print $2}'
}

function suitup-kill-all {
  for pid in `suitup-find-ps-id $1`
  do
    suitup-kill $pid
  done
}

function suitup-kill {
  pid=$1
  echo "Kill $pid"
  sudo kill $pid
}
