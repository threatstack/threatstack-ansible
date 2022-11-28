# MIT License
#
# Copyright (c) 2015-2022 F5, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

require 'serverspec'

set :backend, :exec

describe package('threatstack-agent') do
  it { should be_installed }
end

describe service('threatstack') do
  it { should be_running }
  it { should be_enabled }
end

describe command('tsagent status') do
  # Sometimes due to other services, like auditd, the install would be successful, but then this service would get killed
  its(:stdout) { should match /UP Threat Stack Agent Daemon/ } # rubocop: disable Lint/AmbiguousRegexpLiteral
  its(:stdout) { should match /UP Threat Stack Backend Connection/ } # rubocop: disable Lint/AmbiguousRegexpLiteral
  its(:stdout) { should match /UP Threat Stack Heartbeat Service/ } # rubocop: disable Lint/AmbiguousRegexpLiteral
  its(:stdout) { should match /UP Threat Stack Login Collector/ } # rubocop: disable Lint/AmbiguousRegexpLiteral
  its(:stdout) { should match /UP Threat Stack Log Scan Service/ } # rubocop: disable Lint/AmbiguousRegexpLiteral
  its(:stdout) { should match /UP Threat Stack Vulnerability Scanner/ } # rubocop: disable Lint/AmbiguousRegexpLiteral
  its(:stdout) { should match /UP Threat Stack File Integrity Monitor/ } # rubocop: disable Lint/AmbiguousRegexpLiteral
end
