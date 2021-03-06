#!/bin/bash
# Run Kubernetes using Docker
# Note that some k8s features do not work in Docker:   gitRepo volumes (use a git sidecar image instead)

export K8S_VERSION=$(curl -sS https://storage.googleapis.com/kubernetes-release/release/stable.txt)

# See https://github.com/kubernetes/kubernetes/issues/23392
# systemd startup for docker needs to be tweaked.
#     --volume=/var/lib/kubelet/:/var/lib/kubelet:rw,shared \
# note: this did not work for me on ubuntu 16.04 - it made system unstable,
# presumably because the containers are run in privileged mode and can interact with the host o/s



echo "Cleaning up any old Docker containers"

./stopdocker.sh

sudo docker run \
    --volume=/:/rootfs:ro \
    --volume=/sys:/sys:ro \
    --volume=/var/lib/docker/:/var/lib/docker:rw \
    --volume=/var/lib/kubelet/:/var/lib/kubelet:rw \
    --volume=/var/run:/var/run:rw \
    --net=host \
    --pid=host \
    --privileged=true \
    --name=kubelet \
    -d \
    gcr.io/google_containers/hyperkube-amd64:${K8S_VERSION} \
    /hyperkube kubelet \
        --containerized \
        --hostname-override="127.0.0.1" \
        --address="0.0.0.0" \
        --api-servers=http://localhost:8080 \
        --config=/etc/kubernetes/manifests \
        --cluster-dns=10.0.0.10 \
        --cluster-domain=cluster.local \
        --allow-privileged=true --v=2


echo "Waiting a bit for Kubernetes to start"
sleep 40

# todo: loop until kube comes up
kubectl get nodes

echo "Setting up DNS"
./dns.sh

