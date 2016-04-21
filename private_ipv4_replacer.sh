#! /bin/bash
set -o errexit

files=(
  /etc/kubernetes.env
  /etc/instance.env
)

folders=(
  /etc/kubernetes/manifests
  /etc/kubernetes/addons
)

privateIp=$(cat /etc/private_ipv4)

for i in "${files[@]}"
do
  if [ -f $i ]; then
    cati=$(cat $i)
    echo "${cati//\$private_ipv4/$privateIp}" > $i
  fi
done;

for fi in "${folders[@]}"
do
  for i in $(ls -d $fi);
  do
    if [ -f $i ]; then
      cati=$(cat $i)
      echo "${cati//\$private_ipv4/$privateIp}" > $i
    fi
  done;
done;
