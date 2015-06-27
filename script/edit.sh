
function suitup-edit {
  ( sublime-text $1 & )
}

function suitup-edit-hosts {
  ( sudo sublime-text /etc/hosts )
}

function suitup-edit-suitup {
  suitup-edit $_suitup_path
}

function sublime-text-mac {
  open -a "Sublime Text" $1
}
