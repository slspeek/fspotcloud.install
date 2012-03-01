wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins-ci.org/debian binary/>>/etc/apt/sources.list
sudo apt-get --yes --force-yes update
sudo apt-get --yes --force-yes install jenkins
sed -i -e 's^/var/lib/jenkins^/home/jenkins^' /etc/passwd
mkdir /home/jenkins
chown -R jenkins /home/jenkins
