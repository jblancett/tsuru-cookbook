
include_recipe('tsuru::repo')

package 'tsuru-server' do
  action :upgrade
  options '-o Dpkg::Options::="--force-confold"'
end

if node['tsuru']['server']['log'] && node['tsuru']['server']['log']['file']
  directory File.dirname(node['tsuru']['server']['log']['file']) do
    action :create
    recursive true
  end

  file node['tsuru']['server']['log']['file']  do
    action :create
    owner 'tsuru'
    group 'tsuru'
    mode 0644
  end

  template '/etc/logrotate.d/tsuru' do
    action :create
    owner 'root'
    group 'root'
    mode 0644
    source 'tsuru.logrotate.erb'
    variables :path => node['tsuru']['server']['log']['file']
  end
end

execute "sed -i 's/^TSR_API_ENABLED=.*/TSR_API_ENABLED=yes/' /etc/default/tsuru-server" do
  action :run
  notifies :start, 'service[tsuru-server-api]'
  not_if 'grep ^TSR_API_ENABLED=yes /etc/default/tsuru-server'
end

require 'yaml'
config = node['tsuru']['server'].to_hash
config['docker'].delete('servers') if config['docker']['segregate']
file '/etc/tsuru/tsuru.conf' do
  action :create
  owner 'root'
  group 'root'
  mode 0644
  content config.to_yaml
  notifies :restart, 'service[tsuru-server-api]'
end

service 'tsuru-server-api' do
  action :nothing
  provider Chef::Provider::Service::Upstart
end