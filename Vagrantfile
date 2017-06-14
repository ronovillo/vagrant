# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  #SSH username/password:
  #config.ssh.username = "vagrant"
  #config.ssh.password = "vagrant"

  #config.vm.provider :virtualbox do |vb|
  #   vb.customize ["modifyvm", :id, "--natnet1", "192.168.1/16"]
  #end

  #Configuracion
  config.vm.define "lamp_dev" do |lamp_dev|
  	lamp_dev.vm.hostname = "DEV"
  	lamp_dev.vm.network "private_network", ip: "192.168.1.100"
  	lamp_dev.vm.provision:shell, path:"script.sh"
    lamp_dev.vm.provision "docker"
    #lamp_dev.vm.provision "file", source: "~/.ssh/jenkins.pub", destination: "~/.ssh/jenkins.pub"
  end

  config.vm.define "lamp_qa" do |lamp_qa|
  	lamp_qa.vm.hostname = "QA"
    lamp_qa.vm.network "private_network", ip: "192.168.1.101"
  	lamp_qa.vm.provision:shell, path:"script.sh"
    lamp_qa.vm.provision "docker"
    #lamp_qa.vm.provision "file", source: "~/.ssh/jenkins.pub", destination: "/home/vagrant"
  end

  config.vm.define "registry" do |registry|
      registry.vm.hostname = "docker-registry"
      registry.vm.network "private_network", ip: "192.168.1.120"
      registry.vm.provision "docker"
      registry.vm.provision "shell", inline: "docker run -d -p 5000:5000 --restart=always --name registry -v /home/vagrant/:/var/lib/registry registry:2"
  end

end
