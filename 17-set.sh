#!bin/bash

#set -ex

#set -e is to stop the execution when there is any error at a specific line

failure(){
    echo "failed at $1:$2"
}
trap  'failure "${LINENO}" "$BASH_COMMAND"' ERR

echo "hello world"
echoooo "helloooooo"
echo "world hello"