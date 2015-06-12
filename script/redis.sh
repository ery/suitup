
function suitup-redis-run {
  redis-server /etc/redis.conf
}

function suitup-redis-status {
  suitup-find-ps 'redis'
}

function suitup-redis-clear {
  suitup-run 'redis-cli keys "*"'
  suitup-run 'redis-cli flushdb'
  suitup-run 'redis-cli keys "*"'
}

function suitup-redis-list {
  suitup-run 'redis-cli keys "*"'
}
