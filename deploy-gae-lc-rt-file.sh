GAE_VERSION=1.6.6
mvn deploy:deploy-file -DgroupId=com.google.appengine -DartifactId=appengine-local-runtime -Dversion=$GAE_VERSION -Dpackaging=jar -Dfile=$HOME/appengine-java-sdk-$GAE_VERSION/lib/impl/appengine-local-runtime.jar -Durl=dav:https://fspotcloud-maven.googlecode.com/svn/maven/repository -DrepositoryId=fspotcloud-maven
