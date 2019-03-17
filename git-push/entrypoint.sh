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

GIT_SSH_COMMAND="ssh -o 'StrictHostKeyChecking=no'"
git push ssh://$USER@$HOST:${PORT:-22}/opt/deploy/$REPO
