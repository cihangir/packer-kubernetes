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
  if [ -d "$folder" ]; then
    for i in $(ls $folder);
    do
      file="$folder/$i"
      if [ -f $file ]; then
        cati=$(cat $file)
        echo "${cati//\$private_ipv4/$privateIp}" > $file
      fi
    done;
  fi;
done;
