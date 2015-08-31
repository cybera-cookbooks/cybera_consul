node.default[:consul][:config][:server] = true
node.default[:consul][:config][:bootstrap_expect] = node[:cybera_consul][:config][:bootstrap_expect]

include_recipe '::default'
