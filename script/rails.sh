
function suitup-rails-assets-rebuild {
  bundle exec rake assets:clean RAILS_ENV=development
  bundle exec rake assets:precompile RAILS_ENV=development
}

function suitup-rails-show-log-all {
  tail -f log/development.log
}

# suitup-rails-show-log
# suitup-rails-show-log keyword
function suitup-rails-show-log {
  key_word=$1
  if [ -n "$key_word" ]; then
    tail -f log/development.log | grep $key_word -C10
  else
    tail -f log/development.log
  fi
}

function suitup-rails-show-log-production {
  key_word=$1
  if [ -n "$key_word" ]; then
    tail -f log/production.log | grep $key_word -C10
  else
    tail -f log/production.log
  fi
}

function suitup-rails-show-log-test {
  key_word=$1
  if [ -n "$key_word" ]; then
    tail -f log/test.log | grep $key_word -C10
  else
    tail -f log/test.log
  fi
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
