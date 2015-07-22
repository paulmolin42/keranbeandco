Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.hostname = "plateforme-and-co"
  config.vm.network :private_network, ip: "199.199.199.142"

  config.vm.synced_folder "www/", "/applis/www", type: "nfs", nfs_export: true, nfs_udp: true, create: true

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/site.yml"
  end
end
