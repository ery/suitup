
function suitup-solr-ps {
  suitup-find-ps solr
}

function suitup-solr-kill {
  suitup-kill-ps solr
}

function suitup-solr-run {
  rake sunspot:solr:run
}

function suitup-solr-start {
  rake sunspot:solr:start
}

function suitup-solr-stop {
  rake sunspot:solr:stop
}

function suitup-solr-reindex {
  rake sunspot:reindex
}