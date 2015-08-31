include_recipe '::default'

package 'bind9'

template '/etc/bind/named.conf.options' do
  source 'named.conf.options.erb'
  notifies :restart, 'service[bind9]', :delayed
end

template '/etc/bind/named.conf.local' do
  source 'named.conf.local.erb'
  notifies :restart, 'service[bind9]', :delayed
end

consul_definition 'bind9' do
  type 'service'
  parameters port: 53
  notifies :reload, 'consul_service[consul]', :delayed
end

service 'bind9' do
  supports :restart => true
end
