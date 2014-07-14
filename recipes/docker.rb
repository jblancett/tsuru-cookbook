include_recipe('aufs') if node['docker']['storage_driver'] == 'aufs'
include_recipe('lxc') if node['docker']['exec_driver'] == 'lxc'
include_recipe('docker')