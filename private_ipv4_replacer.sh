#! /bin/bash
set -o errexit

files=(
  /etc/kubernetes.env
  /etc/instance.env
  /etc/kubernetes/manifests/kube-apiserver.yaml
  /etc/kubernetes/manifests/kube-controller-manager.yaml
  /etc/kubernetes/manifests/kube-podmaster.yaml
  /etc/kubernetes/manifests/kube-proxy.yaml
  /etc/kubernetes/manifests/kube-scheduler.yaml
  /etc/kubernetes/addons/skydns-rc.yaml
  /etc/kubernetes/addons/skydns-svc.yaml
)

privateIp=$(cat /etc/private_ipv4)

for i in "${files[@]}"
do
  cati=$(cat $i)
  echo "${cati//\$private_ipv4/$privateIp}" > $i
done
