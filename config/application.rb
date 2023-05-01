require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Techpitgram
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.i18n.default_locale = :ja

    # additional_pathsを追加
    # config.additional_paths << Rails.root.join('lib').to_s
    # config.additional_paths << Rails.root.join('app/services').to_s
    # config.additional_paths << Rails.root.join('app/api').to_s
    # config.additional_paths << Rails.root.join('app/views').to_s
    # config.additional_paths << Rails.root.join('config', 'locales').to_s

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
