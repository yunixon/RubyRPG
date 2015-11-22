source 'https://rubygems.org'
ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use sqlite3 as the database for Active Record
gem 'pg'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# API
gem 'grape'
gem 'grape-entity'
# API DOCS
gem 'grape-swagger', '~> 0.9.0'
gem 'grape-swagger-rails'

gem 'rack-contrib'
gem 'sprig', '~> 0.1'
gem 'rails_admin'
gem 'thin'
gem 'slim-rails'
gem 'orm_adapter', '~> 0.5.0'
gem 'devise'
gem 'warden'
gem 'bootstrap-sass', '~> 3.3.5'
gem 'bootswatch-rails'
gem 'sidekiq'
gem 'sidekiq-client-cli'
gem 'sinatra', require: nil
gem 'redis'
gem 'whenever', require: false
gem 'rollbar'

group :development do
  gem 'spring'
  gem 'pry-rails'
  gem 'looksee'
  gem 'awesome_print'
  gem 'hirb'
  gem 'rails_layout'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'annotate'
  gem 'rack-mini-profiler', require: false
  # Deployment
  gem 'capistrano', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-sidekiq', require: false
  gem 'capistrano3-unicorn'
end

group :production, :staging do
  # For Heroku deployment
  gem 'unicorn'
  gem 'rails_12factor'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end
