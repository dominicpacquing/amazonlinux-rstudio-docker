### Pre-requisites

* Vagrant

        brew install vagrant
 
* VirtualBox

        brew install virtualbox

* Install vbguest vagrant plugin

		vagrant plugin install vagrant-vbguest


### Running


1. Spin up vm

        vagrant up

2. Update inventory to use static ip address 

        [vagrant]
        192.168.50.4
        
3. Go to your playbook and run pointing to that host

        ansible-playbook -i inventories/hosts deploy_role_host.yml -e "role_to_deploy=jupyterhub hosts=vagrant use_sts=false set_dns=false" -u ec2-user
        ansible-playbook -i inventories/hosts deploy_role_host.yml -e "role_to_deploy=rstudio hosts=vagrant use_sts=false set_dns=false" -u ec2-user
    
    
### Clean up


    vagrant halt
    vagrant destroy # optional
