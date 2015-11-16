#!/bin/bash

wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo "deb http://pkg.jenkins-ci.org/debian binary/" >> /etc/apt/sources.list

apt-get update
apt-get -y install jenkins

service jenkins restart


#TO DO:
#Promoted build plugin
#https://wiki.jenkins-ci.org/display/JENKINS/Promoted+Builds+Plugin
