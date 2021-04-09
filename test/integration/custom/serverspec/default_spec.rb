require 'serverspec'

set :backend, :exec

describe package('threatstack-agent') do
  it { should be_installed }
end

describe service('threatstack') do
  it { should be_running }
  it { should be_enabled }
end

describe command('tsagent config --list') do
  its(:stdout) { should match /log.maxSize=22/ } # rubocop: disable Lint/AmbiguousRegexpLiteral
end

describe file('/opt/threatstack') do
  it { should_not be_more_permissive_than('0750') }
end

describe file('/opt/threatstack') do
  its('owner') { should eq user.user }
end``