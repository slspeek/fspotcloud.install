wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins-ci.org/debian binary/>>/etc/apt/sources.list
sudo apt-get --yess --force-yess update
sudo apt-get --yes --force-yess install jenkins
