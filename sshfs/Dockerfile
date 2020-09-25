FROM centos:latest

ENV SHARE="/mnt/fs"
ENV USERNAME="${USERNAME:-ecerquei}"
# ssh key need to authenticate on remote sshfs
ENV SSH_KEY="$SSH_KEY"

RUN adduser $USERNAME

RUN dnf --enablerepo=PowerTools -y install fuse-sshfs
RUN dnf install openssh openssh-clients ca-certificates bash rsync iputils nmap nc -y && yum clean all

# fuse config
RUN sed -i 's/# user_allow_other/user_allow_other/' /etc/fuse.conf

# target for mounting sshfs
RUN mkdir -p {$SHARE,$USERNAME} && \
    chgrp -R 0 $SHARE && \
    chmod -R g+rwx $SHARE && \
    chown -R $USERNAME $SHARE && \
    chown -R $USERNAME $USERNAME

USER $USERNAME
RUN echo "$SSH_KEY" >> /$USERNAME/key.pem && chmod 0600 /$USERNAME/key.pem
WORKDIR $SHARE

# keep container up and running
CMD ["sh", "-c", "tail -f /dev/null"]
