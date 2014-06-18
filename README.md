Tsuru Cookbook
==============
Installs tsuru-server package from official tsuru ppa

Requirements
------------
### Platform
* Ubuntu

Attributes
----------
#### tsuru::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['tsuru']['package']['api_enabled']</tt></td>
    <td>Boolean</td>
    <td>whether to enable tsuru api</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['tsuru']['package']['api_admin_enabled']</tt></td>
    <td>Boolean</td>
    <td>whether to enable tsuru admin</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['tsuru']['package']['collector_enabled']</tt></td>
    <td>Boolean</td>
    <td>whether to enable tsuru collector</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['tsuru']['package']['agent_enabled']</tt></td>
    <td>Boolean</td>
    <td>whether to enable tsuru ssh agent</td>
    <td><tt>false</tt></td>
  </tr>
</table>

Usage
-----
#### tsuru::default
Just include `tsuru` in your node's run list and set attributes for the services you want enabled:

```json
{
  "name":"my_node",
  "default": {
    "tsuru": {
      "agent_enabled": true
    }
  },
  "run_list": [
    "recipe[tsuru]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Submit a Pull Request using Github

Authors
-------------------
Authors: jblancett (josh@firma8.com)
