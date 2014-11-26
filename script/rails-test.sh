
# suitup-rails-test
##################################################################################

function suitup-rails-test {
  time ruby -I test/ "$1"
}

function suitup-rails-test-units {
  suitup-rails-db-reset-test
  time rake test:units RAILS_ENV=test
}

function suitup-rails-test-functionals {
  suitup-rails-db-reset-test
  time rake test:functionals RAILS_ENV=test
}

function suitup-rails-test-integration {
  suitup-rails-db-reset-test
  time rake test:integration RAILS_ENV=test
}

function suitup-rails-test-all {
  suitup-rails-db-reset-test
  time rake test RAILS_ENV=test
}

