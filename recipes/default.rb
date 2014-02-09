# # # # # # # #
# papertrail  #
# # # # # # # #

include_recipe 'build-essential'
include_recipe 'rsyslog'
package 'rsyslog-gnutls'

directory node['papertrail']['conf_dir'] do
  action :create
  owner 'root'
  group 'root'
  mode '0755'
end

ruby_block "set_LocalHostName" do
  block do
    file = Chef::Util::FileEdit.new("/etc/rsyslog.conf")
    file.insert_line_if_no_match("/$LocalHostName #{node['papertrail']['hostname']}/", "$LocalHostName #{node['papertrail']['hostname']}")
    file.write_file
  end
end

template "/etc/rsyslog.d/90-papertrail.conf" do
  action :create
  owner 'root'
  group 'root'
  mode '0644'
  cookbook "papertrail"
  source 'papertrail.rsyslog.conf.erb'
	variables({
    :hostname => node['papertrail']['hostname'],
    :params => node['papertrail']
	})
  notifies :restart, 'service[rsyslog]'
end

remote_file "#{node['papertrail']['conf_dir']}/syslog.papertrail.crt" do
  source 'https://papertrailapp.com/tools/syslog.papertrail.crt'
  mode '0644'
  checksum '7d6bdd1c00343f6fe3b21db8ccc81e8cd1182c5039438485acac4d98f314fe10'
end