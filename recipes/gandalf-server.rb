if node['platform'] == 'ubuntu'

  include_recipe 'tsuru::repo'

  ['tsuru-server', 'gandalf-server','archive-server'].each do |pkg|
    package pkg do
      action :upgrade
      options '-o Dpkg::Options::="--force-confold"'
    end
  end

  directory '/home/git/bare-template/hooks' do
    action :create
    owner 'git'
    group 'git'
    mode 0755
    recursive true
  end

  cookbook_file '/home/git/bare-template/hooks/pre-receive' do
    action :create
    owner 'git'
    group 'git'
    mode 0755
    source 'pre-receive'
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

  template '/home/git/.bash_profile' do
    action :create_if_missing
    owner 'root'
    group 'root'
    mode 0644
    source 'bash_profile.erb'
    variables tsuru_token: node['gandalf-server']['token'] || `tsr token`
  end

  ['gandalf-server','git-daemon','archive-server'].each do |svc|
    service svc do
      action [:enable, :start]
      provider Chef::Provider::Service::Upstart if Chef::VersionConstraint.new('>= 13.10').include?(node['platform_version'])
    end
  end

end