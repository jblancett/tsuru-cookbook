default['tsuru']['server']['listen'] = '0.0.0.0:8080'
# default['tsuru']['server']['use-tls'] = false
# default['tsuru']['server']['tls-cert-file'] = nil # path to cert
# default['tsuru']['server']['tls-key-file'] = nil # path to key
default['tsuru']['server']['host'] = "http#{'s' if node['tsuru']['server']['use-tls']}://#{node['fqdn']}:#{node['tsuru']['server']['listen'][/\d+$/]}"
default['tsuru']['server']['admin-team'] = 'admin'
# default['tsuru']['server']['debug'] = false

## Database acess
default['tsuru']['server']['database']['url'] = '127.0.0.1:27017'
default['tsuru']['server']['database']['name'] = 'tsuru'

## Email configuration
# default['tsuru']['server']['smtp']['server'] = nil
# default['tsuru']['server']['smtp']['user'] = nil
# default['tsuru']['server']['smtp']['password'] = nil

## Git configuration
default['tsuru']['server']['git']['unit-repo'] = '/home/application/current'
default['tsuru']['server']['git']['api-server'] = "http://#{node['fqdn']}:8000"
default['tsuru']['server']['git']['rw-host'] = node['fqdn']
default['tsuru']['server']['git']['ro-host'] = node['fqdn']

## Authentication configuration
default['tsuru']['server']['auth']['scheme'] = 'native' #only other option is oauth
default['tsuru']['server']['auth']['user-registration'] = false
default['tsuru']['server']['auth']['hash-cost'] = 10
# default['tsuru']['server']['auth']['token-expire-days'] = 7
# default['tsuru']['server']['auth']['max-simultaneous-sessions'] = 'unlimited'
## the below oauth options must all be set if auth:scheme = oauth
# default['tsuru']['server']['auth']['oauth']['client-id'] = nil
# default['tsuru']['server']['auth']['oauth']['client-secret'] = nil
# default['tsuru']['server']['auth']['oauth']['scope'] = nil
# default['tsuru']['server']['auth']['oauth']['auth-url'] = nil
# default['tsuru']['server']['auth']['oauth']['token-url'] = nil
# default['tsuru']['server']['auth']['oauth']['info-url'] = nil
# default['tsuru']['server']['auth']['oauth']['collection'] = 'oauth_tokens'
# default['tsuru']['server']['auth']['oauth']['callback-port'] = nil

## Queue configuration
default['tsuru']['server']['queue'] = 'redis'
default['tsuru']['server']['redis-queue']['host'] = '127.0.0.1'
default['tsuru']['server']['redis-queue']['port'] = 6379
# default['tsuru']['server']['redis-queue']['password'] = '' # blank for no password
# default['tsuru']['server']['redis-queue']['db'] = 3

## Quota management
# default['tsuru']['server']['quota']['units-per-app'] = 'unlimited'
# default['tsuru']['server']['quota']['apps-per-user'] = 'unlimited'

## Hipache
default['tsuru']['server']['hipache']['domain'] = node['fqdn']
default['tsuru']['server']['hipache']['redis-server'] = '127.0.0.1:6379'

## Docker provisioner
default['tsuru']['server']['provisioner'] = 'docker'
default['tsuru']['server']['docker']['collection'] = 'docker_containers'
default['tsuru']['server']['docker']['repository-namespace'] = 'tsuru'
default['tsuru']['server']['docker']['router'] = 'hipache'
default['tsuru']['server']['docker']['deploy-cmd'] = '/var/lib/tsuru/deploy'
default['tsuru']['server']['docker']['segregate'] = false
default['tsuru']['server']['docker']['cluster']['mongo-url'] = '127.0.0.1:27017'
default['tsuru']['server']['docker']['cluster']['mongo-database'] = 'cluster'
default['tsuru']['server']['docker']['run-cmd']['bin'] = '/var/lib/tsuru/start'
default['tsuru']['server']['docker']['run-cmd']['port'] = '8888'
default['tsuru']['server']['docker']['ssh']['add-key-cmd'] = '/var/lib/tsuru/add-key'
default['tsuru']['server']['docker']['ssh']['user'] = 'ubuntu'
# default['tsuru']['server']['docker']['registry'] = "#{node.fqdn}:5000"
default['tsuru']['server']['docker']['servers'] = ['http://localhost:2375']

#default['tsuru']['server']['docker']['healing']['heal-nodes'] = false
#default['tsuru']['server']['docker']['healing']['active-monitoring-interval'] = 0
#default['tsuru']['server']['docker']['healing']['disabled-time'] = 30
#default['tsuru']['server']['docker']['healing']['max-failures'] = 5
#default['tsuru']['server']['docker']['healing']['wait-new-time'] = 300
#default['tsuru']['server']['docker']['healing']['heal-containers-timeout'] = 0
#default['tsuru']['server']['docker']['healing']['events_collection'] = 'healing_events'
#default['tsuru']['server']['docker']['healthcheck']['max-time'] = 120

## IaaS configuration
# default['tsuru']['server']['iaas']['default'] = nil
# default['tsuru']['server']['iaas']['api-key'] = nil
# default['tsuru']['server']['iaas']['secret-key'] = nil
# default['tsuru']['server']['iaas']['url'] = nil
# default['tsuru']['server']['iaas']['node-protocol'] = nil
# default['tsuru']['server']['iaas']['node-port'] = nil
# default['tsuru']['server']['iaas']['collection'] = nil