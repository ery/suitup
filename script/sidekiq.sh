
function suitup-ps-sidekiq {
  ps aux | grep -v grep | grep sidekiq
}
