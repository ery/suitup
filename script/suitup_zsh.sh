
# relative
_script_relative_path="`dirname \"$0\"`"

# absolutized and normalized
_script_absolutized_path="`( cd \"$_script_relative_path\" && pwd )`"
if [ -z "$_script_absolutized_path" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi

_suitup_path="$_script_absolutized_path/.."

source "$_suitup_path/script/app.sh"
source "$_suitup_path/script/open.sh"
source "$_suitup_path/script/cd.sh"
source "$_suitup_path/script/edit.sh"
source "$_suitup_path/script/git.sh"
source "$_suitup_path/script/ruby.sh"
source "$_suitup_path/script/rails-db.sh"
source "$_suitup_path/script/rails-test.sh"
source "$_suitup_path/script/ssh.sh"
source "$_suitup_path/script/ps.sh"
source "$_suitup_path/script/solr.sh"
source "$_suitup_path/script/mysql.sh"
source "$_suitup_path/script/alias.sh"
