FROM centos:latest

ADD ecerquei_rh /ssh-key
RUN yum install openssh openssh-clients ca-certificates bash rsync iputils nmap nc -y && yum clean all
CMD ["sh", "-c", "tail -f /dev/null"]
