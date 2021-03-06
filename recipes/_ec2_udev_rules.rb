#
# Cookbook Name:: cfncluster
# Recipe:: _ec2_udev_rules
#
# Copyright 2013-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the
# License. A copy of the License is located at
#
# http://aws.amazon.com/apache2.0/
#
# or in the "LICENSE.txt" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
# OR CONDITIONS OF ANY KIND, express or implied. See the License for the specific language governing permissions and
# limitations under the License.

cookbook_file 'ec2-volid.rules' do
  path '/etc/udev/rules.d/52-ec2-volid.rules'
  user 'root'
  group 'root'
  mode '0644'
end

cookbook_file 'ec2_dev_2_volid.py' do
  path '/sbin/ec2_dev_2_volid.py'
  user 'root'
  group 'root'
  mode '0744'
end

cookbook_file 'ec2blkdev-init' do
  path '/etc/init.d/ec2blkdev'
  user 'root'
  group 'root'
  mode '0744'
end

cookbook_file 'attachVolume.py' do
  path '/usr/local/sbin/attachVolume.py'
  user 'root'
  group 'root'
  mode '0755'
end

service "ec2blkdev" do
  supports restart: true
  action [:enable, :start]
end
