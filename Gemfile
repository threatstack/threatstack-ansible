source 'https://rubygems.org'

group :development, :unit_tests do
  gem 'rake',           :require => false
end

group :system_tests do
  gem 'serverspec', '= 2.24.0'
  gem 'test-kitchen'
  gem 'kitchen-docker', :require => false
  gem 'kitchen-ansible', :git => "git://github.com/olhado/kitchen-ansible.git", :branch => "ubuntu-2004-kludge"
end
