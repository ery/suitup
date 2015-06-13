
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
  local MESSAGE=$1
  local AUTHOR=$2

  if [ -z "$MESSAGE" ]; then
    MESSAGE="No Message."
  fi

  git add .

  if [ -n "$AUTHOR" ]; then
    git commit -am $MESSAGE --author=$AUTHOR
  else
    git commit -am $MESSAGE
  fi
}

# suitup-git-commit-push 'update'
# suitup-git-commit-push 'update' 'Jack <jack@gmail.com>'
function suitup-git-commit-push {
  suitup-git-commit $1 $2
  suitup-git-push
}

function suitup-git-recovery {
  COMMIT=$1
  if [ -z "$COMMIT" ]; then
    COMMIT=$(suitup-git-current-remote-branch)
  fi

  git reset $COMMIT
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
# What is differents between last and TARGET commits?
# If TARGET commit id is cdf987c1bdf2dfc1e910216804e78ac7ac3700f2.
# Then input:
# suitup-git-diff cdf987c1bdf2dfc1e910216804e78ac7ac3700f2
function suitup-git-diff {
  local TARGET=$1
  if [ -z "$TARGET" ]; then
    echo 'Must input a commit id'
    return
  fi

  local OUTPUT_FILE=/tmp/suitup.git.diff
  rm -f $OUTPUT_FILE
  touch $OUTPUT_FILE

  echo ''                                          >> $OUTPUT_FILE
  echo "suitup-git-diff"                           >> $OUTPUT_FILE
  echo "Between HEAD and $TARGET"                  >> $OUTPUT_FILE
  echo '=========================================' >> $OUTPUT_FILE
  echo ''                                          >> $OUTPUT_FILE
  suitup-run "git log HEAD -n 1"                   >> $OUTPUT_FILE
  suitup-run "git log $TARGET -n 1"                >> $OUTPUT_FILE
  suitup-run "git diff $TARGET -C --shortstat"     >> $OUTPUT_FILE
  suitup-run "git diff $TARGET -C --stat"          >> $OUTPUT_FILE
  suitup-run "git diff $TARGET -C --name-status"   >> $OUTPUT_FILE
  suitup-run "git diff $TARGET -C"                 >> $OUTPUT_FILE

  echo "suitup-git-diff output: $OUTPUT_FILE"

  suitup-edit $OUTPUT_FILE
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
  local TARGET=$1
  if [ -z "$TARGET" ]; then
    echo 'Must input a commit id'
    return
  fi

  local CURRENT_TIME=$(date '+%Y%m%d%H%M%S')
  local OUTPUT_FILE="/tmp/suitup.git.show.${CURRENT_TIME}.${TARGET}.git.diff"

  rm -f $OUTPUT_FILE

  git show $TARGET >> $OUTPUT_FILE

  echo "suitup-git-show output: $OUTPUT_FILE"

  suitup-edit $OUTPUT_FILE
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
