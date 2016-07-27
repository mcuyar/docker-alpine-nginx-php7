#!/usr/bin/env bash

##/
 # Create known_hosts file in .ssh directory
 #
 # @param string $host
 #/
function create_known_hosts_file() {
    mkdir -p ~/.ssh
    touch ~/.ssh/known_hosts
    chmod 0644 ~/.ssh/known_hosts
}

##/
 # Add a known host entry
 #
 # @param string $host
 #/
function known_host() {
    local host=$1

    if [ ! -f ~/.ssh/known_hosts ]; then
        create_known_hosts_file
    fi

    ssh-keyscan ${host} | tee -a ~/.ssh/known_hosts
}

known_host github.com
known_host bitbucket.org