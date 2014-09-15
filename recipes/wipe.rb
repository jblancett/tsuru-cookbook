Chef::Log.warn("Erasing all tsuru data! This will completely clear out both mongodb and redis!")

chef_gem('mongo')
chef_gem('bson_ext')
require 'mongo'
mongo = Mongo::MongoClient.new

[
  'archives',
  'gandalf',
  node['tsuru']['server']['docker']['cluster']['mongo-database'],
  node['tsuru']['server']['database']['name']
].each do |db|
  mongo.drop_database(db)
  Chef::Log.debug("Dropped mongo database #{db}")
end

Mixlib::ShellOut.new('redis-cli flushdb').run_command.stdout
Chef::Log.debug("Flushed redis db")
