apt-get update
apt-get install apt-src
apt-src update
cd /usr/src
apt-src install f-spot
wget http://ftp.gnome.org/pub/GNOME/sources/f-spot/0.8/f-spot-0.8.2.tar.bz2
tar xvjf f-spot-0.8.2.tar.bz2
cd f-spot-0.8.2
./congigure && make && make install
