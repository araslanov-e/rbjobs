source 'http://rubygems.org'

gem 'rails', '~> 3.2.2'
gem 'jquery-rails', '~> 2.0.1'
gem 'sqlite3', '~> 1.3.5'
gem 'kaminari', '~> 0.13.0'
gem 'redcarpet', '~> 2.1.1'

group :staging, :production do
  gem 'postmark-rails', '~> 0.4.1'
  gem 'exception_notification', '~> 2.5.2'
end

group :development do
  gem 'letter_opener', '~> 0.0.2'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.9.0'
end

group :assets do
  gem 'uglifier', '~> 1.2.3'
end