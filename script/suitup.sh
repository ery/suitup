
# suitup-load-script path
function suitup-load-script {
  local _suitup_path=$1
  source "$_suitup_path/script/app.sh"
  source "$_suitup_path/script/open.sh"
  source "$_suitup_path/script/cd.sh"
  source "$_suitup_path/script/edit.sh"
  source "$_suitup_path/script/git.sh"
  source "$_suitup_path/script/ps.sh"
  source "$_suitup_path/script/kill.sh"
  source "$_suitup_path/script/alias.sh"
}
