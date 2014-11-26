
function suitup-rails-db-reset {
  rake db:drop
  rake db:create
  rake db:migrate
}

function suitup-rails-db-reset-development {
  rake db:drop    RAILS_ENV=development
  rake db:create  RAILS_ENV=development
  rake db:migrate RAILS_ENV=development
}

function suitup-rails-db-reset-test {
  rake db:drop    RAILS_ENV=test
  rake db:create  RAILS_ENV=test
  rake db:migrate RAILS_ENV=test
}

function suitup-rails-db-reset-production {
  rake db:drop    RAILS_ENV=production
  rake db:create  RAILS_ENV=production
  rake db:migrate RAILS_ENV=production
}

function suitup-rails-db-mysql-schema-version {
  suitup-mysql-command $1 "SELECT * FROM schema_migrations ORDER BY version DESC LIMIT 20"
}