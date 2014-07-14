if node['platform'] == 'ubuntu'

  include_recipe 'tsuru::repo'

  package 'node-hipache' do
    action :upgrade
    options '-o Dpkg::Options::="--force-confold"'
  end

  service 'hipache' do
    action [:enable, :start]
    provider Chef::Provider::Service::Upstart if Chef::VersionConstraint.new('>= 13.10').include?(node['platform_version'])
  end

end