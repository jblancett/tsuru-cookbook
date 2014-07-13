default['tsuru']['server']['listen_addr'] = '0.0.0.0'
default['tsuru']['server']['listen_port'] = '8080'
default['tsuru']['server']['admin_listen_addr'] = '0.0.0.0'
default['tsuru']['server']['admin_listen_port'] = '8081'
default['tsuru']['server']['use-tls'] = false
default['tsuru']['server']['tls-cert-file'] = nil # path to cert
default['tsuru']['server']['tls-key-file'] = nil # path to key
default['tsuru']['server']['host'] = "http#{'s' if node['tsuru']['server']['use-tls']}://#{node.name}:#{node['tsuru']['server']['listen_port']}"
default['tsuru']['server']['debug'] = false

default['tsuru']['server']['database']['url'] = '127.0.0.1:27017'
default['tsuru']['server']['database']['name'] = 'tsuru'

default['tsuru']['server']['git']['unit-repo'] = '/home/application/current'
default['tsuru']['server']['git']['api-server'] = "http://#{node['gandalf-server']['bind']}"
default['tsuru']['server']['git']['rw-host'] = node.name
default['tsuru']['server']['git']['ro-host'] = node.name

default['tsuru']['server']['admin-team'] = 'admin'
default['tsuru']['server']['auth']['scheme'] = 'native' #only other option is oauth
default['tsuru']['server']['auth']['user-registration'] = false
default['tsuru']['server']['auth']['hash-cost'] = 10
default['tsuru']['server']['auth']['token-expire-days'] = 7
default['tsuru']['server']['auth']['hash-cost'] = 10
default['tsuru']['server']['auth']['max-simultaneous-sessions'] = 'unlimited'

default['tsuru']['server']['auth']['oauth']['client-id'] = nil
default['tsuru']['server']['auth']['oauth']['client-secret'] = nil
default['tsuru']['server']['auth']['oauth']['scope'] = nil
default['tsuru']['server']['auth']['oauth']['auth-url'] = nil
default['tsuru']['server']['auth']['oauth']['token-url'] = nil
default['tsuru']['server']['auth']['oauth']['info-url'] = nil
default['tsuru']['server']['auth']['oauth']['collection'] = 'oauth_tokens'
default['tsuru']['server']['auth']['oauth']['callback-port'] = nil

default['tsuru']['server']['queue'] = 'redis' # beanstalkd is deprecated
default['tsuru']['server']['queue-server'] = 'localhost:11300' # only used for beanstalkd
default['tsuru']['server']['redis-queue']['host'] = '127.0.0.1'
default['tsuru']['server']['redis-queue']['port'] = '6379'
default['tsuru']['server']['redis-queue']['password'] = '' # blank for no password
default['tsuru']['server']['redis-queue']['db'] = 3

default['tsuru']['server']['provisioner'] = 'docker'
default['tsuru']['server']['docker']['collection'] = 'docker_containers'
default['tsuru']['server']['docker']['repository-namespace'] = 'tsuru'
default['tsuru']['server']['docker']['router'] = 'hipache'
default['tsuru']['server']['docker']['deploy-cmd'] = '/var/lib/tsuru/deploy'
default['tsuru']['server']['docker']['ssh-agent-port'] = node['tsuru']['agent']['listen'][/\d+$/] || '4545'
default['tsuru']['server']['docker']['segregate'] = false
default['tsuru']['server']['docker']['scheduler']['redis-server'] = '127.0.0.1:6379'
default['tsuru']['server']['docker']['scheduler']['redis-prefix'] = 'docker-cluster'
default['tsuru']['server']['docker']['run-cmd']['bin'] = '/var/lib/tsuru/start'
default['tsuru']['server']['docker']['run-cmd']['port'] = '8888'
default['tsuru']['server']['docker']['ssh']['add-key-cmd'] = '/var/lib/tsuru/add-key'
default['tsuru']['server']['docker']['ssh']['public-key'] = '/home/ubuntu/.ssh/id_rsa.pub'
default['tsuru']['server']['docker']['ssh']['user'] = 'ubuntu'
default['tsuru']['server']['docker']['ssh']['sshd-path'] = '/usr/sbin/sshd'
default['tsuru']['server']['docker']['registry'] = node.name
default['tsuru']['server']['docker']['servers'] = [node['docker']['host'].find{|host| host.start_with?('tcp') }.gsub('tcp://','http://')] rescue ['http://localhost:2375']

default['tsuru']['server']['hipache']['domain'] = node.name

default['tsuru']['server']['quota']['units-per-app'] = 'unlimited'
default['tsuru']['server']['quota']['apps-per-user'] = 'unlimited'