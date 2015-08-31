node.default[:consul][:config][:ui_dir] = node[:cybera_consul][:config][:ui_dir]

include_recipe '::default'

package 'nginx'
package 'unzip'

directory node[:consul][:config][:ui_dir] do
  recursive true
end

web_ui_archive = "#{node[:consul][:version]}_web_ui.zip"

remote_file web_ui_archive do
  source "https://dl.bintray.com/mitchellh/consul/#{web_ui_archive}"
  action :create_if_missing
  notifies :run, 'execute[extract_web_ui]', :immediately
end

execute 'extract_web_ui' do
  command "unzip #{web_ui_archive} -d /tmp"
  action :nothing
  notifies :run, 'execute[install_web_ui]', :immediately
end

execute 'install_web_ui' do
  command "mv /tmp/dist #{node[:consul][:config][:ui_dir].chomp('/')}"
  action :nothing
end

template '/etc/nginx/sites-available/consul_ui' do
  source 'nginx.erb'
  notifies :restart, 'service[nginx]', :delayed
end

link '/etc/nginx/sites-enabled/consul_ui' do
  to '/etc/nginx/sites-available/consul_ui'
  notifies :restart, 'service[nginx]', :delayed
end

link '/etc/nginx/sites-enabled/default' do
  action :delete
  notifies :restart, 'service[nginx]', :delayed
end

consul_definition 'nginx' do
  type 'service'
  parameters port: 80, tags: [ 'consul_ui' ]
  notifies :reload, 'consul_service[consul]', :delayed
end

service 'nginx' do
  supports :restart => true
end
