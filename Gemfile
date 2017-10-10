source "https://rubygems.org"

ruby "2.4.0"

gem "autoprefixer-rails"
gem "chartkick"
gem "delayed_job_active_record"
gem "flutie"
gem 'groupdate'
gem "jquery-rails"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.0.0"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "sprockets", ">= 3.0.0"
gem "sprockets-es6"
gem "suspenders"
gem "title"
gem "uglifier"

group :development do
  gem "listen"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "capybara-webkit"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.5.0"
  gem "shoulda-matchers"

  gem "formulaic"
  gem "launchy"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :development, :staging do
  gem "rack-mini-profiler", require: false
end

group :test do
  gem "database_cleaner"
end

group :staging, :production do
  gem "rack-timeout"
  gem "rails_stdout_logging"
end

gem 'high_voltage'
gem 'bourbon', '~> 5.0.0.beta.7'
gem 'neat', '~> 2.0.0.beta.1'
gem 'refills', group: [:development, :test]
