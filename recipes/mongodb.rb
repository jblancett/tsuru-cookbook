apt_repository 'mongodb' do
  action :nothing
  uri 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart'
  distribution 'dist'
  components ['10gen']
  keyserver 'keyserver.ubuntu.com'
  key '7F0CEB10'
  only_if { node['platform'] == 'ubuntu' }
end.run_action(:add)

package 'mongodb-org' do
  action :upgrade
  options '-o Dpkg::Options::="--force-confold"'
  notifies :restart, 'service[mongod]'
end

service 'mongod' do
  action :start
  provider Chef::Provider::Service::Upstart
end