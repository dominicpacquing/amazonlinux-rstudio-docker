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
        pip install -r requirements.txt
        pip install pip-tools
        deactivate #optional
        
* Copy your public key to files/public_keys as ec2-user.pub

        cp ~/.ssh/id_rsa.pub ansible-provisioning/files/public_keys/ec2_user.pub
        
### Changes to requirements.in

In any case you need to change requirements, please update the requirements.in then run `pip-compile --generate-hashes`
### Running

1. Activate virtualenv

        source venv/bin/activate
    
1. Spin up vm

        vagrant up --no-provision

2. Update ansible inventory to use static ip address 

        [vagrant]
        192.168.50.4
        
3. Provision the VM

        vagrant provision
        
4. Go to your playbook and run pointing to that host

        ansible-playbook -i inventories/hosts deploy_role_host.yml -e "role_to_deploy=jupyterhub hosts=vagrant use_sts=false set_dns=false" -u ec2-user
        ansible-playbook -i inventories/hosts deploy_role_host.yml -e "role_to_deploy=rstudio hosts=vagrant use_sts=false set_dns=false" -u ec2-user
        ansible-playbook -i inventories/hosts deploy_role_host.yml -e "role_to_deploy=spark hosts=vagrant use_sts=false set_dns=false" -u ec2-user
        ansible-playbook -i inventories/hosts deploy_role_host.yml -e "role_to_deploy=ql_data_scientist_devbox hosts=vagrant use_sts=false set_dns=false" -u ec2-user
        
5. SSH

            ssh -o UserKnownHostsFile=/dev/null ec2-user@192.168.50.4
            
### Caveats

* Sometimes the provisioner may get stuck since other processes are installing packages

        fatal: [default]: FAILED! => {"changed": false, "msg": "yum lockfile is held by another process"}
        
  In this case just run the provisioner again
  
        vagrant provision
        
### Clean up


    vagrant halt
    vagrant destroy # optional
