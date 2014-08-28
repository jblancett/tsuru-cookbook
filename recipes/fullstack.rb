[
  'tsuru::docker',
  'tsuru::redis',
  'tsuru::hipache',
  'tsuru::mongodb',
  'tsuru::docker-registry',
  'tsuru::server',
  'tsuru::gandalf-server'
].each do |r|
  include_recipe r
end
