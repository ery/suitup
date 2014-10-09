
function suitup-edit-some {
  ( sublime-text $1 & )
}

function suitup-edit-hosts {
  ( sudo sublime-text /etc/hosts )
}

function suitup-edit-suitup {
  suitup-edit-some $_suitup_path
}
