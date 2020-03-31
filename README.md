# Single node k8s cluster on CentOS 8

### Features
- kubeadm
- cri-o
- calico

### Preqeqs
- A CentOS machine/VM minimal install with SSH enabled
- Ansible installed on your machine

### Installation
1. Run playbooks in order (edit hosts file with your IP)
2. SSH to node and run "kubeadm init --pod-network-cidr=192.168.0.0/16"
3. Follow instructions to set up kubectl config
4. Deploy pod network "kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml"
5. Optionally copy the kubeconfig file to your machine
