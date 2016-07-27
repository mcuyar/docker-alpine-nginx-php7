#!/usr/bin/env bash

##/
 # Add a known host entry
 #
 # @param string $host
 #/
function known_host() {
    local host=$1
    ssh-keyscan ${host} | tee -a ~/.ssh/known_hosts
}

known_host github.com
known_host bitbucket.org