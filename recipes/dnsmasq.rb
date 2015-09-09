interface = node[:cybera_consul][:dnsmasq][:interface]

template "/etc/network/interfaces.d/#{interface}.cfg" do
  source 'interface.cfg.erb'
  notifies :run, 'execute[restart_interface]', :delayed
end

execute 'restart_interface' do
  command "ifdown #{interface}; ifup #{interface}"
  action :nothing
end

package 'dnsmasq'

template '/etc/dnsmasq.conf' do
  source 'dnsmasq.conf.erb'
  notifies :restart, 'service[dnsmasq]', :delayed
end

template '/etc/dnsmasq.d/consul.conf' do
  source 'consul.conf.erb'
  notifies :restart, 'service[dnsmasq]', :delayed
end

service 'dnsmasq' do
  supports :restart => true
end
