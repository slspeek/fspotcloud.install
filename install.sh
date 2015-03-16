#!/bin/bash
set -e
cd ~
if [ ! -d gradle-2.2 ]; then
  wget https://services.gradle.org/distributions/gradle-2.2-all.zip  && unzip gradle-2.2-all.zip
fi
if [ ! -d ~/apache-maven-3.2.5 ]; then
	curl http://apache.xl-mirror.nl/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz|tar -C ~ -xvzf -
fi
