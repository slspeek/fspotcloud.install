#!/bin/bash
set -e
GAE_VERSION=1.6.0
cd ~
if [ ! -d gradle-1.0-milestone-6 ]; then
  wget http://repo.gradle.org/gradle/distributions/gradle-1.0-milestone-6-all.zip && unzip gradle-1.0-milestone-6-all.zip
fi
sudo apt-get update && sudo apt-get install --yes --force-yes curl sun-java6-jdk imagemagick sqlitebrowser mercurial iceweasel graphviz exif
sudo update-alternatives --set java  /usr/lib/jvm/java-6-sun/jre/bin/java 
if [ ! -d ~/appengine-java-sdk-$GAE_VERSION ]; then
	wget http://googleappengine.googlecode.com/files/appengine-java-sdk-$GAE_VERSION.zip && unzip appengine-java-sdk-$GAE_VERSION.zip
fi
if [ ! -d ~/apache-maven-3.0.3 ]; then
	curl http://apache.osuosl.org//maven/binaries/apache-maven-3.0.3-bin.tar.gz|tar -C ~ -xvzf -
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
cd ~/botdispatch
hg pull -u
hg update -C jpa-experiment
mvn install
cd ~/taskqueuedispatch
hg pull -u
mvn install
cd ~/fspotcloud

hg pull -u
hg update -C jpa-migration
mvn install
