if node['platform'] == 'ubuntu'

  apt_repository 'tsuru' do
    uri node['tsuru']['package']['repo_url']
    distribution node['lsb']['codename']
    components ['main']
    keyserver 'keyserver.ubuntu.com'
    key node['tsuru']['package']['repo_key']
    deb_src true
  end if node['platform'] == 'ubuntu'

  package 'tsuru-server'

  template '/etc/default/tsuru-server' do
    action :create
    owner 'root'
    group 'root'
    mode 0644
    source 'tsuru-server.erb'
    variables :tsuru => node['tsuru']
  end

  if node['tsuru']['agent']['private_key']
    file node['tsuru']['agent']['private_key_path'] do
      action :create
      owner 'tsuru'
      mode 0600
      content node['tsuru']['agent']['private_key']
    end
  else
    cookbook_file node['tsuru']['agent']['private_key_path'] do
      action :create
      owner 'tsuru'
      mode 0600
      source 'id_rsa'
    end
  end

  if node['tsuru']['agent']['public_key']
    file node['tsuru']['agent']['public_key_path'] do
      action :create
      owner 'tsuru'
      mode 0644
      content node['tsuru']['agent']['public_key']
    end
  else
    cookbook_file node['tsuru']['agent']['public_key_path'] do
      action :create
      owner 'tsuru'
      mode 0600
      source 'id_rsa.pub'
    end
  end

end