# docker files helper

## copyUtil

quay repo: https://quay.io/repository/ecerquei/util

### build and push image to repo

```
# build image
cp ~/.ssh/ecerquei/ecerquei_rh .
docker build -f copyUtil.dockerfile -t copyutil:latest .


# push to repo
docker run --name cp -d copyutil
docker login quay.io
docker commit 1187edf17710 quay.io/ecerquei/util
docker push quay.io/ecerquei/util
```

### running in openshift

```
oc login https://xxx.xxx.xxx.com:443 --token=***************
oc new-app quay.io/ecerquei/util:latest
oc get pods
oc rsh pod-id
```
