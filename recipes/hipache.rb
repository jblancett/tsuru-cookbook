 package 'nodejs' do
  action :install
end

package 'npm' do
  action :install
  not_if 'test -x /usr/bin/npm' # some distributions include npm with nodejs package
end

execute 'install hipache' do
  action :run
  user 'root'
  command 'npm install hipache -g'
end

link '/usr/bin/hipache' do
  action :create
  to '/usr/local/bin/hipache'
  only_if 'test -e /usr/local/bin/hipache'
  not_if 'test -e /usr/bin/hipache'
end

directory node['hipache']['server']['accessLog'].gsub(/\/[^\/]+$/,'') do
  action :create
  owner node['hipache']['user']
  recursive true
end

cookbook_file '/etc/init/hipache.conf' do
  action :create
  owner 'root'
  mode 0644
  source 'hipache.conf.init'
  notifies :start, 'service[hipache]'
end

file '/etc/hipache.conf' do
  action :create
  owner 'root'
  mode 0644
  content JSON.pretty_generate(node['hipache'])
  notifies :restart, 'service[hipache]'
end

service 'hipache' do
  action :nothing
  provider Chef::Provider::Service::Upstart
end