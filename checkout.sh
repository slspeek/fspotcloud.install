#!/bin/bash
set -e
cd ~
if [ ! -d ~/fspotcloud.simplejpadao ]; then
	hg clone https://simplejpadao.fspotcloud.googlecode.com/hg/ fspotcloud.simplejpadao
fi
if [ ! -d ~/fspotcloud ]; then
	hg clone https://java.fspotcloud.googlecode.com/hg/ fspotcloud
fi
if [ ! -d ~/botdispatch ]; then
	hg clone https://botdispatch.googlecode.com/hg/ botdispatch
fi
if [ ! -d ~/taskqueuedispatch ]; then
	hg clone https://taskqueuedispatch.googlecode.com/hg/ taskqueuedispatch
fi
