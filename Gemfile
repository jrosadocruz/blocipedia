source 'https://rubygems.org'
ruby '2.2.0'
gem 'rails', '4.2.1'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

gem 'bootstrap-sass'
gem 'devise'
gem 'pundit'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug'
  gem 'sqlite3'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'faker'
  gem 'quiet_assets' # https://github.com/evrone/quiet_assets
  gem 'sextant' # localhost:3000/rails/routes

  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'

  # gem "rails-erd"
  # gem 'annotate'

  gem 'pry-rails'
  gem "better_errors"
  gem 'binding_of_caller'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'haml-rails'
  gem 'sass-rails'
  gem 'coffee-rails', '~> 4.1.0'
  gem 'uglifier', '>= 1.3.0'
end