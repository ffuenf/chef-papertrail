# # # # # # # #
# papertrail  #
# # # # # # # #
default['papertrail']['conf_dir'] = '/etc/papertrail'
default['papertrail']['hostname'] = node['hostname']
default['papertrail']['host'] = 'logs.papertrailapp.com'
default['papertrail']['port'] = 514
default['papertrail']['syslog_selector'] = '*.*'
default['papertrail']['queue_disk_space'] = '100M'

default['papertrail']['enable_tls'] = true
default['papertrail']['certificate_src'] = 'https://papertrailapp.com/tools/papertrail-bundle.pem'
default['papertrail']['certificate_checksum'] = 'c03a504397dc45b4fc05f978dbf02129793cbd2a0b64856c2ba1bb49a3b9aacb'

default['papertrail']['conf']['DefaultNetstreamDriverCAFile'] = "#{node['papertrail']['conf_dir']}/papertrail-bundle.pem"
default['papertrail']['conf']['ActionSendStreamDriver'] = 'gtls'
default['papertrail']['conf']['ActionSendStreamDriverMode'] = 1
default['papertrail']['conf']['ActionSendStreamDriverAuthMode'] = 'x509/name'
default['papertrail']['conf']['ActionSendStreamDriverPermittedPeer'] = '*.papertrailapp.com'
default['papertrail']['conf']['ActionResumeRetryCount'] = -1
default['papertrail']['conf']['ActionQueueType'] = 'LinkedList'
default['papertrail']['conf']['ActionQueueFileName'] = '/var/log/rsyslog_queue_main'
default['papertrail']['conf']['ActionQueueSaveOnShutdown'] = 'on'
default['papertrail']['conf']['ActionQueueMaxDiskSpace'] = '100M'
default['papertrail']['conf']['ActionResumeInterval'] = 10
default['papertrail']['conf']['ActionQueueSize'] = 100_000
default['papertrail']['conf']['ActionQueueDiscardMark'] = 97_500
default['papertrail']['conf']['ActionQueueHighWaterMark'] = 80_000
default['papertrail']['conf']['ActionQueueCheckpointInterval'] = 100
default['papertrail']['conf']['ActionQueueMaxDiskSpace'] = '2g'
default['papertrail']['conf']['ActionQueueTimeoutEnqueue'] = 10
default['papertrail']['conf']['ActionQueueDiscardSeverity'] = 0
