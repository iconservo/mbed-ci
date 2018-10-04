#!/bin/sh
if [ -z $1 ] ; then
  echo "Usage: format <dir> [ maxdepth ]"
  exit 1
fi

MAXDEPTH=$2
if [ -z $2 ] ; then
  MAXDEPTH=30
fi
find $1 -maxdepth $MAXDEPTH -type f \( -iname "*.h" -or -iname "*.hpp" -or -iname "*.cpp" -or -iname "*.c" \) \
   -exec clang-format -style=file -i {} \; -print


modified=$(git ls-files --modified)

if [ "$modified" ]; then
    echo "Files with source code formatting:"
    echo $modified
    exit 1
else
    echo "All files verified for expected source code formatting"
    exit 0
fi