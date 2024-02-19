#!/bin/sh

dir=./
file=bandit

echo "level"
read level
password=`awk "NR == 2*$level" $dir$file`

expect <<EOF
spawn ssh -p 2220 bandit$level@bandit.labs.overthewire.org
expect "password:"
send "$password\r"
expect "$ "
#send "ls\r"
interact

