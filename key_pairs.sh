#/bin/bash

mkdir -p certs/ssl

openssl genrsa -out certs/ssl/ca-key.pem 2048
openssl req -x509 -new -nodes -key certs/ssl/ca-key.pem -days 10000 -out certs/ssl/ca.pem -subj "/CN=kube-ca"

openssl genrsa -out certs/ssl/apiserver-key.pem 2048
openssl req -new -key certs/ssl/apiserver-key.pem -out certs/ssl/apiserver.csr -subj "/CN=kube-apiserver"
openssl x509 -req -in certs/ssl/apiserver.csr -CA certs/ssl/ca.pem -CAkey certs/ssl/ca-key.pem -CAcreateserial -out certs/ssl/apiserver.pem -days 10000

openssl genrsa -out certs/ssl/proxy-key.pem 2048
openssl req -new -key certs/ssl/proxy-key.pem -out certs/ssl/proxy.csr -subj "/CN=kube-proxy"
openssl x509 -req -in certs/ssl/proxy.csr -CA certs/ssl/ca.pem -CAkey certs/ssl/ca-key.pem -CAcreateserial -out certs/ssl/proxy.pem -days 10000

openssl genrsa -out certs/ssl/kubelet-key.pem 2048
openssl req -new -key certs/ssl/kubelet-key.pem -out certs/ssl/kubelet.csr -subj "/CN=kubelet"
openssl x509 -req -in certs/ssl/kubelet.csr -CA certs/ssl/ca.pem -CAkey certs/ssl/ca-key.pem -CAcreateserial -out certs/ssl/kubelet.pem -days 10000
