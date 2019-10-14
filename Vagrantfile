# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"

  config.ssh.forward_agent = true

  config.vm.network "forwarded_port", guest: 22, host: 2028
  config.vm.network "forwarded_port", guest: 80, host: 8080


  config.vm.provider "virtualbox" do |vb|
    vb.name = "vagrant-nginx-sandbox"
    vb.cpus = 4
    vb.memory = "1024"
    vb.linked_clone = true

    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["storagectl", :id, "--name", "IDE Controller", "--remove" ]
  end

  config.vm.provision "file", source: "./ansible", destination: "/home/vagrant/ansible"
  config.vm.provision "file", source: "./.private", destination: "/home/vagrant/.private"

  config.vm.provision :shell, :path => "provision.sh"
end
