
function suitup-rails-assets-rebuild {
  bundle exec rake assets:clean RAILS_ENV=development
  bundle exec rake assets:precompile RAILS_ENV=development
}

function suitup-rails-show-log {
  tail -f log/development.log
}

function suitup-rails-show-log-production {
  tail -f log/production.log
}

function suitup-rails-show-log-test {
  tail -f log/test.log
}

function suitup-zeus-test {
  file=$1
  lable="test"
  echo -e "zeus \e[32m${lable}\e[0m $file"
  zeus test $file
  echo "===================================================="
  echo ""
}

function suitup-zeus-start {
  zeus start
}
