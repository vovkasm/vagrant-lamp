# -*- mode: ruby -*-
# vi: set ft=ruby :

# Recommended plugins:
# - vagrant-vbguest
Vagrant.configure(2) do |c|
    c.vm.box = "ubuntu/precise64"

    c.vm.hostname = "lamp"
    c.vm.network :private_network, type: "dhcp"

    c.vm.synced_folder "docs/", "/var/www/docs/", :owner => "www-data", :mount_options => [ "dmode=775", "fmode=774" ]

    c.vm.provider "virtualbox" do |v|
        v.memory = 1024
    end

    #c.vm.provision :shell, path: "provision.sh"
    c.vm.provision "puppet" do |p|
        p.module_path = "modules"
    end
end
