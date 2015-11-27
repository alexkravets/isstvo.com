source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '~> 4.2.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'unicorn'
gem 'recipient_interceptor'
gem 'rack-canonical-host'
gem 'meta-tags'
gem 'awesome_print'
gem 'bson_ext'
gem 'mongoid', '~> 5.0'
gem 'rack-host-redirect'
# This `autoinc` branch supports mongoid 5.0, required by Loft
gem 'mongoid-autoinc', github: 'suweller/mongoid-autoinc'
gem 'mongosteen'
# gem 'formagic', path: '../_slate/formagic'
gem 'chr'
gem 'ants'
gem 'loft'
gem 'tape', github: 'alexkravets/tape'
gem 'rhythm', github: 'alexkravets/rhythm'
gem 'journal', github: 'alexkravets/journal'

group :development do
  gem 'spring'
  gem 'web-console'
end

group :development, :test do
  gem 'figaro'
  gem 'byebug'
  gem 'quiet_assets'
  gem 'bundler-audit', require: false
  gem 'factory_girl_rails'
  gem 'dotenv-rails'
end

group :staging, :production do
  gem 'rack-timeout'
  gem 'rails_12factor'
end
