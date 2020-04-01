# Single node k8s cluster on CentOS 8

ONLY FOR DEV. PURPOSES

### Features
- kubeadm
- cri-o
- calico
- selinux in enforcing mode

### Preqeqs
- A CentOS machine/VM minimal install with SSH enabled
- Ansible installed on your machine
- Replace all references to 10.0.1.18 with your masters IP (doh)
- Helm for Traefik deployment

### Installation
1. Run playbooks in order (edit hosts file with your IP)
2. SSH to node and run "kubeadm init --pod-network-cidr=192.168.0.0/16"
3. Follow instructions to set up kubectl config
4. Deploy pod network "kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml"
5. Remove taint from master to allow scheduling of pods, "kubectl taint nodes --all node-role.kubernetes.io/master-"
6. Optionally copy the kubeconfig file to your machine (scp root@10.0.1.18:~/.kube/config ~/.kube/config)

### Deploy Traefik & sample application
1. Edit script helm_deploy_traefik.sh with your IP
2. Run script helm_deploy_traefik.sh in sample_app/ dir
3. Edit ingress part of sample_app.yaml with host name of choice
4. Apply the sample app, "kubectl apply -f sample_app/sample_app.yaml"
5. Test app with "curl -H "Host: sample-app.localdomain" 10.0.1.18" or add sample-app.localdomain to your /etc/hosts file or local DNS server