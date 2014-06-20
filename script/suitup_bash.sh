function suitup-current-dir {
  cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd
}

_suitup_path="$(suitup-current-dir)/.."

source "$_suitup_path/script/suitup.sh"
suitup-load-script $_suitup_path
