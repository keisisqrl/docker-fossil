#!/bin/sh

if [ ! -z $INIT ]
then
  /usr/local/bin/fossil init -A $USERNAME /fossils/fossil.fossil
fi

if [ ! -z $PASSWORD ]
then
  /usr/local/bin/fossil user password  $USERNAME $PASSWORD -R /fossils/fossil.fossil
  echo "Changed password for $USERNAME"
fi

unset $USERNAME
unset $PASSWORD
set ARGS = ""

if [ ! -z $HTTPS ]
then
  set ARGS = "--https"
fi

if [ -w "/fossils/fossil.fossil" ]
then
  echo "Serving fossil.fossil"
  /usr/local/bin/fossil server $ARGS /fossils/fossil.fossil
else
  echo "No fossil.fossil present, serving directory"
  /usr/local/bin/fossil server --repolist $ARGS /fossils
fi
