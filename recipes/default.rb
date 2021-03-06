poise_service_user node['consul']['service_user'] do
  group node['consul']['service_group']
  action :create
end

config = consul_config node['consul']['service_name'] do |r|
  owner node['consul']['service_user']
  group node['consul']['service_group']

  node['consul']['config'].each_pair { |k, v| r.send(k, v) }
end

consul_service node['consul']['service_name'] do |r|
  user node['consul']['service_user']
  group node['consul']['service_group']
  version node['consul']['version']
  config_file config.path

  node['consul']['service'].each_pair { |k, v| r.send(k, v) }
  subscribes :restart, "consul_config[#{config.name}]", :delayed
end
