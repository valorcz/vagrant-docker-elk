# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "geerlingguy/centos8"

  config.vm.network "forwarded_port", guest: 5601, host: 5601, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 5001, host: 5001, host_ip: "127.0.0.1"

  # Centos8 workaround
  config.vm.provision :shell, privileged:false, path: "provisioning/provision.sh"

  #config.vm.provision :docker
  #config.vm.provision :docker_compose, yml: "/vagrant/docker-elk/docker-compose.yml", run: "always"

end
