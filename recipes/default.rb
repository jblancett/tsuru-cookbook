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

  execute 'generate tsuru ssh agent rsa key' do
    command "ssh-keygen -f #{node['tsuru']['agent']['private_key']} -N ''"
    creates node['tsuru']['agent']['private_key']
  end

end