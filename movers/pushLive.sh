#!/bin/sh

#assumes pwd is the folder 
#enclosing the public dir containing all the site files. 

HOST="HOST"
USER="USER"
SITENAME="mysitename.com"


SOURCE="public/"
DESTINATION="$USER@$HOST:/home/$USER/$SITENAME"


#echo "#rsync -zaP $SOURCE $DESTINATION"
rsync -zaP --exclude='.DS_Store' $SOURCE $DESTINATION