source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.9'
gem 'pg'
gem 'haml-rails'
gem 'strong_parameters'

group :production do
  gem 'lograge'
  gem 'postmark-rails'
  gem 'unicorn'
end

group :development do
  gem 'quiet_assets'
  gem 'thin'
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
end

gem 'jquery-rails'
