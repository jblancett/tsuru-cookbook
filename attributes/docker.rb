default['docker']['host'] = ['tcp://0.0.0.0:2375','unix:///var/run/docker.sock']
default['docker']['package']['repo_url'] = 'https://get.docker.io/ubuntu'
default['docker']['package']['name'] = 'lxc-docker'
default['docker']['exec_driver'] = 'lxc'
default['docker']['storage_driver'] = 'aufs'