if node['platform'] == 'ubuntu'

  include_recipe 'tsuru::repo'

  package 'docker-registry' do
    action :upgrade
  end

  service 'docker-registry' do
    action [:enable, :start]
  end

end