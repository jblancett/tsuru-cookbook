
include_recipe('tsuru::repo')

package 'tsuru-server' do
  action :upgrade
  options '-o Dpkg::Options::="--force-confold"'
end

execute "sed -i 's/^TSR_API_ENABLED=.*/TSR_API_ENABLED=yes/' /etc/default/tsuru-server" do
  action :run
  notifies :start, 'service[tsuru-server-api]'
  not_if 'grep ^TSR_API_ENABLED=yes /etc/default/tsuru-server'
end

require 'yaml'
file '/etc/tsuru/tsuru.conf' do
  action :create
  owner 'root'
  group 'root'
  mode 0644
  content node['tsuru']['server'].to_hash.to_yaml
  notifies :restart, 'service[tsuru-server-api]'
end

service 'tsuru-server-api' do
  action :nothing
  provider Chef::Provider::Service::Upstart
end