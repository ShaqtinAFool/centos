FROM centos:7
LABEL maintainer="tony"

# Enable the Enterprise Linux Repositories (EPEL)
RUN yum install -y epel-release &> /dev/null

# Install ffmpeg-devel package (that package is not included with the base CentOS or EPEL repositories)
RUN rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
RUN rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm

# Install several dependencies
RUN yum install -y net-tools telnet vim &> /dev/null
RUN yum install -y gcc cairo-devel libjpeg-turbo-devel libwebsockets-devel libpng-devel uuid-devel ffmpeg-devel freerdp-devel pango-devel libssh2-devel libvncserver-devel pulseaudio-libs-devel openssl-devel libvorbis-devel libwebp-devel libtool libtelnet-devel freerdp mariadb-server wget tomcat make yum install java-11-openjdk-devel &> /dev/null
RUN yum update -y &> /dev/null
RUN yum clean all