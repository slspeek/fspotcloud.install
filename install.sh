#!/bin/bash
set -e
GAE_VERSION=1.7.0
cd ~
if [ ! -d gradle-1.0 ]; then
  wget http://services.gradle.org/distributions/gradle-1.0-all.zip  && unzip gradle-1.0-all.zip
fi
if [ ! -d ~/appengine-java-sdk-$GAE_VERSION ]; then
	wget http://googleappengine.googlecode.com/files/appengine-java-sdk-$GAE_VERSION.zip && unzip appengine-java-sdk-$GAE_VERSION.zip
fi
if [ ! -d ~/apache-maven-3.0.4 ]; then
	curl http://apache.osuosl.org//maven/binaries/apache-maven-3.0.4-bin.tar.gz|tar -C ~ -xvzf -
fi
