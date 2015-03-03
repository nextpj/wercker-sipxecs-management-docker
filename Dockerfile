from centos:6

maintainer nextpj <nextpjsoftware@gmail.com>

run yum update -y
run yum install -y rpm libtool tar file

#some rpms are only found in epel, we do not want to get from epel, so we'll have to get from our epel
#poco-devel gperftools-devel
run rpm -ivh  http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm


# sipXportLib build requires taken from .spec.in
run yum install -y automake
run yum install -y gcc-c++
run yum install -y cppunit-devel
run yum install -y openssl-devel
run yum install -y gperftools-devel
#todo how to make sure we're installing >=4.5
run yum install -y pcre-devel
run yum install -y findutils
#todo how to make sure we're installing >= 1.39
run yum install -y  boost-devel
run yum install -y poco-devel

#sipxtacklib build requires taken from .spec.in
# sipxportlib-devel >= %version

#sipxcommserverlib build requires taken from .spec.in
#todo make sure version >= 2.2
run yum install -y unixODBC-devel
#sipxportlib-devel >= %version
#sipxtacklib-devel >= %version
run yum install -y glibc-headers
run yum install -y xerces-c-devel
#mongodb-devel >= 2.0.2

#sipxproxy build requires
run yum install -y zip
run yum install -y shadow-utils
#sipxcommserverlib-devel  >= %version
#sipxportlib-devel        >= %version
#sipxtacklib-devel        >= %version


#sipxregistry build requires
#BuildRequires: sipxcommserverlib-devel  >= %version
#BuildRequires: sipxportlib-devel        >= %version
#BuildRequires: sipxtacklib-devel        >= %version

#sipxsqa build requires
run yum install -y swig java-1.7.0-openjdk-devel 
#when manually installed centos says no package available for the ones below
run yum install -y zeromq-devel hiredis-devel libev-devel swig
#BuildRequires: sipxcommserverlib-devel  >= %version
9\#BuildRequires: sipxportlib-devel        >= %version

#sipxrls build requires
#BuildRequires: sipxcalllib-devel >= %version
#BuildRequires: sipxcommserverlib-devel >= %version
#BuildRequires: sipxportlib-devel >= %version
#BuildRequires: sipxtacklib-devel >= %version
#BuildRequires: sipxsqa-devel >= %version

#sipxsaa build requires
run yum install -y httpd-devel apr-devel
#BuildRequires: sipxcommserverlib-devel >= %version
#BuildRequires: sipxportlib-devel >= %version
#BuildRequires: sipxtacklib-devel >= %version

#sipxpublisher  build requires
#BuildRequires: sipxcommserverlib-devel >= %version
#BuildRequires: sipxportlib-devel >= %version
#BuildRequires: sipxtacklib-devel >= %version

