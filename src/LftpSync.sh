#!/bin/bash    

#######################################################
# Last Modified: Thursday, 4th June 2020 8:46:57 pm   #
#######################################################

HOST="ServerIP"
USER="username"
PASS="password"
FTPURL="ftp://$USER:$PASS@$HOST"
LCD="/path/of/your/local/dir"
RCD="/path/of/your/remote/dir"

DELETE="--delete"
lftp -c "set ftp:list-options -a;
open '$FTPURL';
lcd $LCD;
cd $RCD;
mirror --reverse \
      $DELETE \
      --verbose \
      --exclude-glob a-dir-to-exclude/ \
      --exclude-glob a-file-to-exclude \
      --exclude-glob a-file-group-to-exclude* \
      --exclude-glob other-files-to-exclude"