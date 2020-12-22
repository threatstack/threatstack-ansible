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
