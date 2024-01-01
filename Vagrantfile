# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  
  config.ssh.insert_key = false
  config.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.define "master" do |node|
    node.vm.hostname = "master"
    node.vm.network "private_network", ip: "192.168.56.10"
  end

  (1..2).each do |i|
    config.vm.define "worker-#{i}" do |node|
      node.vm.hostname = "worker-#{i}"
      node.vm.network "private_network", ip: "192.168.56.#{10 + i}"
    end
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
    config.vbguest.no_install = true
    config.vbguest.no_remote = true
  end
  config.vm.provision "shell", name: "install-essential-tools", path: "install-essential-tools.sh", privileged: false
  config.vm.provision "shell", name: "allow-bridge-nf-traffic", path: "allow-bridge-nf-traffic.sh", privileged: false
  config.vm.provision "shell", name: "install-containerd", path: "install-containerd.sh", privileged: false
  config.vm.provision "shell", name: "install-kubeadm", path: "install-kubeadm.sh", privileged: false
  config.vm.provision "shell", name: "update-kubelet-config", path: "update-kubelet-config.sh", args: ["eth1"], privileged: false
end
