Vagrant.require_version ">= 1.5"

Vagrant.configure("2") do |config|
    # Box Source
    config.vm.box = "ubuntu/trusty64"

    # Internal Network
    config.vm.network :private_network, ip: "192.168.33.11"
    config.vm.network :forwarded_port, guest: 80, host: 1116

    # SSH Connection
    config.ssh.forward_agent = true

    # Configure the VM
    config.vm.provider :virtualbox do |v|
        v.name = "symfony-boilerplate"
        v.customize [
            "modifyvm", :id,
            "--cpus", 2,
            "--memory", 2048,
            "--name", "symfony-boilerplate",
            "--natdnshostresolver1", "on",
            "--natdnsproxy1", "on",
            "--usb", "off",
            "--usbehci", "off",
            "--vram", 5,
        ]
    end

    # Handle synchronized folders
    config.vm.synced_folder ".", "/vagrant", :nfs => true, :mount_options => ["nolock,vers=3,tcp"]

    # Install Ansible and provision the VM
    config.vm.provision "shell", :inline => "/vagrant/.ansible/install_requirements.sh"
    config.vm.provision "shell", :inline => "/vagrant/.ansible/install_data.sh"
end
