#!/bin/sh

if [ $INIT = "true" ]
then
  /usr/local/bin/fossil init -A $USERNAME /data/fossil.fossil
fi

if [ ! -z $PASSWORD ] && [ -w /data/fossil.fossil ]
then
  /usr/local/bin/fossil user password  $USERNAME $PASSWORD -R /data/fossil.fossil
fi

unset $USERNAME
unset $PASSWORD

if [ $HTTPS = "true" ]
then
  set ARGS = "--https"
fi

if [ -w "/data/fossil.fossil" ]
then
  /usr/local/bin/fossil server $ARGS /data/fossil.fossil
else
  /usr/local/bin/fossil server --repolist $ARGS /data
fi
