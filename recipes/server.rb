node.default[:consul][:config][:server] = true

if !node[:consul][:config].attribute? :bootstrap_expect
  node.default[:consul][:config][:bootstrap_expect] = 3
end

include_recipe '::default'
