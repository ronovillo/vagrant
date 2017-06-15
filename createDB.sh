#!/bin/bash
  
EXPECTED_ARGS=3
E_BADARGS=65
MYSQL=`which mysql`
DATABASE=`bootcamp`
USER=`root`
PASS=`mysql`
  
Q1="CREATE DATABASE IF NOT EXISTS $DATABASE;"
Q2="GRANT USAGE ON *.* TO $USER@localhost IDENTIFIED BY '$PASS';"
Q3="GRANT ALL PRIVILEGES ON $DATABASE.* TO $USER@localhost;"
Q4="FLUSH PRIVILEGES;"
Q5="CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) NOT NULL,
  `userEmail` varchar(60) NOT NULL,
  `userPass` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userEmail` (`userEmail`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;"
SQL="${Q1}${Q2}${Q3}${Q4}"
  
# if [ $# -ne $EXPECTED_ARGS ]
# then
#   echo "Usage: $0 dbname dbuser dbpass"
#   exit $E_BADARGS
# fi
  
$MYSQL -uroot -p -e "$SQL"