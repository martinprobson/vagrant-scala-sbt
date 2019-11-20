# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Changes made to support docker as a provider.
# 
Vagrant.require_version '>= 1.4.3'
VAGRANTFILE_API_VERSION = '2'.freeze

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.provider "docker" do |d|
	    d.image = "nishidayuya/docker-vagrant-ubuntu:xenial"
	    d.has_ssh = true
#	    d.ports = ["8088:8088"]
    end
    config.vm.provider "virtualbox" do |v, override|
#	    override.vm.box = "ubuntu/xenial64"
	    override.vm.box = "ubuntu/bionic64"
	    v.gui = false
	    v.name = "scala-sbt"
            v.customize ['modifyvm', :id, '--memory', '8192']
    end
#    config.vm.network "forwarded_port", guest: 8080, host: 8080
    config.vm.define "scala-sbt" do |node|
        node.vm.network :private_network, ip: '10.211.55.101'
        node.vm.hostname = 'scala-sbt'
        node.vm.provision :shell, path: 'scripts/setup-ubuntu.sh'
        node.vm.provision :shell, path: 'scripts/setup-java.sh'
        node.vm.provision :shell, path: 'scripts/setup-sbt.sh'
        node.vm.provision :shell, privileged: false, path: 'scripts/setup-utils.sh'
        node.vm.provision :shell, path: 'scripts/finalize-ubuntu.sh'
    end
end
