
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
