# coding: utf-8
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

# Address https://nvd.nist.gov/vuln/detail/CVE-2021-41098
gem "nokogiri", "~> 1.13"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
# Use sqlite3 as the database for Active Record for development and testing
gem 'sqlite3', '~> 1.4', :groups => [:development, :test]
# Use postgresql as the database for Active Record for production
gem 'pg', '~> 1.1', :groups => [:production]
# Use Puma as the app server
gem 'puma', '~> 5.6'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use bootstrap
gem 'bootstrap-sass'

# Use bcrypt
gem 'bcrypt', '~> 3.1.7'

# Ordinarily, you’d probably want to restrict the faker gem to a
# development environment, but in the case of the sample app we’ll be using
# it on our production site as well.
gem 'faker', '~> 2.19'

gem 'will_paginate', '~> 3.3'
gem 'bootstrap-will_paginate', '~> 1.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
# gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # In Ruby 3 rexml became a bundled gem and must be declared explicitly:
  # https://stackoverflow.com/questions/65479863/rails-6-1-ruby-3-0-0-tests-error-as-they-cannot-load-rexml
  gem 'rexml', '~> 3.2', '>= 3.2.4'

  gem 'rails-controller-testing'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Use guard for automated continous test running during development.  See
  # https://www.railstutorial.org/book/static_pages#sec-guard
  gem 'guard'
  gem 'guard-minitest'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'minitest'
  gem 'minitest-reporters'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
