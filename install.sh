#!/bin/bash
GAE_VERSION=1.5.3
cd ~
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
cd fspotcloud.install
source ./env.sh
cd ~/fspotcloud
hg pull -u
mvn
