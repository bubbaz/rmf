#!/bin/bash

repoList="epel rhel-7-server-rpms rhel-7-server-extras-rpms rhel-7-server-rhn-tools-rpms rhel-7-server-ansible-2.8-rpms rhel-7-server-ansible-2.9-rpms rhel-7-server-rh-common-rpms rhel-7-server-supplementary-rpms rhel-7-server-optional-rpms rhel-server-rhscl-7-rpms "

for i in $repoList; do
 rm -vf $(repomanage --old /repo/$1)  
done
