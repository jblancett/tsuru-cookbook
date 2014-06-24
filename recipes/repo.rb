apt_repository 'tsuru' do
  uri node['tsuru']['package']['repo_url']
  distribution node['lsb']['codename']
  components ['main']
  keyserver 'keyserver.ubuntu.com'
  key node['tsuru']['package']['repo_key']
  deb_src true
  only_if { node['platform'] == 'ubuntu' }
end