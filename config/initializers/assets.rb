# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )


Rails.application.config.assets.precompile += %w( events.scss )
Rails.application.config.assets.precompile += %w( comments.scss )
Rails.application.config.assets.precompile += %w( admins.scss )
Rails.application.config.assets.precompile += %w( gmap_dots.scss )

# подключаем lightbox2-rails
Rails.application.config.assets.precompile += %w( lightbox.js )
Rails.application.config.assets.precompile += %w( lightbox.css )

# темы для rails_admin
Rails.application.config.assets.precompile += %w( rails_admin/custom/theming.css )

