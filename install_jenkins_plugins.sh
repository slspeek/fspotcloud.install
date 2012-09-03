JENKINS_URL=http://localhost:9000
wget $JENKINS_URL/jnlpJars/jenkins-cli.jar
INSTALL_PLUGIN="java -jar jenkins-cli.jar -s $JENKINS_URL install-plugin"
for PLUGIN in checkstyle cobertura findbugs jdepend pmd gradle mercurial depgraph-view;
do
$INSTALL_PLUGIN $PLUGIN
done
