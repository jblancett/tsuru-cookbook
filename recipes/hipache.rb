package 'nodejs' do
  action :install
end

execute 'install hipache' do
  action :run
  user 'root'
  command 'npm install hipache -g'
end

cookbook_file '/etc/init/hipache.conf' do
  action :create
  owner 'root'
  mode 0644
  source 'hipache.conf.init'
end

service 'hipache' do
  action [:enable, :start]
  provider Chef::Provider::Service::Upstart
end