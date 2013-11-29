#!/bin/sh
sudo puppet apply /Users/gsoeldner/MyApps/puppet/manifests/site.pp --modulepath=/Users/gsoeldner/MyApps/puppet/modules/ $*
