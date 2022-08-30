source ENV['GEM_SOURCE'] || 'https://rubygems.org'

group :development, :unit_tests do
  gem 'rake', "13.0.1",         :require => false
  gem 'rubocop', '= 0.61.1'
end

group :system_tests do
  gem 'serverspec',         :require => false
  gem 'test-kitchen',       :require => false
  gem 'kitchen-docker',     :require => false
  gem 'kitchen-ansible',    :require => false
  gem 'kitchen-inspec',     :require => false
end
