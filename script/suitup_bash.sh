function suitup-current-dir {
  cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd
}

_suitup_path="$( suitup-current-dir )/.."

source "$_suitup_path/script/app.sh"
source "$_suitup_path/script/open.sh"
source "$_suitup_path/script/cd.sh"
source "$_suitup_path/script/edit.sh"
source "$_suitup_path/script/git.sh"
source "$_suitup_path/script/tags.sh"
source "$_suitup_path/script/rails-db.sh"
source "$_suitup_path/script/rails-test.sh"
source "$_suitup_path/script/ssh.sh"
source "$_suitup_path/script/ps.sh"
source "$_suitup_path/script/solr.sh"
source "$_suitup_path/script/alias.sh"
