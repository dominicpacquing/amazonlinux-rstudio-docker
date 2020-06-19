sudo useradd paul.pacquing
echo "vagrant" | sudo passwd --stdin paul.pacquing

mkdir jupyterconfig
cd jupyterconfig
/usr/local/anaconda3/bin/jupyterhub --generate-config
# Add spawner
# vi jupyterhub_config.py
# c.Spawner.cmd = '/usr/local/anaconda3/bin/jupyterhub-singleuser'
/usr/local/anaconda3/bin/jupyterhub -f jupyterhub_config.py