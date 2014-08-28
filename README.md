Tsuru Cookbook
==============
Installs and configures tsuru PaaS
Everything but docker is fully contained within this cookbook.  If you want more advanced configuration for mongodb or redis, use dedicated cookbooks for them.

Requirements
------------
### Platform
* Ubuntu

### Cookbooks
* [apt] (https://github.com/opscode-cookbooks/apt)
* [aufs] (https://github.com/bflad/chef-aufs)
* [lxc] (https://github.com/hw-cookbooks/lxc)
* [docker] (https://github.com/bflad/chef-docker)

Recipes
-----

* tsuru::repo - sets up tsuru apt ppa

* tsuru::server - Installs and configures tsuru-server from tsuru ppa

* tsuru::docker - just a wrapper to install docker using [chef-docker](https://github.com/bflad/chef-docker)

* tsuru::docker-registry - Installs docker-registry from tsuru ppa

* tsuru::gandalf-server - Installs and configures both gandalf-server and archive-server from tsuru ppa
This will need to run AFTER tsuru::server for token generation to work.

* tsuru::hipache - Installs and configures hipache using npm

* tsuru::mongodb - Installs mongodb

* tsuru::redis - Installs redis-server

* tsuru::fullstack - full tsuru PaaS install: docker, redis, hipache, mongodb, docker-registry, tsuru-server, and gandalf-server

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Submit a Pull Request using Github

Authors
-------------------
Authors: jblancett (joshblancett@gmail.com)
