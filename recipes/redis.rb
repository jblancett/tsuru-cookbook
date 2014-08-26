apt_repository 'redis-server' do
  action :nothing
  uri          'http://ppa.launchpad.net/chris-lea/redis-server/ubuntu'
  distribution node['lsb']['codename']
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'C7917B12'
end.run_action(:add)

package 'redis-server' do
  action :upgrade
  options '-o Dpkg::Options::="--force-confold"'
  notifies :restart, 'service[redis-server]'
end

service 'redis-server' do
	action :nothing
	provider Chef::Provider::Service::Init
end