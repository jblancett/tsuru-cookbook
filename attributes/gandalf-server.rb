
default['gandalf-server']['bin-path'] = '/usr/bin/gandalf-ssh'
default['gandalf-server']['git']['bare']['location'] = '/var/lib/gandalf/repositories'
default['gandalf-server']['git']['bare']['template'] = '/home/git/bare-template'
default['gandalf-server']['authorized-keys-path'] = '/home/git/.ssh/authorized_keys'
default['gandalf-server']['host'] = node['fqdn']
default['gandalf-server']['bind'] = '0.0.0.0:8000'
default['gandalf-server']['token'] = nil
