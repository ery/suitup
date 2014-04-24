
function suitup-tags {
  ctags -R . 2> /tmp/log
  rm .tags
  ln -s tags .tags
  ll tags -h
}
