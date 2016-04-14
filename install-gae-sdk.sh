#!/bin/bash
set -e
GAE_VERSION=1.9.34
cd ~
if [ ! -d ~/appengine-java-sdk-$GAE_VERSION ]; then
	wget https://storage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-$GAE_VERSION.zip && unzip appengine-java-sdk-$GAE_VERSION.zip
fi
