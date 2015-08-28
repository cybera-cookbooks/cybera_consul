# cybera_consul-cookbook

Wrapper cookbook for installing and configuring Consul cluster. Includes recipes for deploying the Consul agent in server mode, configuring DNS forwarding with bind9 and deploying the Consul web interface.

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
    <td><tt>['cybera_consul']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### cybera_consul::default

Include `cybera_consul` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[cybera_consul::default]"
  ]
}
```

## License and Authors

Author:: Cybera, Inc. (<devops@cybera.ca>)
