sudo useradd ppacquing
echo "vagrant" | sudo passwd --stdin ppacquing

mkdir jupyterconfig
cd jupyterconfig
/usr/local/anaconda3/bin/jupyterhub --generate-config
# Add spawner
# c.Spawner.cmd = '/usr/local/anaconda3/bin/jupyterhub-singleuser'
/usr/local/anaconda3/bin/jupyterhub -f jupyterhub_config.py