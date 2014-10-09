
function suitup-find-ps {
  ps aux | grep -v grep | grep $1
}

function suitup-find-ps-id {
  ps aux | grep -v grep | grep $1 | awk '{print $2}'
}
