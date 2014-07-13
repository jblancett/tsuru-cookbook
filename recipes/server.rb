
include_recipe('tsuru::agent')

service 'tsuru-server-api' do
  action :nothing
  supports :restart => true, :status => true
  provider Chef::Provider::Service::Upstart
end

execute "sed -i 's/^TSR_API_ENABLED=.*/TSR_API_ENABLED=yes/' /etc/default/tsuru-server" do
  action :run
  notifies :start, 'service[tsuru-server-api]'
  not_if 'cat /etc/default/tsuru-server | grep TSR_API_ENABLED=yes'
end

execute "sed -i 's/^TSR_API_ADMIN_ENABLED=.*/TSR_API_ADMIN_ENABLED=yes/' /etc/default/tsuru-server" do
  action :run
  notifies :start, 'service[tsuru-server-api]'
  not_if 'cat /etc/default/tsuru-server | grep TSR_API_ADMIN_ENABLED=yes'
end