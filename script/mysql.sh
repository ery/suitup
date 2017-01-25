VAR_SUITUP_MYSQL_USER='root'
VAR_SUITUP_MYSQL_PASSWORD='root'

function suitup-mysql-show-log {
  tail -f /var/log/mysql/mysql.log
}

function suitup-mysql-command {
  command="${1}"

  user=${VAR_SUITUP_MYSQL_USER}
  password=${VAR_SUITUP_MYSQL_PASSWORD}

  echo ${command}

  mysql -u${user} -p${password} -e${command}
}

function suitup-mysql-command-db {
  database=${1}
  command="${2}"

  user=${VAR_SUITUP_MYSQL_USER}
  password=${VAR_SUITUP_MYSQL_PASSWORD}

  echo ${command}

  mysql -u${user} -p${password} ${database} -e${command}
}

function suitup-mysql-script {
  database=${1}
  script=${2}

  user=${VAR_SUITUP_MYSQL_USER}
  password=${VAR_SUITUP_MYSQL_PASSWORD}

  mysql -u${user} -p${password} ${database} < ${script}
}

function suitup-mysql-show-tables {
  database=${1}
  suitup-mysql-command-db ${database} "SHOW TABLES"
}

function suitup-mysql-select-table {
  database=${1}
  table=${2}
  columns=$3

  if [ -n "${columns}" ]; then
    columns=${columns}
  else
    columns="*"
  fi

  suitup-mysql-command-db ${database} "SELECT ${columns} FROM ${table} LIMIT 200"
}

function suitup-mysql-desc-table {
  database=${1}
  table=${2}

  suitup-mysql-command-db ${database} "DESC ${table}"
}

function suitup-mysql-show-index {
  database=${1}
  table=${2}

  suitup-mysql-command-db ${database} "SHOW INDEX FROM ${table}"
}

function suitup-mysql-show-databases {
  suitup-mysql-command 'SHOW DATABASES'
}

function suitup-mysql-drop-database {
  database=${1}
  suitup-mysql-command "DROP DATABASE IF EXISTS ${database}"
}

function suitup-mysql-create-database {
  database=${1}
  suitup-mysql-command "CREATE DATABASE IF NOT EXISTS ${database} DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci"
}


# suitup-mysql-backup server    database user password local_folder
# suitup-mysql-backup jason.com blog     red  redps    ~/backup/jason_blog
function suitup-mysql-backup {
  server=$1
  database=${2}
  user=$3
  password=$4
  local_folder=$5

  current_time=$(date '+%Y%m%d_%H%M')
  file="${database}_${current_time}.sql"
  local_file="${local_folder}/${file}"
  server_folder="~/backup/${database}"
  server_file="${server_folder}/${file}"

  echo "---------------------------------"
  echo "Backup ${database} (MySQL Database)."
  echo ""

  echo "Server: ${server}"
  echo "Databse: ${database}"
  echo "Local File: ${local_file}"
  echo "Serve File: ${server_file}"
  echo ""

  mkdir -p $local_folder
  ssh $server "mkdir -p ${server_folder}"

  echo "Dumping MySQL Database ${database} ...."
  ssh $server "mysqldump --opt --user=$user --password=$password ${database} > $server_file"
  echo ""

  echo "Downloading backup file ...."
  scp $server:$server_file $local_file
  echo ""

  echo "Check backup file."
  du -h $local_file
  echo ""

  echo "Backup done."
  echo "---------------------------------"
  echo ""
}
