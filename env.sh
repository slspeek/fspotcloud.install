# The first two variables are user-editable
export YOUR_SECRET=VERY_GRADLE
export GAE_APPLICATION_ID=jfspotcloud
export PATH=$HOME/gradle-1.0-milestone-8/bin:$HOME/apache-maven-3.0.4/bin:$PATH
export CDPATH=~/fspotcloud
export YOUR_APPENGINE_DEPLOYMENT=${GAE_APPLICATION_ID}.appspot.com
alias deepgaebuild='g {client,e2e-test,gae-e2e,installer-gae,model-api,model-jpa,model-jpa-gae,peer,peer-rpc,peer-server-integration,prod-gae-war,rpc,server,server-module-gae,test-util,user-service-api,user-service-gae}:build'
alias deepj2eebuild='g {client,e2e-test,j2ee-e2e,model-api,model-jpa,model-jpa-j2ee,peer,peer-rpc,peer-server-integration,rpc,server,server-module-j2ee,test-util,user-service-api,user-service-openid,prod-j2ee-war,installer-j2ee-server,installer-peer}:build'
alias vt='x-www-browser build/reports/tests/index.html'
alias gb='g build'
alias gbuildall='time (stopall ; cd ~/fspotcloud && g clean && deepgaebuild && deepj2eebuild)'
alias gcb='g clean build'
alias chc='g -x :client:clean -x :client:cleanCompileGwt clean'
alias cgradle='rm -rf ~/.gradle/daemon ~/fspotcloud/.gradle'
alias vienv='vi ~/fspotcloud.install/env.sh'
alias status='hg status && hg outgoing ; hg identify'
alias allstat='cd ~/fspotcloud.install && status ;cd ~/fspotcloud && status ; cd ~/botdispatch && status;cd ~/fspotcloud.simplejpadao/ && status ; cd ~/taskqueuedispatch/ && status'
alias cleanall='cd ~/fspotcloud && mvn clean ; find -type d \( -name bin -or -name target -or -name runtime -or -name MODELJPA -or -name te-report \) -exec rm -rvf {} \;'
alias stopall='(cd ~/fspotcloud/gae-war && mvn gae:stop);(cd ~/fspotcloud && g {j2ee,gae}-e2e:clean && g --stop)'
alias build='stopall; cd ~/fspotcloud && time (cleanall ; mvn -Dfspotcloud.test.webdriver=fire -Dmaven.test.failure.ignore=false install testability:testability)'
alias sbuild='stopall; cd ~/fspotcloud && time (cleanall ; mvn -Dmaven.test.error.ignore -Dmaven.test.failure.ignore -Dnodelete -Dfspotcloud.test.webdriver=fire )'
alias rbuild='stopall; cd ~/fspotcloud && time (cleanall ; mvn)'
alias crepo='rm -rf ~/.m2/repository/'
alias buildserver='cd server && mvn clean install && cd war-prod && mvn gae:stop clean verify'
alias buildpeer='cd peer && mvn clean install && cd war && mvn gae:stop clean verify'
alias cleanrun='cd war-prod && stopall ; mvn clean gae:run'
alias deploy='cd war-prod/ && mvn -Dgae.deps.split -Dbot.secret=$YOUR_SECRET gae:deploy'
alias localpeer='cd peer/ && java -Dphoto.dir.override=file:/$HOME/fspotcloud/peer/src/test/resources/Photos -Dphoto.dir.original=file:///home/steven/Photos -Dpause=3 -Dendpoint=localhost:8080 -Dbot.secret=$YOUR_SECRET -Ddb=$HOME/fspotcloud/peer/src/test/resources/photos.db  -cp build/libs/peer-*.jar com.googlecode.fspotcloud.peer.Main'
alias localbot='cd botdispatch/test-bot/ && java -Dpause=3 -Dendpoint=localhost:8080 -Dbot.secret=$YOUR_SECRET -jar target/test-bot-*-jar-with-dependencies.jar '
alias peer='cd ~/fspotcloud/peer/ && java -Dpause=30 -Djava.util.logging.config.file=target/classes/logging.properties -Dendpoint=$YOUR_APPENGINE_DEPLOYMENT -Dbot.secret=$YOUR_SECRET -Ddb=$HOME/.config/f-spot/photos.db  -jar target/peer-*-jar-with-dependencies.jar '

alias peerprodlocal='cd ~/fspotcloud/peer/ && java -Dpause=5 -Djava.util.logging.config.file=target/classes/logging.properties -Dendpoint=localhost:8080 -Dbot.secret=$YOUR_SECRET -Ddb=$HOME/.config/f-spot/photos.db  -jar target/peer-*-jar-with-dependencies.jar '
alias runlocal='cd ~/fspotcloud && g -x :client:compileGwt gae-e2e:{gaeStop,gaeRun}'
alias runlocalj2ee='cd ~/fspotcloud && g -x :client:compileGwt j2ee-e2e:{tomcatStop,tomcatRun}'
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
function unit_test_coverage() {
  MODULE=$1;
  (cd $MODULE && mvn clean cobertura:cobertura && x-www-browser target/site/cobertura/index.html);
}
alias totalbuild='time (build && gbuildall)'
function bumpUpVersions() {
  VERSION=$(grep version build.gradle |cut -d" " -f7);
  NEXT_VERSION_NUMBER=$(( ${VERSION:6:2} + 1));
  VERSION=${VERSION:1:8}
  cd ~/fspotcloud;
  sed -i -e "s/${VERSION}/0.12-${NEXT_VERSION_NUMBER}g/" build.gradle;
  MVN_VERSION=$(grep 'version>0.12-' pom.xml|cut -c14-20);
  find -name pom.xml -exec sed -i -e "s/${MVN_VERSION}/0.12-${NEXT_VERSION_NUMBER}/" {} \; ;
}

function shortcompile() {
   g {peer-server-integration,server,peer,server-module-j2ee,user-service-gae,user-service-api,model-api,peer-rpc,model-jpa-gae,rpc,model-jpa,test-util,model-jpa-j2ee,server-module-gae,user-service-openid}:build;
}
function shortbuild() {
  g clean;
  shortcompile;
}
function e2etesting() {
  g {gae,j2ee}-e2e:{clean,build}
}

