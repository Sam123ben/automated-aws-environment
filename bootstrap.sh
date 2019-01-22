#!/bin/sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "\nThe user who triggered the script is $SUDO_USER\n"

echo 'yes' |  easy_install pip
echo 'yes' |  pip install ansible --quiet
echo 'yes' |  pip install ansible --upgrade
echo 'yes' | pip install boto3
echo 'yes' | pip install awscli --upgrade --user