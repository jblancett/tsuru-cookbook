
include_recipe('tsuru::docker-registry')
include_recipe('tsuru::gandalf-server')

node.override['tsuru']['api_enabled'] = true
node.override['tsuru']['api_admin_enabled'] = true
node.override['tsuru']['collector_enabled'] = true
node.override['tsuru']['agent_enabled'] = true

include_recipe('tsuru')

