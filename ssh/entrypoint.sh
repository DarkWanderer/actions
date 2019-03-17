#!/bin/sh

set -e

SSH_PATH="$HOME/.ssh"

mkdir "$SSH_PATH"
touch "$SSH_PATH/known_hosts"

chmod 700 "$SSH_PATH"
chmod 600 "$SSH_PATH/known_hosts"

eval $(ssh-agent)
echo $PRIVATE_KEY|ssh-add -
ssh-add -l

ssh-keygen -R $HOST

ssh -A -tt -o 'StrictHostKeyChecking=no' -p ${PORT:-22} $USER@$HOST "$*"
