source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7', '>= 3.7.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


# гем регистрации
gem 'devise'
# гем для перевода сообщений девайса
gem 'devise-i18n'
# гем с русскими форматами (времени и пр.)
gem 'russian'
# гем, интегрирующий bootstrap
gem 'bootstrap-sass'
# гем для загрузки картинок и аватарок
gem 'carrierwave'
# гем для обработки картинок
gem 'rmagick'
# гем для работы carrierwave с хранилищем Amazon S3
# gem 'fog-aws'
gem 'thor', '0.19.1'
# гем для иконок
gem 'font-awesome-rails'
# гем для lightbox-bootstrap отображения картинок
# gem 'lightbox-bootstrap-rails'
# гем для пагинации
gem 'will_paginate'
# гем для лайтбокс-рельс
gem 'lightbox2-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'sqlite3'
  # Гем для проверки code-style
  gem 'rubocop', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# для админки
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'