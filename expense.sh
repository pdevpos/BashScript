userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
date=$(date)
logfile=/var/log/shell-script/expense-$date.log
validate()
{
  if [ $1 -ne 0 ]; then
    echo -e "$R $2 installation failed.please check $N"&>>$logfile
  else
    echo -e "$G $2 installation success $N"&>>$logfile
  fi
}
if [ $userid -ne 0 ]; then
    echo -e "$Y script packages executes with root privileges $N $userid"
    exit 1
fi
dnf list installed mysql-server
if [ $? -ne 0 ]; then
  echo -e "$Y mysql-server not installed.please installed it..$N"&>>$logfile
  dnf install mysql-server -y &>>$logfile
  validate $? "mysql-server"
else
  echo -e "$G mysql-server installed already.nothing to do!..$N" | tees -a $logfile
fi


