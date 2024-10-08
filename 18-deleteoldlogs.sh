
SOURCE_DIR=/home/ec2-user/logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR  $G exist $N"
else
    echo -e "$SOURCE_DIR $R doesnot exist $N"
fi

FILES=$(find /home/ec2-user/logs -name "*.log" -mtime +14)
echo "Files: $FILES"

while IFS= read -r file #IFS,internal field seperator,empty it will ignore white space
do              #-r is for not to ignore special 
    echo "Deleting file : $file"
    rm -rf $file
done <<< $FILES