#
# Cookbook:: vsearch-test
# Recipe:: default
#
# Copyright 2017 Eagle Genomics Ltd
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

include_recipe 'apt' if platform_family?('debian')
include_recipe 'build-essential'

# files required for testing
cookbook_file '/tmp/reads.gz' do
  source 'temp.gz'
  action :create
end

%w(tar autoconf automake).each do |pkg|
  package pkg do
    action :install
  end
end

# packages to allow support for gzip and bzip2 compressed input files
package 'zlib-devel' do
  case node['platform']
  when 'centos'
    package_name 'zlib-devel'
  when 'ubuntu'
    package_name 'zlib1g-dev'
  end
end

remote_file "#{Chef::Config[:file_cache_path]}/#{node['vsearch']['tar']}" do
  source node['vsearch']['url']
  action :create_if_missing
end

execute 'extract to install directory' do
  command 'tar xzf ' \
    "#{Chef::Config[:file_cache_path]}/#{node['vsearch']['tar']} " \
    "-C #{node['vsearch']['install_path']}"
  not_if { ::File.exist?(node['vsearch']['dir'].to_s) }
end

bash 'Install VSEARCH' do
  code <<-EOH
    ./autogen.sh
    ./configure
    make
    make install
  EOH
  cwd node['vsearch']['dir'].to_s
end
