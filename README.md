# commit-and-tag-version docker action
This Github actions is to use commit-and-tag-version with the ssh_private_key in case you are not using github repo but you are using act.

## Inputs

## PLUGIN_SSH_PRIVATE_KEY:
Required: Private key required to connect to the git repo

## PLUGIN_KNOWN_HOST:
Required. Repo hostname/ip required to include in the known_hosts
    required: true

## PLUGIN_PREFIX:
Not required. The values previous to the version. v1.1.2    Default "v".

## Example usage
```
uses: franitel/commit-and-tag-version@v1
with:
  PLUGIN_SSH_PRIVATE_KEY:	'SSH_PRIVATE_KEY="-----BEGIN OPENSSH PRIVATE KEY-----\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\n-----END OPENSSH PRIVATE KEY-----'
  PLUGIN_KNOWN_HOST: 'www.mygithost.com'
  PLUGIN_PREFIX: 'v'
```
