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
  adb $* shell dumpsys activity activities | grep Hist
}

function pprov() {
  security cms -D -i $1
}

function gi() {
  curl -L -s https://www.gitignore.io/api/$@ ;
}

function adb-backup() {
  adb backup $1
  dd if=backup.ab bs=1 skip=24 | python -c "import zlib,sys;sys.stdout.write(zlib.decompress(sys.stdin.read()))" | tar -xvf -
}
