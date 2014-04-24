
function suitup-edit-some {
  ( sublime $1 & )
}

function suitup-edit-hosts {
  ( sudo sublime /etc/hosts )
}

function suitup-edit-suitup {
  suitup-edit-some $_suitup_path
}
