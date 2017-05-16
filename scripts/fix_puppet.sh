#!/bin/bash

sudo systemctl stop puppetmaster

sudo clush -w @compute systemctl stop puppet

sudo clush -w @all rm -fr /var/lib/puppet/ssl/*

sudo timeout --signal=2 10s puppet master --verbose --no-daemonize

sudo systemctl start puppetmaster

sudo clush -w @compute systemctl start puppet

sudo puppet cert list

sudo puppet cert sign --all
