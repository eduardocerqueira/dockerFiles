FROM centos:latest

ENV MNT="/mnt/nfs"
ENV USERNAME="${USERNAME:-ecerquei}"
ENV NFS_SERVER_IP="${NFS_SERVER_IP:-10.8.196.202}"

RUN adduser $USERNAME

RUN dnf install nfs-utils nfs4-acl-tools ca-certificates bash rsync iputils nmap nc -y && yum clean all

# target for mounting sshfs
RUN mkdir -p {$MNT,$USERNAME} && \
    chgrp -R 0 $MNT && \
    chmod -R g+rwx $MNT && \
    chown -R $USERNAME $MNT && \
    chown -R $USERNAME $USERNAME

USER root
RUN mount -t nfs $NFS_SERVER_IP/mnt/pvc_bkp /mnt/nfs

USER $USERNAME
WORKDIR $MNT

# keep container up and running
CMD ["sh", "-c", "tail -f /dev/null"]
