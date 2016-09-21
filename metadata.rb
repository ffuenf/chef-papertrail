maintainer 'Achim Rosenhagen'
maintainer_email 'a.rosenhagen@ffuenf.de'
license 'Apache 2.0'
description 'installs/configures papertrail'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
name 'papertrail'
version '1.0.2'
source_url 'https://github.com/ffuenf/chef-papertrail'
issues_url 'https://github.com/ffuenf/chef-papertrail/issues'

%w(debian ubuntu).each do |os|
  supports os
end

%w(build-essential rsyslog).each do |ressource|
  depends ressource
end
