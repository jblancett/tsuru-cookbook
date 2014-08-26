
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

template '/etc/tsuru/tsuru.conf' do
  action :create
  source 'tsuru.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  variables tsuru_server: node['tsuru']['server']
  notifies :restart, 'service[tsuru-server-api]'
end