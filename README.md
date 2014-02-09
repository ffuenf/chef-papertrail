Description
===========

Setup of remote logging to [papertrail](http://papertrailapp.com) over rsyslog.

Requirements
============

[rsyslog](https://github.com/opscode-cookbooks/rsyslog)

Cookbooks
---------

Attributes
==========

* `node['papertrail']['conf_dir']` - default: "/etc/papertrail"
* `node['papertrail']['hostname']` - default: node['hostname']
* `node['papertrail']['host']` - default: "logs.papertrailapp.com"
* `node['papertrail']['port']` - default: 514
* `node['papertrail']['resume_retry_count']` - default: -1
* `node['papertrail']['syslog_selector']` - default: '*.*'
* `node['papertrail']['queue_disk_space']` - default: '100M'

* `node['papertrail']['enable_tls']` - default: true
* `node['papertrail']['certificate_src']` - default: 'https://papertrailapp.com/tools/syslog.papertrail.crt'
* `node['papertrail']['certificate_checksum']` - default: '7d6bdd1c00343f6fe3b21db8ccc81e8cd1182c5039438485acac4d98f314fe10'

Recipes
=======

The default recipe installs rsyslog and configures it to submit logs to papertrail.
Use the included LWRP to add aditional logs.

Usage
=====

Simply include the recipe in your application recipe.
```ruby
include_recipe "papertrail"
```

ATTENTION: name this cookbook "papertrail" if you want to use the LWRP like this:
```ruby
papertrail "YOUR_APPLICATION" do
  ruleset "YOUR_APPLICATION"
  inputfilename "/path/to/yourlog.log"
  inputfiletag "YOUR_APPLICATION"
end
```

License and Author
==================
Author:: Achim Rosenhagen (<a.rosenhagen@ffuenf.de>)

Copyright:: 2014, Achim Rosenhagen

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.