# The first two variables are user-editable
export YOUR_SECRET=SECRET
export GAE_APPLICATION_ID=jfspotcloud


export PATH=$HOME/apache-maven-3.0.3/bin:$PATH
export CDPATH=~/fspotcloud
export YOUR_APPENGINE_DEPLOYMENT=${GAE_APPLICATION_ID}.appspot.com
alias stopall='(cd war && mvn gae:stop); telnet localhost 4444'
alias build='stopall; cd ~/fspotcloud && time (mvn -o clean ; mvn -o -Dnodelete)'
alias sbuild='stopall; cd ~/fspotcloud && time (mvn -o clean ; mvn -o -Dmaven.test.error.ignore -Dmaven.test.failure.ignore -Dnodelete)'
alias rbuild='stopall; cd ~/fspotcloud && time (mvn clean ; mvn)'
alias buildserver='cd server && mvn clean install && cd war && mvn gae:stop clean verify'
alias buildpeer='cd peer && mvn clean install && cd war && mvn gae:stop clean verify'
alias cleanrun='cd war && stopall ; mvn clean gae:run'
alias deploy='cd war/ && mvn -Dgae.deps.split -Dbot.secret=$YOUR_SECRET gae:deploy'
alias localpeer='cd peer/ && java -Dpause=3000 -Dendpoint=localhost:8080 -Dbot.secret=$YOUR_SECRET -Ddb=$HOME/fspotcloud/peer/src/test/resources/photos.db  -jar target/peer-*-jar-with-dependencies.jar '
alias localbot='cd bot-dispatch/test-bot/ && java -Dpause=3000 -Dendpoint=localhost:8080 -Dbot.secret=$YOUR_SECRET -jar target/test-bot-*-jar-with-dependencies.jar '
alias peer='cd ~/fspotcloud/peer/ && java -Dpause=30000 -Djava.util.logging.config.file=target/classes/logging.properties -Dendpoint=$YOUR_APPENGINE_DEPLOYMENT -Dbot.secret=$YOUR_SECRET -Ddb=$HOME/.config/f-spot/photos.db  -jar target/peer-*-jar-with-dependencies.jar '
alias runlocal='cd ~/fspotcloud && cd war && mvn gae:stop gae:run'
alias verify='(stopall; cd war; mvn clean verify -Dnodelete)'
alias gwt='(cd client &&  mvn gwt:run)'
alias viewtestdb='sqlitebrowser $HOME/fspotcloud/peer/src/test/resources/photos.db'
alias reclipse='cd ~/fspotcloud && mvn eclipse:clean google:clean eclipse:eclipse google:eclipse'

function resume() {
   mvn install -rf :$1;
}
