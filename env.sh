# The first two variables are user-editable
export YOUR_SECRET=SECRET
export GAE_APPLICATION_ID=jfspotcloud


export PATH=$HOME/gradle-1.0-milestone-6/bin:$HOME/apache-maven-3.0.4/bin:$PATH
export CDPATH=~/fspotcloud
export YOUR_APPENGINE_DEPLOYMENT=${GAE_APPLICATION_ID}.appspot.com
alias g='gradle --daemon '
alias vienv='vi ~/fspotcloud.install/env.sh'
alias status='hg status && hg outgoing ; hg identify'
alias allstat='cd ~/fspotcloud.install && status ;cd ~/fspotcloud && status ; cd ~/botdispatch && status;cd ~/fspotcloud.simplejpadao/ && status ; cd ~/taskqueuedispatch/ && status'
alias cleanall='cd ~/fspotcloud && mvn clean ; find -type d \( -name target -or -name runtime -or -name MODELJPA -or -name te-report \) -exec rm -rvf {} \;'
alias stopall='(cd ~/taskqueuedispatch/integration && mvn gae:stop) && (cd ~/fspotcloud/gae-war && mvn gae:stop);(cd ~/botdispatch/integration-test && mvn gae:stop); telnet localhost 4444'
alias build='stopall; cd ~/fspotcloud && time (cleanall ; mvn -Dfspotcloud.test.webdriver=fire -Dmaven.test.failure.ignore=false install testability:testability)'
alias sbuild='stopall; cd ~/fspotcloud && time (cleanall ; mvn -Dmaven.test.error.ignore -Dmaven.test.failure.ignore -Dnodelete -Dfspotcloud.test.webdriver=fire )'
alias rbuild='stopall; cd ~/fspotcloud && time (cleanall ; mvn)'
alias crepo='rm -rf ~/.m2/repository/'
alias buildserver='cd server && mvn clean install && cd war-prod && mvn gae:stop clean verify'
alias buildpeer='cd peer && mvn clean install && cd war && mvn gae:stop clean verify'
alias cleanrun='cd war-prod && stopall ; mvn clean gae:run'
alias deploy='cd war-prod/ && mvn -Dgae.deps.split -Dbot.secret=$YOUR_SECRET gae:deploy'
alias localpeer='cd peer/ && java -Dphoto.dir.override=file:/$HOME/fspotcloud/peer/src/test/resources/Photos -Dphoto.dir.original=file:///home/steven/Photos -Dpause=3 -Dendpoint=localhost:8080 -Dbot.secret=$YOUR_SECRET -Ddb=$HOME/fspotcloud/peer/src/test/resources/photos.db  -jar target/peer-*-jar-with-dependencies.jar '
alias localpeerj2ee='cd peer/ && java -Dphoto.dir.override=file:/$HOME/fspotcloud/peer/src/test/resources/Photos -Dphoto.dir.original=file:///home/steven/Photos -Dpause=3 -Dendpoint=localhost:8080/j2ee-war -Dbot.secret=$YOUR_SECRET -Ddb=$HOME/fspotcloud/peer/src/test/resources/photos.db  -jar target/peer-*-jar-with-dependencies.jar '
alias localbot='cd botdispatch/test-bot/ && java -Dpause=3 -Dendpoint=localhost:8080 -Dbot.secret=$YOUR_SECRET -jar target/test-bot-*-jar-with-dependencies.jar '
alias peer='cd ~/fspotcloud/peer/ && java -Dpause=30 -Djava.util.logging.config.file=target/classes/logging.properties -Dendpoint=$YOUR_APPENGINE_DEPLOYMENT -Dbot.secret=$YOUR_SECRET -Ddb=$HOME/.config/f-spot/photos.db  -jar target/peer-*-jar-with-dependencies.jar '
alias peerprodlocal='cd ~/fspotcloud/peer/ && java -Dpause=5 -Djava.util.logging.config.file=target/classes/logging.properties -Dendpoint=localhost:8080 -Dbot.secret=$YOUR_SECRET -Ddb=$HOME/.config/f-spot/photos.db  -jar target/peer-*-jar-with-dependencies.jar '
alias runlocal='cd ~/fspotcloud && cd gae-war && mvn gae:stop gae:run'
alias verify='(stopall; cd gae-war; mvn clean verify -Dnodelete)'
alias gwt='(cd client &&  mvn gwt:run)'
alias viewtestdb='sqlitebrowser $HOME/fspotcloud/peer/src/test/resources/photos.db'
alias reclipse='mvn eclipse:clean google:clean eclipse:eclipse google:eclipse'
alias mci='mvn clean install'
alias runinstaller='java -jar ~/fspotcloud/installer/target/installer-standard.jar'
alias rununinstaller='java -jar ~/FSpotCloud/Uninstaller/uninstaller.jar'
alias cbuild='rm -rf $HOME/.m2/repository/fspotcloud/ && cd ~/taskqueuedispatch && stopall;mci && cd && cd botdispatch && mci && build'
alias sim='cd ~/fspotcloud.simplejpadao'
function clean() {
  (cd $1 && mvn clean);
}
function sb() {
  (cd $1 && mvn clean ; rm -rf target; mvn install -Dmaven.test.error.ignore -Dmaven.test.failure.ignore)
}
function b() {
  (cd $1 && mvn clean ; rm -rf target; mvn install);
}
alias cheapclean='clean war; clean server; clean peer; clean model-api; clean model;'
alias cheapbuild='b rpc && b peer-rpc && b peer && b model && b server && b war'
function resume() {
   mvn -Dfspotcloud.test.webdriver=fire -Dmaven.test.failure.ignore=false install -rf :$1;
}
