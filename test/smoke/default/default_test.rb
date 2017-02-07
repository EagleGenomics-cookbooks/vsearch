# # encoding: utf-8

# Inspec test for recipe vsearch-test::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file '/usr/local/vsearch-2.3.4' do
  it { should be_directory }
end

describe file('/usr/local/vsearch-2.3.4/bin/vsearch') do
  it { should be_executable }
end

describe file('/usr/local/bin/vsearch') do
  it { should be_executable }
end

describe command('. /etc/profile; vsearch') do
  its('stderr') { should match(/v2.3.4_linux_x86_64/) }
end
