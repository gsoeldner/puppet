#!/bin/sh
sudo puppet apply /home/gsoeldner/puppet/manifests/site.pp --modulepath=/home/gsoeldner/puppet/modules/ $*
