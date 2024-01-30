require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module New
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #config.admin_username = ENV['ADMIN_USERNAME']
    config.admin_username = ENV['ADMIN_USERNAME']
    config.admin_password = ENV['ADMIN_PASSWORD']

    config.middleware.use ::Rack::Auth::Basic do |username, password|
      username == config.admin_username && password == config.admin_password
    end
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
