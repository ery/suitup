
# suitup-rails-batch-test
##################################################################################
# suitup-rails-batch-test-prepare
# suitup-rails-batch-test-add test/functional/day_sale_reports_controller_test.rb
# suitup-rails-batch-test-add test/functional/month_sale_reports_controller_test.rb
# suitup-rails-batch-test-run

RUBY_MULTI_TEST="/tmp/ruby_multi_test.rb"

function suitup-rails-batch-test-prepare {
  sudo rm $RUBY_MULTI_TEST 2> /dev/null
}

function suitup-rails-batch-test-add {
  WORK_FOLDER=`pwd`
  echo "require '$WORK_FOLDER/$1' " >> $RUBY_MULTI_TEST
}

function suitup-rails-batch-test-status {
  cat $RUBY_MULTI_TEST 2> /dev/null
}

function suitup-rails-batch-test-run {
  suitup-rails-batch-test-status
  ruby -I test/ $RUBY_MULTI_TEST
}
