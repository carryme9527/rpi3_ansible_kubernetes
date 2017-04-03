# Play Raspberry Pi 3 with Ansible & Kubernetes

## install ansible

> pip install ansible

## steps

### step 00: create ssh key

``` shell
mkdir .ssh
ssh-keygen -P ''  -f .ssh/id_rsa
```

### step 01: flush image to SD cards

01.flush.images/main.sh

### step 02:

ansible-playbook -i inventories/pirate 02.env.setup.ansible/create-new-user-k8s.yml
ansible-playbook -i inventories/k8s 02.env.setup.ansible/disable-user-pirate.yml

### step 03:

ansible-playbook -i inventories/k8s 03.setup.kubernetes.cluster/install.kubernetes.yml
ansible-playbook -i inventories/k8s 03.setup.kubernetes.cluster/master.setup.yml
ansible-playbook -i inventories/k8s 03.setup.kubernetes.cluster/slaves.join.yml

issue: https://github.com/kubernetes/kubeadm/issues/212

---
references:

[]: https://blog.hypriot.com/post/setup-kubernetes-raspberry-pi-cluster/  
[]: https://github.com/hypriot/flash  
[]: https://github.com/hypriot/image-builder-rpi/releases  
[]: http://acalustra.com/ansible-how-to-maintain-multiple-ssh-keys-in-different-servers.html  
[]: https://github.com/Project31/ansible-kubernetes-openshift-pi3  
