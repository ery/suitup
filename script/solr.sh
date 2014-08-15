
function suitup-solr-status {
  suitup-run 'suitup-find-ps solr'
}

function suitup-solr-run {
  suitup-run 'rake sunspot:solr:start'
}

function suitup-solr-run-test {
  suitup-run 'rake sunspot:solr:start RAILS_ENV=test'
}

function suitup-solr-stop {
  suitup-run 'rake sunspot:solr:stop'
}

function suitup-solr-kill {
  suitup-run 'suitup-kill solr'
}

function suitup-solr-reindex {
  suitup-run 'rake sunspot:reindex'
}
