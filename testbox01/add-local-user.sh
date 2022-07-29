#!/bin/bash

# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password
# Display username, password, and host for the account will be displayed.

# Make suer the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then
  echo 'Please run with sudo or as root.'
  exit 1
fi

# Get the username 
read -p 'Enter the username to create: ' USERNAME

# Get the real name
read -p 'Enter the name of the person or application that will be using this account: ' COMMENT

# Get the password
read -p 'Enter the password to user for the account: ' PASSWORD

# Create the account
useradd -c "${COMMENT}" -m ${USERNAME}

# Check to see if the useradd command succeeded.
if [[ "${?}" -ne 0 ]]
then
  echo 'The account could not be created.'
  exit 1
fi

# Set the password
echo ${PASSWORD} | passwd --stdin ${USERNAME}

# Check if the password was set
if [[ "${?}" -ne 0 ]]
then
  echo 'The password for the account could not be set.'
  exit 1
fi

# Force password change on first login
passwd -e ${USERNAME}

# Display the username, password, and the host where the user was created
echo 
echo 'username:'
echo "${USERNAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"

exit 0
