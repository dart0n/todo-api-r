source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.5'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem 'dotenv-rails'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'sidekiq', '~> 6.4'
gem 'whenever', '~> 1.0'

gem 'jsonapi-serializer'
gem 'jwt_sessions', '~> 2.5'

gem 'dry-configurable', '0.12.1'
gem 'dry-validation', '~> 0.13'
gem 'reform', '~> 2.3.2'
gem 'trailblazer', '~> 2.1'
gem 'trailblazer-rails', '~> 2.1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.21'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 5.1'
  gem 'rubocop-rspec', '~> 2.11', require: false
end

group :development do
  gem 'brakeman', '~> 5.2'
  gem 'listen', '~> 3.3'
  gem 'overcommit', '~> 0.59.1'
  gem 'rubocop', '~> 1.28', require: false
  gem 'rubocop-performance', '~> 1.13', require: false
  gem 'rubocop-rails', '~> 2.14', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'simplecov', '~> 0.21.2', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
