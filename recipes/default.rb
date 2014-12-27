# # # # # # # #
# papertrail  #
# # # # # # # #

include_recipe 'build-essential'
include_recipe 'rsyslog::default'
package 'rsyslog-gnutls'

directory node['papertrail']['conf_dir'] do
  action :create
  owner 'root'
  group 'root'
  mode 0755
end

ruby_block 'set_LocalHostName' do
  block do
    file = Chef::Util::FileEdit.new('/etc/rsyslog.conf')
    file.insert_line_if_no_match("/$LocalHostName #{node['papertrail']['hostname']}/", "$LocalHostName #{node['papertrail']['hostname']}")
    file.write_file
  end
end

template '/etc/rsyslog.d/90-papertrail.conf' do
  action :create
  owner 'root'
  group 'root'
  mode 0644
  cookbook 'papertrail'
  source 'papertrail.rsyslog.conf.erb'
  variables(
    hostname: node['papertrail']['hostname'],
    params: node['papertrail']
  )
  notifies :restart, 'service[rsyslog]'
end

remote_file "#{node['papertrail']['conf_dir']}/syslog.papertrail.crt" do
  source node['papertrail']['certificate_src']
  mode 0644
  checksum node['papertrail']['certificate_checksum']
  only_if { node['papertrail']['enable_tls'] }
end
