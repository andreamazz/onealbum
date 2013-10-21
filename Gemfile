source 'https://rubygems.org'

gem 'rails', '4.0.0'

gem 'pg'
gem 'squeel'

gem 'devise'

gem 'haml-rails'
gem 'sass-rails', '~> 4.0.0'
gem 'compass-rails', '~> 2.0.alpha.0'
gem 'font-awesome-rails'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass'

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'icheck-rails'

# gem 'gridster-rails'
gem 'facebox-rails'

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'thin'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_cleaner'  # DatabaseCleaner required to test user authentication protected routes
  gem 'launchy'
end

group :production do
  gem 'unicorn'
end
