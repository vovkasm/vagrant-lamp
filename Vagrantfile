# -*- mode: ruby -*-
# vi: set ft=ruby :

# Recommended plugins:
# - vagrant-vbguest
Vagrant.configure(2) do |c|
    c.vm.box = "ubuntu/precise64"

    c.vm.hostname = "sample.vagrant.dev"
    c.vm.network :private_network, type: "dhcp"
    c.landrush.enabled = true

    c.vm.synced_folder "docs/", "/var/www/docs/", :owner => "www-data", :mount_options => [ "dmode=775", "fmode=774" ]

    c.vm.provider "virtualbox" do |v|
        v.memory = 1024
    end

    #c.vm.provision :shell, path: "provision.sh"
    c.vm.provision "shell", path: "install-puppet.sh"
    $puppet_script = <<END
export FACTER_dbname=sample1
export FACTER_dbuser=sample1
export FACTER_dbpassword=sample1
/opt/puppetlabs/bin/puppet apply --modulepath=/vagrant/modules /vagrant/manifests/default.pp
END
    c.vm.provision "shell", inline: $puppet_script
    # Fucking vagrant not updated for puppet 4+ for year... (((
    #c.vm.provision "puppet" do |p|
    #    p.binary_path = "/opt/puppetlabs/bin"
    #    p.module_path = "modules"
    #    p.facter = {
    #        "fqdn" => c.vm.hostname
    #    }
    #    p.options = "--verbose --debug"
    #end
end
