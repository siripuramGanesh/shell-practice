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

if [ ! -d $SOURCE_FILE ]
then
    echo "$SOURCE_FILE doesnot exist please check "
    exit 1
fi

if [ ! -d $DEST_FILE ]
then 
    echo "$DEST_FILE doesnot exist please check "
    exit 1
fi

FILES=$(find $SOURCE_FILE -name "*.log" -mtime +14)

if [ ! -z $FILES ]
then    
    echo "files are found"
else    
    echo "files are not found"
fi

