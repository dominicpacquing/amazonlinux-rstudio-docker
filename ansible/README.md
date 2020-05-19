```
docker build -t ansible-amazon:1 .
```

```
docker run -p 3838:3838 -p 8787:8787 --rm -it -v /Users/dominicpacquing/Projects/qantas/lto-ansible:/lto-ansible ansible-amazon:1 /bin/bash
```

```
ansible-playbook -i inventories/hosts deploy_role_local.yml -e "role_to_deploy=rstudio hosts=local use_sts=false set_dns=false" -u ansible -vvv
```

