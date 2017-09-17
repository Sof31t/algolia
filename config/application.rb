require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Algolia
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # Enable UUID for ActiveRecord primary keys
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end

    config.autoload_paths += Dir[Rails.root.join('app', 'validators').to_s]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
