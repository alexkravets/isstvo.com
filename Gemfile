source "https://rubygems.org"
gemspec
ruby "2.2.3"

gem "rails", "~> 4.2.5"
gem "sass-rails", "~> 5.0"
gem "uglifier"
gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"
gem "unicorn"
gem "recipient_interceptor"
gem "rack-canonical-host"
gem "awesome_print"
gem "bson_ext"
gem "mongoid", "~> 5.0"
gem "fog"
gem "fog-aws"
gem "rack-host-redirect"
gem "ants", path: "../ants"
gem "tape-chr"
gem "journal-chr"

group :development do
  gem "spring"
  gem "web-console"
  gem "heroku"
end

group :development, :test do
  gem "figaro"
  gem "byebug"
  gem "quiet_assets"
  gem "bundler-audit", require: false
  gem "factory_girl_rails"
  gem "dotenv-rails"
end

group :staging, :production do
  gem "rack-timeout"
  gem "rails_12factor"
end
