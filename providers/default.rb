#
# Cookbook Name:: papertrail
# Provider:: papertrail
#
# Copyright 2016, Achim Rosenhagen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
use_inline_resources

action :add do
  description = "add logs from #{@new_resource.name} to remote papertrail logging via rsyslog"
  converge_by(description) do
    template "/etc/rsyslog.d/10-#{@new_resource.name}.conf" do
      action :create
      owner 'root'
      group 'root'
      mode 0o644
      cookbook 'papertrail'
      source 'rsyslog.conf.erb'
      variables(
        ruleset: new_resource.ruleset,
        inputfilename: new_resource.inputfilename,
        inputfiletag: new_resource.name,
        inputfilepersiststateinterval: new_resource.inputfilepersiststateinterval
      )
      notifies :restart, 'service[rsyslog]'
    end
  end
end
