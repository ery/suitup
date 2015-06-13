
# Commit Push
##############################################

function suitup-git-push {
  git push origin HEAD
}

function suitup-git-push-force {
  git push origin HEAD --force
}

# suitup-git-commit 'update'
# suitup-git-commit 'update' 'Jack <jack@gmail.com>'
function suitup-git-commit {
  local message=$1
  local author=$2

  if [ -n "$message" ]; then
    message="$message"
  else
    message="No message."
  fi

  git add .

  if [ -n "$author" ]; then
    git commit -am $message --author=$author
  else
    git commit -am $message
  fi
}

# suitup-git-commit-push 'update'
# suitup-git-commit-push 'update' 'Jack <jack@gmail.com>'
function suitup-git-commit-push {
  suitup-git-commit $1 $2
  suitup-git-push
}

function suitup-git-recovery {
  commit=$1
  if [ -z "$commit" ]; then
    commit=$(suitup-git-current-remote-branch)
  fi

  git reset $commit
}

# suitup-git-recovery-commit 'update'
# suitup-git-recovery-commit 'update' 'Jack <jack@gmail.com>'
function suitup-git-recovery-commit {
  suitup-git-recovery
  suitup-git-commit $1 $2
}

# suitup-git-recovery-commit-push 'update'
# suitup-git-recovery-commit-push 'update' 'Jack <jack@gmail.com>'
function suitup-git-recovery-commit-push {
  suitup-git-recovery
  suitup-git-commit $1 $2
  suitup-git-push
}

# View
##############################################

function suitup-git-status {
  git status
}

function suitup-git-log {
  git log --graph --pretty=format:'%Cred%h%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset -%C(yellow)%d%Creset' --abbrev-commit
}

# If you want to konw?
# What is differents between last and target commits?
# If target commit id is cdf987c1bdf2dfc1e910216804e78ac7ac3700f2.
# Then input:
# suitup-git-diff cdf987c1bdf2dfc1e910216804e78ac7ac3700f2
function suitup-git-diff {
  local target=$1
  if [ -z "$target" ]; then
    echo 'Must input a commit id'
    return
  fi

  local output_file=/tmp/suitup.git.diff
  rm $output_file 2> /dev/null
  touch $output_file

  echo '-----------------------------------------' >> $output_file
  echo ''                                          >> $output_file
  echo "suitup-git-diff"                           >> $output_file
  echo "Between HEAD and $target"                  >> $output_file
  echo ''                                          >> $output_file

  function run-command {
    echo '-----------------------------------------'
    echo ''
    echo "$ $1"
    echo ''
    eval $1
  }

  run-command "git log HEAD -n 1"                 >> $output_file
  run-command "git log $target -n 1"              >> $output_file
  run-command "git diff $target -C --shortstat"   >> $output_file
  run-command "git diff $target -C --stat"        >> $output_file
  run-command "git diff $target -C --name-status" >> $output_file
  run-command "git diff $target -C"               >> $output_file

  echo "suitup-git-diff output: $output_file"

  suitup-edit $output_file
}

function suitup-git-diff-master {
  suitup-git-diff master
}

function suitup-git-diff-develop {
  suitup-git-diff develop
}

function suitup-git-diff-remote {
  suitup-git-diff $(suitup-git-current-remote-branch)
}

function suitup-git-show {
  local target=$1
  if [ -z "$target" ]; then
    echo 'Must input a commit id'
    return
  fi

  local current_time=$(date '+%Y%m%d%H%M%S')
  local output_file="/tmp/suitup.git.show.${current_time}.${target}.git.diff"

  rm -f $output_file

  git show $target >> $output_file

  echo "suitup-git-show output: $output_file"

  suitup-edit $output_file
}

# Other
##############################################

function suitup-git-current-branch {
  git branch 2>/dev/null | grep '^*' | colrm 1 2
}

function suitup-git-current-remote-branch {
  local current_branch=$(suitup-git-current-branch)
  local remote_branch=`git config branch.${current_branch}.merge | colrm 1 11`
  echo "origin/${remote_branch}"
}

# Tag
##############################################
function suitup-git-tag-release {
  CURRENT_TIME=$(date '+%Y%m%d%H%M')
  TAG_NAME="release_${CURRENT_TIME}" #release_201506121810

  suitup-run "git tag ${TAG_NAME}"
  suitup-run "git push origin --tags"
}

function suitup-git-tag-delete {
  TAG_NAME=$1

  if [ -z "$TAG_NAME" ]; then
    echo 'Must input a tag name'
    return
  fi

  suitup-run "git tag -d ${TAG_NAME}"
  suitup-run "git push origin :refs/tags/${TAG_NAME}"
}


# Work Flow
##############################################

# suitup-git-create-branch new_customer
# suitup-git-create-branch new_customer develop
function suitup-git-create-branch {
  NEW_BRANCH=$1
  BASE_BRANCH=$2

  if [ -z "${NEW_BRANCH}" ]; then
    echo 'Must input a new branch name'
    return
  fi

  if [ -z "${BASE_BRANCH}" ]; then
    BASE_BRANCH="master"
  fi

  suitup-run "git checkout ${BASE_BRANCH}"
  suitup-run "git fetch"
  suitup-run "git merge origin/${BASE_BRANCH}"
  suitup-run "git push origin HEAD:${NEW_BRANCH}"
  suitup-run "git checkout ${NEW_BRANCH}"
}
