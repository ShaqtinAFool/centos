FROM centos:7
LABEL maintainer="tony"

ENV TZ=Asia/Taipei
RUN cp -fr /usr/share/zoneinfo/${TZ} /etc/localtime

# Enable the Enterprise Linux Repositories (EPEL)
RUN yum install -y epel-release

# Install ffmpeg-devel package (that package is not included with the base CentOS or EPEL repositories)
RUN rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
RUN rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm

# Install several dependencies
RUN yum install -y net-tools telnet vim wget
# RUN yum install -y tomcat (wexecute at guacamole install's process)
RUN yum install -y gcc cairo-devel libjpeg-turbo-devel libwebsockets-devel libpng-devel uuid-devel ffmpeg-devel freerdp-devel pango-devel libssh2-devel libvncserver-devel pulseaudio-libs-devel openssl-devel libvorbis-devel libwebp-devel libtool libtelnet-devel freerdp mariadb make policycoreutils
RUN yum install -y google-droid-sans-mono-fonts
RUN yum install -y maven
# ENV M2_HOME=/opt/apache-maven-3.9.1/
# ENV PATH=${PATH}:${M2_HOME}/bin
# RUN cd /root && \
#     wget https://downloads.apache.org/maven/maven-3/3.9.1/binaries/apache-maven-3.9.1-bin.tar.gz && \
#     tar -zxvf apache-maven-3.9.1-bin.tar.gz && \
#     mv apache-maven-3.9.1 /opt

RUN yum update -y
RUN yum clean all