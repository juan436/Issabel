FROM centos/systemd

MAINTAINER Tomas Marquez <tomas@saiyans.com.ve>

VOLUME [ "/sys/fs/cgroup" ]

RUN yum update; yum -y install kernel-devel-$(uname -r) libtool make gcc patch perl bison flex-devel gcc-c++ ncurses-devel flex libtermcap-devel autoconf automake* autoconf libxml2-devel cmake curl epel-release htop glances screen fail2ban-server wget sysstat net-tools setroubleshoot; yum clean all 

WORKDIR /usr/src 

RUN curl -LOs "https://sourceforge.net/projects/issabelpbx/files/Issabel 4/issabel4-asterisk13-netinstall.sh" && chmod 777 issabel4-asterisk13-netinstall.sh && ln -s issabel4-asterisk13-netinstall.sh install.sh

EXPOSE 10000-20000/udp 110 143 25 2727/udp 443/tcp 4569/udp 5004-5082/udp 80/tcp 8433/tcp 89/tcp 993 995 5038 5060/tcp 5060/udp 5061/tcp 5061/udp 8001 8003 8088 8089 9900/tcp 9900/udp 10000-10100/tcp 10000-10100/udp

CMD ["/usr/sbin/init"]
