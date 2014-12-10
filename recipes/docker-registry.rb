include_recipe 'tsuru::repo'

package 'docker-registry' do
  action :upgrade
end

directory '/var/run/registry' do
  action :create
  mode 0755
  owner 'registry'
  group 'registry'
  notifies :restart, 'service[docker-registry]'
end

file '/etc/default/docker-registry' do
  action :create
  owner 'root'
  group 'root'
  mode 0644
  content "DOCKER_REGISTRY_LISTEN=\":#{node['docker-registry']['port']}\"\n"
  notifies :restart, 'service[docker-registry]'
end

service 'docker-registry' do
  action [:enable, :start]
  provider Chef::Provider::Service::Upstart if Chef::VersionConstraint.new('>= 13.10').include?(node['platform_version'])
end