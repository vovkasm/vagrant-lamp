#!/usr/bin/env bash

if [ ! -d /opt/puppetlabs ]; then
    echo "Installing puppet..."
    if [ ! -f puppetlabs-release-pc1-precise.deb ]; then
        wget https://apt.puppetlabs.com/puppetlabs-release-pc1-precise.deb
    fi
    dpkg -i puppetlabs-release-pc1-precise.deb
    apt-get update
    apt-get install -y puppet-agent
else
    echo "Puppet already installed."
fi
