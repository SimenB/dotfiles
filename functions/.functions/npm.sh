#!/bin/sh

function npm-pack-info {
  if [ "$#" -ne 1 ] || ! [ -d "$1" ]; then
    echo 'provide folder'
    return 85
  fi

  tarball="$(npm pack "$1" --silent)"
  while [ ! -f "$tarball" ]
  do
    sleep 2
  done
  wc -c "${tarball}"
  tar tvf "${tarball}"
  rm "${tarball}"
}
