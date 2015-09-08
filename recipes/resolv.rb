template '/etc/network/interfaces.d/eth0.cfg' do
  source 'eth0.cfg.erb'
  notifies :run, 'execute[restart_eth0]', :delayed
end

execute 'restart_eth0' do
  command 'ifdown eth0; ifup eth0'
  action :nothing
end
