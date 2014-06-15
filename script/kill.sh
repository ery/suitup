
function suitup-kill-nginx {
  suitup-run 'suitup-kill nginx'
}

function suitup-kill-redis {
  suitup-run 'suitup-kill redis'
}

function suitup-kill-resque {
  suitup-run 'suitup-kill resque'
}

function suitup-kill-unicorn {
  suitup-run 'suitup-kill unicorn'
}
