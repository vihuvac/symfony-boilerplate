# -*- mode: ruby -*-
# vi: set ft=ruby :
# sublime: x_syntax Packages/Ruby/Ruby.tmLanguage

Vagrant.configure("2") do |config|
  config.vm.box = "debian64_puppet31"
  config.vm.box_url = "http://www.harrenmediatools.com/utils/debian64_puppet31.box"

  #internal network
  config.vm.network :private_network, ip: "192.168.33.20"
  config.vm.hostname ='hostname.domain.dev'
  config.vm.synced_folder ".", "/vagrant", :nfs => true

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provision :puppet do |puppet|
    puppet.facter = { 'fqdn' => config.vm.hostname }
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "puppet/modules"
  end

end

