Vagrant.configure("2") do |config|
    config.vm.box = "debian/bullseye64"
    config.vm.synced_folder "./", "/vagrant"
    config.vm.network "forwarded_port", guest: 8080, host: 8080
    config.vm.provision :shell, path: "vagrant_provision.sh"
    config.vm.provider "virtualbox" do |vb|
        vb.name = "DebianVM"     
        vb.memory = 2048
        # vb.gui = true
    end
end