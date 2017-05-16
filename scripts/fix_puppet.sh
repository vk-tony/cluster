#!/bin/bash

sudo clush -w @compute systemctl stop puppet

sudo clush -w @all rm -fr /var/lib/puppet/ssl/*

sudo systemctl start puppetmaster

sudo clush -w @compute systemctl start puppet

sudo puppet cert list

sudo pupet cert sign --all
