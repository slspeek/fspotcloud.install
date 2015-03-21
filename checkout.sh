#!/bin/bash
set -e
GITCMD='git clone'
cd ~
if [ ! -d ~/fspotcloud.simplejpadao ]; then
	$GITCMD git@github.com:slspeek/fspotcloud.simplejpadao.git 
fi
if [ ! -d ~/fspotcloud.simpleblobstore ]; then
	$GITCMD git@github.com:slspeek/fspotcloud.simpleblobstore.git 
fi 
if [ ! -d ~/botdispatch ]; then
	$GITCMD git@github.com:slspeek/botdispatch.git 
fi
if [ ! -d ~/taskqueuedispatch ]; then
	$GITCMD git@github.com:slspeek/taskqueuedispatch.git 
fi 
if [ ! -d ~/fspotcloud ]; then
	$GITCMD git@github.com:slspeek/fspotcloud.javasrc.git fspotcloud
fi
