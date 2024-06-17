#!/bin/bash

echo -n "Creating the '/etc/yum.repos.d/rhaap.repo' file... "
cat <<EOF > /etc/yum.repos.d/rhaap.repo
[rhaap]
name=Red Hat Ansible Automation Platform 2.4
baseurl=file:///tmp/rhaap/ansible-automation-platform-setup-bundle-2.4-5-x86_64/bundle/packages/el9/repos/
enabled=true
gpgcheck=true
EOF
if [ $? -eq 0 ]
then
  echo "DONE"
  echo -n "Installing the 'ansible-navigator' package... "
  dnf -y install ansible-navigator &> /dev/null
  if [ $? -eq 0 ]
  then
    echo "DONE"
  else
    echo "FAILED"
  fi
else
  echo "FAILED"
fi

echo -n "Installing the 'Workstation' environment group... "
dnf -y group install Workstation &> /dev/null
if [ $? -eq 0 ]
then
  echo "DONE"
  echo "Rebooting workstation in 10 seconds. Press Ctrl+C to cancel."
  sleep 10
  reboot
else
  echo "FAILED"
fi
