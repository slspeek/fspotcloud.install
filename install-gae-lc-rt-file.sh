GAE_VERSION=1.7.4
mvn install:install-file -DgroupId=com.google.appengine -DartifactId=appengine-local-runtime -Dversion=$GAE_VERSION -Dpackaging=jar -Dfile=$HOME/appengine-java-sdk-$GAE_VERSION/lib/impl/appengine-local-runtime.jar
