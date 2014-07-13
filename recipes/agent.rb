
include_recipe('tsuru')

service 'tsuru-ssh-agent' do
  action :nothing
  supports :restart => true, :status => true
  provider Chef::Provider::Service::Upstart
end

execute "sed -i 's/^TSR_SSH_AGENT_ENABLED=.*/TSR_SSH_AGENT_ENABLED=yes/' /etc/default/tsuru-server" do
  action :run
  notifies :start, 'service[tsuru-ssh-agent]'
  not_if 'cat /etc/default/tsuru-server | grep TSR_SSH_AGENT_ENABLED=yes'
end

execute "sed -i 's/^TSR_SSH_AGENT_USER=.*/TSR_SSH_AGENT_USER=#{node['tsuru']['agent']['user']}/' /etc/default/tsuru-server" do
  action :run
  notifies :restart, 'service[tsuru-ssh-agent]'
  not_if "cat /etc/default/tsuru-server | grep TSR_SSH_AGENT_USER=#{node['tsuru']['agent']['user']}"
end.run_action(:run)

execute 'generate tsuru ssh agent rsa key' do
  action :run
  command "ssh-keygen -f #{node['tsuru']['agent']['private_key']} -N ''"
  creates node['tsuru']['agent']['private_key']
end