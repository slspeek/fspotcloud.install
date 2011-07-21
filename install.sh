cd ~
sudo apt-get update && sudo apt-get install curl sun-java6-jdk python2.6-dev build-essential imagemagick sqlitebrowser mercurial iceweasel
if [ ! -d ~/appengine-java-sdk-1.5.0 ]; then
	wget http://googleappengine.googlecode.com/files/appengine-java-sdk-1.5.0.zip && unzip appengine-java-sdk-1.5.0.zip
fi
if [ ! -d ~/apache-maven-3.0.3 ]; then
	curl http://apache.osuosl.org//maven/binaries/apache-maven-3.0.3-bin.tar.gz|tar -C ~ -xvzf -
fi
if [ ! -d ~/fspotcloud ]; then
	hg clone https://java.fspotcloud.googlecode.com/hg/ fspotcloud
fi
cd fspotcloud-install
. ./env.sh
cd ~/fspotcloud
hg update raster
mvn
