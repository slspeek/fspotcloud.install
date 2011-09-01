# The first two variables are user-editable
export YOUR_SECRET=SECRET
export GAE_APPLICATION_ID=jfspotcloud


export PATH=$HOME/apache-maven-3.0.3/bin:$PATH
export CDPATH=~/fspotcloud
export YOUR_APPENGINE_DEPLOYMENT=${GAE_APPLICATION_ID}.appspot.com
alias build='cd ~/fspotcloud && time (telnet localhost 4444 ;(cd war && mvn gae:stop) ;mvn clean ; mvn)'
alias buildserver='cd server && mvn clean install && cd war && mvn gae:stop clean verify'
alias buildpeer='cd peer && mvn clean install && cd war && mvn gae:stop clean verify'
alias cleanrun='cd war && stop ; mvn clean gae:run'
alias deploy='cd war/ && mvn -Dgae.deps.split -Dbot.secret=$YOUR_SECRET gae:deploy'
alias localpeer='cd peer/ && java -Dendpoint=localhost:8080 -Dbot.secret=$YOUR_SECRET -Ddb=$HOME/fspotcloud/peer/src/test/resources/photos.db  -jar target/peer-*-jar-with-dependencies.jar '
alias peer='cd ~/fspotcloud/peer/ && java -Djava.util.logging.config.file=target/classes/logging.properties -Dendpoint=$YOUR_APPENGINE_DEPLOYMENT -Dbot.secret=$YOUR_SECRET -Ddb=$HOME/.config/f-spot/photos.db  -jar target/peer-*-jar-with-dependencies.jar '
alias runlocal='cd ~/fspotcloud && cd war && mvn gae:stop gae:run'
alias stopall='(cd ~/fspotcloud/war && mvn gae:stop) && telnet localhost 4444'
alias resume='mvn install -rf :'
