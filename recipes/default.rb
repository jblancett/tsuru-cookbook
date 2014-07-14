
include_recipe 'tsuru::repo'

package 'tsuru-server' do
  action :upgrade
  options '-o Dpkg::Options::="--force-confold"'
end