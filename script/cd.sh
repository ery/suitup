
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

function suitup-cd-gemset {
  gem_name=`rvm current`
  cd ~/.rvm/gems/$gem_name/gems
}
