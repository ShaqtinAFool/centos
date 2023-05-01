FROM centos:7
LABEL maintainer="tony"

# Enable the Enterprise Linux Repositories (EPEL)
RUN yum install epel-release -y &> /dev/null
# RUN yum update -y &> /dev/null

# Install ffmpeg-devel package (that package is not included with the base CentOS or EPEL repositories)
RUN rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
RUN rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm

# Install several dependencies
RUN yum install gcc cairo-devel libjpeg-turbo-devel libwebsockets-devel libpng-devel uuid-devel ffmpeg-devel freerdp-devel pango-devel libssh2-devel libvncserver-devel pulseaudio-libs-devel openssl-devel libvorbis-devel libwebp-devel libtool libtelnet-devel freerdp mariadb-server wget telnet tomcat make net-tools -y  &> /dev/null
RUN yum update -y &> /dev/null
RUN yum clean all

# Enable SSH
COPY entrypoint.sh /root
RUN chmod +x /root/entrypoint.sh
RUN yum install dialog -y \
    && yum install openssh-server -y \
    && echo "root:Docker!" | chpasswd \
    && cd /etc/ssh/ \
    && ssh-keygen -A
COPY sshd_config /etc/ssh/

EXPOSE 2222

ENTRYPOINT ["/root/entrypoint.sh"]
# CMD ["/bin/bash"]