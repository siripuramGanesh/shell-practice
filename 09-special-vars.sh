#!/bin/bash
echo "all vars passed to the script:$@"
echo "how many vars passed to the script:$#"
echo "name of the script :$0"
echo "current working directory :$PWD"
echo "home directory of user :$HOME"
echo "process instant id of the script executing now: $$"
sleep 100&
echo "pid of bg running process:$!"