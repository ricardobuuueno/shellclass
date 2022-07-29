#!/bin/bash

# display the uid
echo "Your UID is ${UID}"

# display the username
USER_NAME=$(id -un)
echo "Your username is ${USER_NAME}"

# display if the user is root or not
if [[ "${UID}" -eq 0 ]]
then
  echo 'You are root.'
else
  echo 'You are not root.'
fi

