
SOURCE_DIR=/home/ec2-user/logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d SOURCE_DIR ]
then
    echo "$SOURCE_DIR  $G exist $N"
else
    echo "$SOURCE_DIR $R doesnot exist $N"
fi
