# -*- mode: ruby -*-
# vi: set ft=ruby :
# sublime: x_syntax Packages/Ruby/Ruby.tmLanguage

Vagrant.configure("2") do |config|
    config.vm.box = "debian64_puppet31"
    config.vm.box_url = "http://www.harrenmediatools.com/utils/debian64_puppet31.box"

    # Internal Network
    config.vm.network :private_network, ip: "192.168.33.10"
    config.vm.hostname = "symfony.boilerplate.dev"
    config.vm.synced_folder ".", "/vagrant", :nfs => true

    # VM Settings
    config.vm.network :forwarded_port, guest: 80, host: 8080

    config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--usb", "off"]
        vb.customize ["modifyvm", :id, "--usbehci", "off"]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        vb.customize ["modifyvm", :id, "--memory", 1024]
        vb.customize ["modifyvm", :id, "--vram", 5]
        vb.customize ["modifyvm", :id, "--name", "Symfony Boilerplate"]
    end

    config.vm.provision :puppet do |puppet|
        puppet.facter         = { "fqdn" => config.vm.hostname }
        puppet.manifest_file  = "default.pp"
        puppet.manifests_path = "puppet/manifests"
        puppet.module_path    = "puppet/modules"
    end
end
