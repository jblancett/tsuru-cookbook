[
  'tsuru::mongodb',
  'tsuru::redis',
  'tsuru::hipache',
  'tsuru::docker',
  'tsuru::docker-registry',
  'tsuru::gandalf-server',
  'tsuru::server'
].each do |r|
  include_recipe r
end
