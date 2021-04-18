source 'https://rubygems.org'
ruby "2.5.7"

gem 'rails', '~> 5.2.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development do
  gem 'spring'
  gem 'listen'
end

gem 'bootstrap-sass', '~> 3.4.1'
gem "paperclip", "~> 4.1"
gem "paperclip-dropbox", ">= 1.1.7"
gem "figaro"

gem 'devise', '4.6.2'

group :production do
  gem 'pg', '0.21.0'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3', '~> 1.3.0'
end

group :doc do
  gem 'sdoc', require: false
end

group :test, :development do
  gem 'rspec-rails'
end

group :test do
  gem 'capybara', '>= 2.15'
end
