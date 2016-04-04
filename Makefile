etcd_discovery_url:
	curl -s https://discovery.etcd.io/new?size=3 > etcd_discovery_url.txt

kube_token:
	openssl rand -base64 8 |md5 |head -c8 > kube_token.txt
	echo >> kube_token.txt

generate_certs:
	./key_pairs.sh

destroy:
	rm etcd_discovery_url.txt kube_token.txt
	rm -rf certs/ssl
