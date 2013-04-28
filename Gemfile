source 'http://rubygems.org'

ruby '2.0.0'

gem 'rails', '=3.2.12'
gem 'pg'
gem 'haml-rails'
gem 'strong_parameters'
gem 'sucker_punch'
gem 'postmark-rails'

group :production do
  gem 'lograge'
  gem 'unicorn'
end

group :development do
  gem 'quiet_assets'
  gem 'foreman'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'capybara-email'
  gem 'launchy'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-rails'
  gem 'flatstrap-rails'
end

