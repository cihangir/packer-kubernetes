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

for folder in "${folders[@]}"
do
  echo "$folder"
  if [ -d "$folder" ]; then
    for i in $(ls -d $folder);
    do
      if [ -f $i ]; then
        echo "$fi"
        cati=$(cat $i)
        echo "${cati//\$private_ipv4/$privateIp}" > $i
      fi
    done;
  fi;
done;
