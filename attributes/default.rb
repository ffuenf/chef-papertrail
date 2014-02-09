# # # # # # # #
# papertrail  #
# # # # # # # #
default['papertrail']['conf_dir'] = "/etc/papertrail"
default['papertrail']['hostname'] = node['hostname']
default['papertrail']['host'] = "logs.papertrailapp.com"
default['papertrail']['port'] = 514
default['papertrail']['resume_retry_count'] = -1
default['papertrail']['syslog_selector'] = '*.*'
default['papertrail']['queue_disk_space'] = '100M'

default['papertrail']['enable_tls'] = true
default['papertrail']['certificate_src'] = 'https://papertrailapp.com/tools/syslog.papertrail.crt'
default['papertrail']['certificate_checksum'] = '7d6bdd1c00343f6fe3b21db8ccc81e8cd1182c5039438485acac4d98f314fe10'