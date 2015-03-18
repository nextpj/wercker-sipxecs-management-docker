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
#portlib tacklib supervisor commserverlib sqa link commons nodeps relay proxy publisher rls saa
 
# sipXportLib 
# build requires
# pcre-devel >=4.5
# boost-devel >= 1.39
run yum install -y gcc-c++ cppunit-devel openssl-devel gperftools-devel pcre-devel findutils boost-devel poco-devel
# run requires

# sipxtacklib 
# build requires
# sipxportlib-devel >= %version

#sipxsupervisor
# this is required by sipxcommserverlib rpm 
# build requires
# net-snmp-devel >= 5.3.1
run yum install -y net-snmp-devel
# install requires
# cfengine >= 3.2.3
run yum install -y cfengine fail2ban ntp rubygem-net-sftp sec sendmail sendmail-cf system-config-network-tui

# sipxcommserverlib
# build requires
# mongodb-devel >= 2.0.2
run yum install -y unixODBC-devel glibc-headers xerces-c-devel mongodb-devel
# sipxportlib-devel >= %version
# sipxtacklib-devel >= %version

# sipxsqa
# build requires
run yum install -y swig java-1.7.0-openjdk-devel zeromq-devel hiredis-devel libev-devel swig
# sipxcommserverlib-devel  >= %version
# sipxportlib-devel        >= %version
# install requires
run yum install -y redis

# sipxcommons
# this is required by sipxrelay

# sipxrelay
# this is required by sipxproxy

# sipxproxy 
# build requires
run yum install -y zip shadow-utils
# sipxcommserverlib-devel  >= %version
# sipxportlib-devel        >= %version
# sipxtacklib-devel        >= %version
# install requires
run yum install -y vixie-cron 

#sipxregistry 
# build requires
# sipxcommserverlib-devel  >= %version
# sipxportlib-devel        >= %version
# sipxtacklib-devel        >= %version

#sipxpublisher  build requires
#BuildRequires: sipxcommserverlib-devel >= %version
#BuildRequires: sipxportlib-devel >= %version
#BuildRequires: sipxtacklib-devel >= %version


#sipxrls build requires
#BuildRequires: sipxcommserverlib-devel >= %version
#BuildRequires: sipxportlib-devel >= %version
#BuildRequires: sipxtacklib-devel >= %version
#BuildRequires: sipxsqa-devel >= %version

#sipxsaa build requires
run yum install -y httpd-devel apr-devel
#BuildRequires: sipxcommserverlib-devel >= %version
#BuildRequires: sipxportlib-devel >= %version
#BuildRequires: sipxtacklib-devel >= %version

# sipxtools
run yum install -y perl-DateTime-Format-DateParse python-pymongo python-pymongo-gridfs

# sipxviewer 
ryn yum install -y java-devel


