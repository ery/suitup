
function suitup-cd-realpath {
  cd `realpath .`
  pwd
}

function suitup-realpath {
  realpath .
}

function suitup-cd-suitup {
  cd $_suitup_path
}
