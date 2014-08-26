[
  'tsuru::docker',
  'tsuru::redis',
  'tsuru::hipache',
  'tsuru::mongodb',
  'tsuru::docker-registry',
  'tsuru::gandalf-server',
  'tsuru::server'
].each do |r|
  include_recipe r
end
