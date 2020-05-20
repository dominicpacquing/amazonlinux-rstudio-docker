### Pre-requisites

* Vagrant

        brew install vagrant
 
* VirtualBox

        brew install virtualbox

### Setup

* Install vbguest vagrant plugin


		vagrant plugin install vagrant-vbguest


* Update Vagrantfile to point to lto-ansible 


		config.vm.synced_folder 


### Running


    vagrant up

    vagrant ssh

    sudo su

    cd /lto-ansible

    ansible-playbook -i inventories/hosts deploy_role_local.yml -e "role_to_deploy=rstudio hosts=local use_sts=false set_dns=false"
    
    
### Clean up


    vagrant halt
    vagrant destroy # optional
