
# suitup-load-script path
function suitup-load-script {
  _suitup_path=$1
  source "$_suitup_path/script/app.sh"
  source "$_suitup_path/script/open.sh"
  source "$_suitup_path/script/xdg-open.sh"
  source "$_suitup_path/script/cd.sh"
  source "$_suitup_path/script/edit.sh"
  source "$_suitup_path/script/git.sh"
  source "$_suitup_path/script/tags.sh"
  source "$_suitup_path/script/rails.sh"
  source "$_suitup_path/script/rails-db.sh"
  source "$_suitup_path/script/rails-test.sh"
  source "$_suitup_path/script/ssh.sh"
  source "$_suitup_path/script/ps.sh"
  source "$_suitup_path/script/solr.sh"
  source "$_suitup_path/script/mysql.sh"
  source "$_suitup_path/script/redis.sh"
  source "$_suitup_path/script/kill.sh"
  source "$_suitup_path/script/zeus.sh"
  source "$_suitup_path/script/alias.sh"
}
