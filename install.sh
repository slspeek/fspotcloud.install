#!/bin/bash
set -e
cd ~
if [ ! -d gradle-1.1 ]; then
  wget http://services.gradle.org/distributions/gradle-1.1-all.zip  && unzip gradle-1.1-all.zip
fi
if [ ! -d ~/apache-maven-3.0.4 ]; then
	curl http://apache.osuosl.org//maven/binaries/apache-maven-3.1.0-alpha-1-bin.tar.gz|tar -C ~ -xvzf -
fi
