if node['platform'] == 'ubuntu'

  include_recipe 'tsuru::repo'

  package 'docker-registry' do
    action :upgrade
  end

  service 'docker-registry' do
    action [:enable, :start]
    provider Chef::Provider::Service::Upstart if Chef::VersionConstraint.new('>= 13.10').include?(node['platform_version'])
  end

end