# The first two variables are user-editable
export YOUR_SECRET=VERY_GRADLE
export GAE_APPLICATION_ID=jfspotcloud
export PATH=$HOME/gradle-2.2/bin:$HOME/apache-maven-3.2.5/bin:$PATH
export CDPATH=~/fspotcloud
export YOUR_APPENGINE_DEPLOYMENT=${GAE_APPLICATION_ID}.appspot.com
function vt() {
  x-www-browser $1build/reports/tests/index.html;
}
alias gb='g build'
alias gcb='g clean build'
alias gcl='g clean'
alias cgradle='rm -rf ~/.gradle/ ~/fspotcloud/.gradle'
alias vienv='vim ~/fspotcloud.install/env.sh'
alias status='hg status && hg outgoing ; hg identify'
alias allstat='cd ~/fspotcloud.install && status ;cd ~/fspotcloud && status ; cd ~/botdispatch && status;cd ~/fspotcloud.simplejpadao/ && status ; cd ~/taskqueuedispatch/ && status'
alias cleanall='cd ~/fspotcloud && mvn clean ; find -type d \( -name bin -or -name target -or -name runtime -or -name MODELJPA -or -name te-report \) -exec rm -rvf {} \;'
alias stopall='(cd ~/fspotcloud/gae-war && mvn gae:stop);(cd ~/fspotcloud && g {j2ee,gae}-e2e:clean && g --stop)'
alias build='stopall; cd ~/fspotcloud && time (cleanall ; mvn -Dfspotcloud.test.webdriver=fire -Dmaven.test.failure.ignore=false install testability:testability)'
alias sbuild='stopall; cd ~/fspotcloud && time (cleanall ; mvn -Dmaven.test.error.ignore -Dmaven.test.failure.ignore -Dnodelete -Dfspotcloud.test.webdriver=fire )'
alias crepo='rm -rf ~/.m2/repository/'
alias deploy='cd war-prod/ && mvn -Dgae.deps.split -Dbot.secret=$YOUR_SECRET gae:deploy'
alias localpeer='cd peer/ && java -Dphoto.dir.override=file:/$HOME/fspotcloud/peer/src/test/resources/Photos -Dphoto.dir.original=file:///home/steven/Photos -Dpause=3 -Dendpoint=localhost:8080 -Dbot.secret=$YOUR_SECRET -Ddb=$HOME/fspotcloud/peer/src/test/resources/photos.db  -cp build/libs/peer-*.jar com.googlecode.fspotcloud.peer.Main'
alias localbot='cd botdispatch/test-bot/ && java -Dpause=3 -Dendpoint=localhost:8080 -Dbot.secret=$YOUR_SECRET -jar target/test-bot-*-jar-with-dependencies.jar '
alias localprodpeer='cd ~/fspotcloud/peer/ && java -Dpause=5 -Djava.util.logging.config.file=target/classes/logging.properties -Dendpoint=localhost:8080 -Dbot.secret=$YOUR_SECRET -Ddb=$HOME/.config/f-spot/photos.db  -cp build/libs/peer-*.jar com.googlecode.fspotcloud.peer.Main'
alias runlocal='cd ~/fspotcloud && g -x :client:compileGwt gae-e2e:{gaeStop,gaeRun} -Pserver_daemon=false'
alias runlocalj2ee='cd ~/fspotcloud && g -x :client:compileGwt j2ee-e2e:{tomcatStop,tomcatRun} -Pserver_daemon=false'
alias gwt='g client:gwtDM'
alias viewtestdb='sqlitebrowser $HOME/fspotcloud/peer/src/test/resources/photos.db'
alias reclipse='g cleanEclipse eclipse' 
alias reidea='g cleanIdea idea'
alias mci='mvn clean install'
alias rununinstaller='java -jar ~/FSpotCloud/Uninstaller/uninstaller.jar'
alias sim='cd ~/fspotcloud.simplejpadao'
function g() {
  CMD="gradle --daemon $@";
  echo $CMD;
  $CMD;
}
function mvn_unit_test_coverage() {
  MODULE=$1;
  (cd $MODULE && mvn clean cobertura:cobertura && x-www-browser target/site/cobertura/index.html);
}

function shortcompile() {
   g {peer-server-integration,server,peer,server-module-j2ee,user-service-gae,user-service-api,model-api,peer-rpc,model-jpa-gae,rpc,model-jpa,test-util,model-jpa-j2ee,server-module-gae,user-service-openid}:build;
}

function shortbuild() {
  g clean;
  shortcompile;
}
alias g2e='g gae-e2e:{clean,test}'
alias g2eall='g2e -Pall_tests=true'

function j2e(){
(cd j2ee-e2e && g {clean,test} $@) && g j2ee-server-test:{clean,build}
}
alias j2eall='j2e -Pall_tests=true'
function e2etesting_all() {
  g2e -Pall_tests=true $@ && j2e -Pall_tests=true $@;
}
function e2etesting() {
  g2e && j2e;
}

function deps () {
  g ${1}:dependencies
}
function vcober() {
    x-www-browser $1/build/reports/cobertura/index.html;
}
alias server_coverage='g -Pcobertura=true server:clean serverUnittestCoverage; vcober server'
alias client_coverage='g -Pcobertura=true client:clean clientUnittestCoverage -x client:compileGwt; vcober client'
alias keyboard_coverage='g -Pcobertura=true keyboard-action:clean keyboardactionUnittestCoverage -x keyboard-action:compileGwt; vcober keyboard-action'
alias rpc_coverage='g -Pcobertura=true rpc:clean rpcUnittestCoverage -x keyboard-action:compileGwt; vcober rpc'
alias blob='cd ~/fspotcloud.simpleblobstore/'
alias gmodel='g model-{api,jpa,jpa-gae,jpa-j2ee}:{clean,build}'
alias compileAll='g compileJava -x :client:compileGwt'
alias compileAllTests='g compileTestJava -x :client:compileGwt'
alias vtj2e='x-www-browser server-module-j2ee/build/reports/tests/index.html'
alias vtgae='x-www-browser server-module-gae/build/reports/tests/index.html'
alias itestj2e='cd ~/fspotcloud && g server-module-j2ee:{clean,test}'
alias itestgae='cd ~/fspotcloud && g server-module-gae:{clean,test}'
alias installers='g installer-{gae,peer,j2ee-server}:build'
alias ffbuild='time (compileAll && compileAllTests && shortcompile && g client:build && e2etesting && installers)'
alias release_build='time g clean build -Prelease=true -Pall_tests=true -Panalysis=true projectReport'
alias startAr='cd ~/tools/apache-archiva-1.3.5/ && bin/archiva console'
alias stanal='g -Panalysis=true projectReport jdepend{Main,Test} pmd{Main,Test} findbugs{Main,Test} checkstyle{Main,Test}'
alias reload_env='source ~/fspotcloud.install/env.sh'
