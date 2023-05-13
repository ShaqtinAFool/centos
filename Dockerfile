FROM centos:7.9.2009
LABEL maintainer="tony"

ENV TZ=Asia/Taipei \
    RUNTIME_DEPENDENCIES=" \
        freerdp \
    " \
    BUILD_DEPENDENCIES=" \
        gcc \
        make \
        cairo-devel \
        uuid-devel \
        ffmpeg-devel \
        freerdp-devel \
        pango-devel \
        pulseaudio-libs-devel \
        openssl-devel \
        libtool \
        libjpeg-turbo-devel \
        libpng-devel \
        libwebsockets-devel \
        libssh2-devel \
        libvorbis-devel \
        libwebp-devel \
        libvncserver-devel \
        libtelnet-devel \
    "
RUN cp -fr /usr/share/zoneinfo/${TZ} /etc/localtime

# Enable the Enterprise Linux Repositories (EPEL)
RUN yum install -y epel-release
RUN yum update -y

# Install ffmpeg-devel package (that package is not included with the base CentOS or EPEL repositories)
RUN rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
RUN rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm

# Install several dependencies
RUN yum install -y net-tools telnet vim wget iputils
RUN yum install -y mariadb policycoreutils
# RUN yum install -y tomcat (execute at guacamole install's process)
RUN yum install -y ${RUNTIME_DEPENDENCIES}
RUN yum install -y ${BUILD_DEPENDENCIES}
RUN yum install -y google-droid-sans-mono-fonts
RUN yum install -y maven
# ENV M2_HOME=/opt/apache-maven-3.9.1/
# ENV PATH=${PATH}:${M2_HOME}/bin
# RUN cd /root && \
#     wget https://downloads.apache.org/maven/maven-3/3.9.1/binaries/apache-maven-3.9.1-bin.tar.gz && \
#     tar -zxvf apache-maven-3.9.1-bin.tar.gz && \
#     mv apache-maven-3.9.1 /opt
RUN yum clean all