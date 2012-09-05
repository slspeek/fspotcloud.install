#!/bin/bash
cp -v ~/{com.michelin.cio.hudson.plugins.copytoslave.CopyToSlaveBuildWrapper.xml,config.xml,hudson.plugins.gradle.Gradle.xml,hudson.tasks.Maven.xml} jenkins-config/
cd ~/jobs
cp -v --parents */config.xml ~/fspotcloud.install/jenkins-config/jobs/
