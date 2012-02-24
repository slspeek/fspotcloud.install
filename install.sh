#!/bin/bash
set -e
GAE_VERSION=1.6.0
cd ~
if [ ! -d gradle-1.0-milestone-7 ]; then
  wget http://repo.gradle.org/gradle/distributions/gradle-1.0-milestone-7-all.zip && unzip gradle-1.0-milestone-7-all.zip
fi
sudo apt-get update && sudo apt-get install --yes --force-yes curl sun-java6-jdk imagemagick sqlitebrowser mercurial iceweasel graphviz exif
sudo update-alternatives --set java  /usr/lib/jvm/java-6-sun/jre/bin/java 
if [ ! -d ~/appengine-java-sdk-$GAE_VERSION ]; then
	wget http://googleappengine.googlecode.com/files/appengine-java-sdk-$GAE_VERSION.zip && unzip appengine-java-sdk-$GAE_VERSION.zip
fi
if [ ! -d ~/apache-maven-3.0.4 ]; then
	curl http://apache.osuosl.org//maven/binaries/apache-maven-3.0.4-bin.tar.gz|tar -C ~ -xvzf -
fi
if [ ! -d ~/fspotcloud.simplejpadao ]; then
	hg clone https://simplejpadao.fspotcloud.googlecode.com/hg/ fspotcloud.simplejpadao
fi
if [ ! -d ~/fspotcloud ]; then
	hg clone https://java.fspotcloud.googlecode.com/hg/ fspotcloud
fi
if [ ! -d ~/botdispatch ]; then
	hg clone https://botdispatch.googlecode.com/hg/ botdispatch
fi
if [ ! -d ~/taskqueuedispatch ]; then
	hg clone https://taskqueuedispatch.googlecode.com/hg/ taskqueuedispatch
fi
cd fspotcloud.install
source ./env.sh
cd ~/fspotcloud.simplejpadao
hg pull -u
mvn clean install
cd ~/botdispatch
hg pull -u
cd ~/taskqueuedispatch
mvn -Dmaven.test.error.ignore -Dmaven.test.failure.ignore install
hg pull -u
mvn clean install
cd ~/fspotcloud
hg pull -u
mvn clean install

