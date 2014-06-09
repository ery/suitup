
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

source "$_suitup_path/script/suitup.sh"
suitup-load-script $_suitup_path
