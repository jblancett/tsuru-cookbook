Tsuru Cookbook
==============
Installs and configures tsuru PaaS

Requirements
------------
### Platform
* Ubuntu

### Cookbooks
* [apt] (https://github.com/opscode-cookbooks/apt)
* [aufs] (https://github.com/bflad/chef-aufs)
* [lxc] (https://github.com/hw-cookbooks/lxc)
* [docker] (https://github.com/bflad/chef-docker)
* [redis] (https://github.com/Firma8/redis-cookbook)
* [mongodb] (https://github.com/edelight/chef-mongodb)

Recipes
-----
* tsuru::default - Default recipe installs tsuru-server package without enabling any services

* tsuru::repo - sets up tsuru apt ppa

* tsuru::agent - Installs tsuru-server package and enables ssh-agent

* tsuru::server - Installs tsuru-server package and enables all services

* tsuru::docker - just a wrapper to install docker using [chef-docker](https://github.com/bflad/chef-docker)

* tsuru::docker-registry - Installs docker-registry from tsuru ppa

* tsuru::gandalf-server - Installs and configures both gandalf-server and archive-server from tsuru ppa

* tsuru::hipache - Installs node-hipache from tsuru ppa

* tsuru::mongodb - wrapper to install [mongodb] (https://github.com/edelight/chef-mongodb)

* tsuru::redis - wrapper to install [redis] (https://github.com/Firma8/redis-cookbook)

* tsuru::fullstack - full tsuru PaaS install: mongodb, redis, hipache, gandalf-server, docker-registry, and tsuru-server

Attributes
----------
#### tsuru::default


Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Submit a Pull Request using Github

Authors
-------------------
Authors: jblancett (josh@firma8.com)
