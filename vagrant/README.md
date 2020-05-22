### Pre-requisites
* Python3

* Vagrant

        brew install vagrant
 
* VirtualBox

        brew install virtualbox

* Install vbguest vagrant plugin

		vagrant plugin install vagrant-vbguest

* Virtualenv & Ansible

        python3 -m venv venv/
        source venv/bin/activate
        pip install ansible
        deactivate #optional
        
* Copy your public key to files/public_keys as ec2-user.pub

        cp ~/.ssh/id_rsa.pub ansible-provisioning/files/public_keys/ec2_user.pub
        
### Running

1. Activate virtualenv

        source venv/bin/activate
    
1. Spin up vm

        vagrant up

2. Update inventory to use static ip address 

        [vagrant]
        192.168.50.4
        
3. Go to your playbook and run pointing to that host

        ansible-playbook -i inventories/hosts deploy_role_host.yml -e "role_to_deploy=jupyterhub hosts=vagrant use_sts=false set_dns=false" -u ec2-user
        ansible-playbook -i inventories/hosts deploy_role_host.yml -e "role_to_deploy=rstudio hosts=vagrant use_sts=false set_dns=false" -u ec2-user
    
4. SSH

        ssh -o UserKnownHostsFile=/dev/null ec2-user@192.168.50.4
            
### Caveats

* Sometimes the provisioner may get stuck since other processes are installing packages

        fatal: [default]: FAILED! => {"changed": false, "msg": "yum lockfile is held by another process"}
        
  In this case just run the provisioner again
  
        vagrant provision
        
### Clean up


    vagrant halt
    vagrant destroy # optional
