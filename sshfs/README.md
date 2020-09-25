# docker files helper

## copyUtil

Running sshfs to mount remote shared folder for backup and restore purposes.

quay repo: https://quay.io/repository/ecerquei/util

### build and push image to repo

```
# build image
docker build -f copyUtil.dockerfile -t copyutil:latest .
export SSH_KEY=$(cat /home/user/.ssh/your_key)
docker run -d --rm --name cp --device /dev/fuse --cap-add SYS_ADMIN -e SSH_KEY="$SSH_KEY" copyutil

# (optional) test locally
docker exec -it cp /bin/bash

# push to repo
docker login quay.io
docker commit 1187edf17710 quay.io/ecerquei/util
docker push quay.io/ecerquei/util
```

### running in openshift

```
oc login https://xxx.xxx.xxx.com:443 --token=***************
oc apply -f templates/dc.yaml
<!-- oc new-app quay.io/ecerquei/util:latest -->
oc get pods
oc rsh pod-id
sshfs -o IdentityFile=/user/key.pem user@file.srv.x.com:/home/user /mnt/fs
```

### TODO:
- oc deployconfig template with env variable to load ssh_key

### Issues:
- sshfs will ask for password for those requiring kerberos authentication

