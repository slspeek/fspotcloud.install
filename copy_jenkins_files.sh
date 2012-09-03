#!/bin/bash
cp -v jenkins-config/*.xml ~
mkdir -p ~/jobs
cp -rv jenkins-config/jobs/* ~/jobs/
