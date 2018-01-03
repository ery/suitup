
function suitup-reload-bashrc {
  source ~/.bashrc
}

function suitup-reload-zshrc {
  source ~/.zshrc
}

function suitup-path {
  echo $_suitup_path
}

# suitup-show suitup-path
function suitup-show {
  type -f $1
}

function suitup-run {
  COMMAND=$1
  echo "Run: $COMMAND"
  echo "------------------------------------"
  eval $COMMAND
  echo ""
}

function suitup-upgrade {
  suitup-cd-suitup
  git pull
}

# suitup_load /home/tom/Documents/github/
function suitup-load {
  local _suitup_path="$1/.suitup"

  [[ -s $_suitup_path ]] && source $_suitup_path
}
