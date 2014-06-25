if node['platform'] == 'ubuntu'

  include_recipe 'tsuru::repo'

  package 'gandalf-server' do
    action :upgrade
  end

  directory '/home/git/bare-template/hooks' do
    action :create
    owner 'git'
    group 'git'
    mode 0755
    recursive true
  end

  cookbook_file '/home/git/bare-template/hooks/post-receive' do
    action :create
    owner 'git'
    group 'git'
    mode 0755
    source 'post-receive'
  end

  template '/etc/gandalf.conf' do
    action :create
    owner 'root'
    group 'root'
    mode 0644
    source 'gandalf.conf.erb'
    variables gandalf: node['gandalf-server']
    notifies :restart, 'service[gandalf-server]'
  end

  service 'gandalf-server' do
    action [:enable, :start]
    provider Chef::Provider::Service::Upstart if Chef::VersionConstraint.new('>= 13.10').include?(node['platform_version'])
  end

  service 'git-daemon' do
    action [:enable, :start]
    provider Chef::Provider::Service::Upstart if Chef::VersionConstraint.new('>= 13.10').include?(node['platform_version'])
  end

end