# docker files helper

## nfsUtil

Running nfs to mount remote shared folder for backup and restore purposes.

quay repo: https://quay.io/repository/ecerquei/nfs


### build and push image to repo

```
# build image
docker build -t nfs:latest .
docker run -d --rm --name nfs nfs

# (optional) test locally
docker exec -it nfs /bin/bash
showmount -e 10.8.196.202
mount -t nfs 10.8.196.202:/mnt/pvc_bkp /mnt/fs

# push to repo
docker login quay.io
docker ps
docker commit 1187edf17710 quay.io/ecerquei/sshfs
docker push quay.io/ecerquei/sshfs
```

### running in openshift

```
oc login https://xxx.xxx.xxx.com:443 --token=***************
oc apply -f templates/dc.yaml
oc apply -f templates/is.yaml
oc get pods
oc rsh pod-id
sshfs -o IdentityFile=/user/key.pem user@file.srv.x.com:/home/user /mnt/fs
```

### TODO:
- oc deployconfig template with env variable 
- replace static ip to variable

### Issues:
- nfs may need to run on priviledged container

