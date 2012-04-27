# The first two variables are user-editable
export YOUR_SECRET=SECRET
export GAE_APPLICATION_ID=jfspotcloud
export PATH=$HOME/gradle-1.0-milestone-8/bin:$HOME/apache-maven-3.0.4/bin:$PATH
export CDPATH=~/fspotcloud
export YOUR_APPENGINE_DEPLOYMENT=${GAE_APPLICATION_ID}.appspot.com
alias deepgaebuild='g {client,e2e-test,gae-war,installer-gae,model-api,model-jpa,model-jpa-gae,peer,peer-rpc,peer-server-integration,prod-gae-war,rpc,server,server-module-gae,test-util,user-service-api,user-service-gae}:build'
alias deepj2eebuild='g {client,e2e-test,j2ee-war-noauth,model-api,model-jpa,model-jpa-j2ee,peer,peer-rpc,peer-server-integration,rpc,server,server-module-j2ee,test-util,user-service-api,user-service-openid,prod-j2ee-war,installer-j2ee-server,installer-peer}:build'
alias vt='x-www-browser build/reports/tests/index.html'
alias gb='g build'
alias gbuildall='stopall ; cd ~/fspotcloud && g clean && deepgaebuild && deepj2eebuild'
alias gcb='g clean build'
alias chc='g -x :client:clean -x :client:cleanCompileGwt clean'
alias vienv='vi ~/fspotcloud.install/env.sh'
alias status='hg status && hg outgoing ; hg identify'
alias allstat='cd ~/fspotcloud.install && status ;cd ~/fspotcloud && status ; cd ~/botdispatch && status;cd ~/fspotcloud.simplejpadao/ && status ; cd ~/taskqueuedispatch/ && status'
alias cleanall='cd ~/fspotcloud && mvn clean ; find -type d \( -name bin -or -name target -or -name runtime -or -name MODELJPA -or -name te-report \) -exec rm -rvf {} \;'
alias stopall='(cd ~/taskqueuedispatch/integration && mvn gae:stop) && (cd ~/fspotcloud/gae-war && mvn gae:stop);(cd ~/botdispatch/integration-test && mvn gae:stop); (cd ~/fspotcloud && g {j2ee,gae}-war:clean )'
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
alias verify='(stopall; cd gae-war; mvn clean verify)'
alias gwt='(cd client &&  mvn gwt:run)'
alias viewtestdb='sqlitebrowser $HOME/fspotcloud/peer/src/test/resources/photos.db'
alias reclipse='mvn eclipse:clean eclipse:eclipse' 
alias reidea='g cleanIdea idea'
alias mci='mvn clean install'
alias rununinstaller='java -jar ~/FSpotCloud/Uninstaller/uninstaller.jar'
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
function resume() {
   mvn -Dfspotcloud.test.webdriver=fire -Dmaven.test.failure.ignore=false install -rf :$1;
}
function gRepl() {
  find -type f -name build.gradle -exec sed -i -e "s/\"$1\"/libs.$2/g" {} \; ;
}
function g() {
  CMD="gradle --daemon $@";
  echo $CMD;
  $CMD;
}
