
include_recipe 'tsuru::repo'

package 'tsuru-server' do
  action :upgrade
end