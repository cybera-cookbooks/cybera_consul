# Cybera Consul Cookbook

Wrapper cookbook for installing and configuring Consul cluster. Includes recipes for deploying the Consul agent in both client and server mode, configuring DNS forwarding with bind9 and deploying the Consul web interface.

## Supported Platforms

* Ubuntu 14.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:cybera_consul][:config][:bootstrap_expect]</tt></td>
    <td>Integer</td>
    <td>How many members to expect before bootstrapping the cluster</td>
    <td><tt>3</tt></td>
  </tr>
  <tr>
    <td><tt>[:cybera_consul][:config][:ui_dir]</tt></td>
    <td>String</td>
    <td>Directory containing statc UI files</td>
    <td><tt>/usr/local/share/consul/dist</tt></td>
  </tr>
</table>

## Recipes

### default

Installs and configures the Consul agent as a client.

### server

Configures the Consul agent as a server.

### dns

Installs and configures bind9 to forward DNS requests to the Consul DNS server.

### ui

Downloads the Consul Web UI files, configures the Consul agent's `ui-dir` and installs nginx as a reverse proxy for the web interface.

### resolv

Configures the `dns-search` and `dns-nameserver` options for eth0. Does NOT install the Consul agent.

## Usage

Include the appropriate recipe(s) in your node's `run_list`. All recipes except for `resolv` already include the `default` recipe. For example, to just deploy the Consul agent as a client:

```json
{
  "run_list": [
    "recipe[cybera_consul::default]"
  ]
}
```

Or to deploy the Consul agent as a client with DNS forwarding:

```json
{
  "run_list": [
    "recipe[cybera_consul::dns]"
  ]
}
```

Or to deploy the Consul agent as a server along with DNS and the web interface:

```json
{
  "run_list": [
    "recipe[cybera_consul::server],recipe[cybera_consul::dns],recipe[cybera_consul::ui]"
  ]
}
```

## License and Authors

Author:: Cybera, Inc. (<devops@cybera.ca>)

Copyright 2015 Cybera, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
