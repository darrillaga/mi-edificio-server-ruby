source 'https://rubygems.org'

# Padrino supports Ruby version 1.9 and later
# ruby '2.3.0'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Gemfile

# Project requirements
gem 'rake'

# Component requirements
gem 'activerecord', '>= 3.1', :require => 'active_record'

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

# Test requirements

gem 'padrino-core', '0.13.2'
gem 'padrino-gen', '0.13.2'

gem 'oj', '~> 2.15'
gem 'multi_json', '~> 1.12'
gem 'jbuilder', '~> 2.4', '>= 2.4.1'
gem 'sinatra-hashfix', '~> 0.1.0'