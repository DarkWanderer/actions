#!/bin/sh

set -e

SSH_PATH="$HOME/.ssh"

mkdir "$SSH_PATH"
touch "$SSH_PATH/known_hosts"

echo "$PRIVATE_KEY" > "$SSH_PATH/deploy_key"
echo "$PUBLIC_KEY" > "$SSH_PATH/deploy_key.pub"

chmod 700 "$SSH_PATH"
chmod 600 "$SSH_PATH/known_hosts"
chmod 600 "$SSH_PATH/deploy_key"
chmod 600 "$SSH_PATH/deploy_key.pub"

echo run: ssh-add
eval $(ssh-agent)
ssh-add "$SSH_PATH/deploy_key"

echo run: ssh-keygen
ssh-keygen -r $HOST -p ${PORT:-22} -E sha256

echo run: ssh-keyscan
ssh-keyscan -p ${PORT:-22} $HOST > "$SSH_PATH/known_hosts"
cat "$SSH_PATH/known_hosts"

ssh -v -tt -p ${PORT:-22} $USER@$HOST "$*"
