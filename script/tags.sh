
function suitup-tags {
  local project_path=`pwd`
  local gem_path=~/.rvm/gems/`rvm current`/gems

  rm -f $project_path/tags
  rm -f $project_path/.tags
  rm -f $gem_path/tags
  rm -f $gem_path/.tags

  ctags-exuberant --languages="Ruby" -f $project_path/tags -R $project_path $gem_path
  ctags-exuberant --languages="Ruby" -f $gem_path/tags -R $gem_path

  ln -s $project_path/tags $project_path/.tags
  ln -s $gem_path/tags $gem_path/.tags

  suitup-tags-status
}

function suitup-tags-status {
  local project_path=`pwd`
  local gem_path=~/.rvm/gems/`rvm current`/gems

  echo "Project Tags"
  echo "................................"
  du -h $project_path/.tags
  du -h $project_path/tags
  echo ""

  echo "Gem Tags"
  echo "................................"
  du -h $gem_path/.tags
  du -h $gem_path/tags
  echo ""
}

function suitup-tags-clean {
  local project_path=`pwd`
  local gem_path=~/.rvm/gems/`rvm current`/gems

  rm -f $project_path/.tags
  rm -f $project_path/tags
  rm -f $gem_path/.tags
  rm -f $gem_path/tags

  echo "Clean Tags."
}