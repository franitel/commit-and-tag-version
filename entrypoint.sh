#!/bin/sh

if [ -z "$PLUGIN_SSH_PRIVATE_KEY" ]; then
   echo "[ERROR] SSH_PRIVATE_KEY must be configured"
   exit 1
fi

if [ -z "$PLUGIN_KNOWN_HOST" ]; then
   echo "[ERROR] Git HOST must be configured"
   exit 1
fi

mkdir ~/.ssh
eval $(ssh-agent -s)
ssh-keyscan $PLUGIN_KNOWN_HOST >> ~/.ssh/known_hosts 2>/dev/null
ssh-agent bash -c "ssh-add <(echo '$PLUGIN_SSH_PRIVATE_KEY')"

git fetch

if [ "$PLUGIN_PREFIX" ]; then
    commit-and-tag-version -t ${PLUGIN_PREFIX}
else
    commit-and-tag-version -t ''
fi

git push origin "${GITHUB_BASE_REF}"
git push --tags
