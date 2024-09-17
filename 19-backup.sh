 #!/bin/bash

 SOURCE_FILE=$1
 DEST_FILE=$2
 DAYS=${3:-14}

USAGE(){
    echo "USAGE: sh 19-backup.sh <source> <destination> <days>"
}
 if [ $# -lt 2 ]
 then 
    USAGE
fi