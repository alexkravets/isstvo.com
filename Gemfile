source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails',        '~> 4.2.4'
gem 'sass-rails',   '~> 5.0'
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
# This `autoinc` branch supports mongoid 5.0, required by Loft
gem 'mongoid-autoinc', github: 'suweller/mongoid-autoinc'
gem 'mongosteen'
gem 'chr',     github: 'slate-studio/chr'
gem 'ants',    github: 'slate-studio/ants'
gem 'loft',    github: 'slate-studio/loft'
gem 'tape',    github: 'alexkravets/tape'
gem 'rhythm',  github: 'alexkravets/rhythm'
gem 'journal', github: 'alexkravets/journal'

gem 'font-awesome-rails'

# gem 'chr',      path: '../_slate/chr'
# gem 'rhythm',   path: '../rhythm'
# gem 'loft',     path: '../_slate/loft'
# gem 'formagic', path: '../_slate/formagic'
# gem 'journal',  path: '../journal'
# gem 'tape',  path: '../tape'

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
