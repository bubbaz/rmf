#!/bin/bash

repoList="epel rhel-7-server-rpms rhel-7-server-extras-rpms rhel-7-server-rhn-tools-rpms rhel-7-server-ansible-2.8-rpms rhel-7-server-ansible-2.9-rpms rhel-7-server-rh-common-rpms rhel-7-server-supplementary-rpms rhel-7-server-optional-rpms rhel-server-rhscl-7-rpms "

echo "running yum clean all"
yum clean all

echo "delete old yum cache"
/usr/bin/rm -rf /var/cache/yum/*

echo "running yum list-sec"
yum list-sec

for i in $repoList; do
  reposync --gpgcheck -l -n --downloadcomps --download-metadata --repoid=$i --download_path=/repo
  createrepo -v /repo/$i -g /repo/$i/comps.xml --update
  mv -f /var/cache/yum/x86_64/7Server/$i/gen/*updateinfo.xml /repo/$i/repodata/updateinfo.xml
  modifyrepo /repo/$i/repodata/updateinfo.xml /repo/$i/repodata
done
