default['vsearch']['version'] = '2.3.4'
default['vsearch']['tar'] = "v#{node['vsearch']['version']}.tar.gz"
default['vsearch']['url'] =
  "https://github.com/torognes/vsearch/archive/#{default['vsearch']['tar']}"
default['vsearch']['filename'] = "vsearch-#{node['vsearch']['version']}"
default['vsearch']['install_path'] = '/usr/local'
default['vsearch']['dir'] =
  "#{node['vsearch']['install_path']}/#{node['vsearch']['filename']}"
