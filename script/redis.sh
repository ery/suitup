
function suitup-redis-clear {
  suitup-run 'redis-cli keys "*"'
  suitup-run 'redis-cli flushdb'
  suitup-run 'redis-cli keys "*"'
}

function suitup-redis-list {
  suitup-run 'redis-cli keys "*"'
}
