function pwdf() {
  osascript 2> /dev/null << EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

function tree() {
  if [[ $# -eq 0 ]]; then
    DIR="."
  else
    DIR=$1
  fi
  find $DIR -print | sort | sed 's;[^/]*/;|___;g;s;___|; |;g'
}

function aastack() {
  adb shell dumpsys activity activities | grep Hist
}

function rapk() {
  if [ "$1" = "" ]; then
    exit 1
  fi

  CUR=`pwd`
  DIR=`mktemp -d -t rapk`
  cd $DIR
  unzip $CUR/$1 > /dev/null
  dex2jar.sh classes.dex > /dev/null 2>&1
  unzip -l classes_dex2jar.jar
  cd $CUR
}
