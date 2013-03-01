#!/bin/bash
set -e
GAE_VERSION=1.7.4
cd ~
if [ ! -d ~/appengine-java-sdk-$GAE_VERSION ]; then
	wget http://googleappengine.googlecode.com/files/appengine-java-sdk-$GAE_VERSION.zip && unzip appengine-java-sdk-$GAE_VERSION.zip
fi
