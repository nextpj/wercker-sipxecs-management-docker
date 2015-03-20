from centos:6

maintainer nextpj <nextpjsoftware@gmail.com>

#update the image
run yum update -y

#temporary install the original epel-release repo to get thttpd
run yum install -y wget 
run wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
run rpm -Uvh epel-release-6*.rpm
run yum install -y thttpd
run yum erase -y epel-release

# install tools needed by rpm build
run yum install -y rpm libtool tar file automake git createrepo rpm-build rubygems ruby-devel
run gem install --no-rdoc fpm

#run rpm -ivh  http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#some rpms are only found in epel, we do not want to get from centos epel, we'll get them from sipxecs epel
# create the sipxecs epel repo 
run echo "[sipXecs]" > /etc/yum.repos.d/sipxecs-epel.repo
run echo "name=sipXecs software for CentOS \$releasever - \$basearch" >> /etc/yum.repos.d/sipxecs-epel.repo
run echo "baseurl=http://download2.sipfoundry.org/pub/sipXecs/14.10/CentOS_\$releasever/\$basearch" >> /etc/yum.repos.d/sipxecs-epel.repo
run echo "gpgcheck=0" >> /etc/yum.repos.d/sipxecs-epel.repo

# NOTES:
# 1. sipxecs modules below are listed in build order
# sipxcommons sipxconfig sipxaudiocodes sipxcallcontroller sipxcdr sipxcounterpath sipxpolycom sipxprovision sipxyealink sipxrest                  

# sipxcommons
# build requires
run yum install -y java-1.7.0-openjdk-devel shadow-utils zip rsync
# install requires
run yum install -y java-1.7.0-openjdk which

# sipxcdr            
# build requires
run yum install -y rubygems ruby unixODBC-devel
# install requires
run yum install -y chkconfig postgresql-odbc stunnel ruby-dbi ruby-libs ruby-postgres

# install dart sdk
run wget http://download2.sipfoundry.org/pub/build-utils/dart-sdk_centos_64.tar.gz
run tar -xzvf dart-sdk_centos_64.tar.gz -C /opt/
run rm dart-sdk_centos_64.tar.gz  
run echo "export DART_SDK='/opt/dart/dart-sdk'" >> ~/.bash_profile
run echo "export PATH='$PATH:$DART_SDK/bin'" >> ~/.bash_profile

# sipxconfig
# build requires
# net-snmp-libs >= 5.7.1
# net-snmp-devel >= 5.7.1
# net-snmp-agent-libs >= 5.7.1
# httpd >= 2.0
# sipxcommons >= %version
# sipxcdr-client >= %version
run yum install -y cronie libxslt ruby-devel dart-sdk rubygems httpd net-snmp-libs net-snmp-devel net-snmp-agent-libs pcre-devel

# install requires
# mongodb-server >= 2.2.0
# mongodb >= 2.2
# net-snmp >= 5.7.1
# net-snmp-sysvinit >= 5.7.1
# net-snmp-utils >= 5.7.1
# net-snmp-python
# sipxcommons >= %version
# sipxcdr-client >= %version
# ?? Requires: sipxsupervisor >= %version
run yum install -y postgresql-server mod_ssl python-pymongo python-argparse js net-snmp net-snmp-sysvinit net-snmp-utils net-snmp-python fontconfig dejavu-serif-fonts chkconfig ruby rubygems bind dhcp tftp-server vsftpd
run yum install -y mongodb-server mongodb

# sipxaudiocodes
# build requires
# install requires

# sipxrest        
# build requires
# install requires

# sipxcallcontroller
# build requires
# install requires

# sipxcounterpath      
# build requires
# install requires

# sipxpolycom             
# build requires
# install requires

# sipxprovision            
# build requires
# install requires

# sipxyealink
# build requires
run yum install -y java-devel
# install requires



