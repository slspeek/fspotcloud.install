#!/bin/bash
set -e
HGCMD='hg clone --insecure'
cd ~
if [ ! -d ~/fspotcloud.simplejpadao ]; then
	$HGCMD https://simplejpadao.fspotcloud.googlecode.com/hg/ fspotcloud.simplejpadao
fi
if [ ! -d ~/fspotcloud ]; then
	$HGCMD https://javasrc.fspotcloud.googlecode.com/hg/ fspotcloud
fi
if [ ! -d ~/botdispatch ]; then
	$HGCMD https://botdispatch.googlecode.com/hg/ botdispatch
fi
if [ ! -d ~/taskqueuedispatch ]; then
	$HGCMD https://taskqueuedispatch.googlecode.com/hg/ taskqueuedispatch
fi
