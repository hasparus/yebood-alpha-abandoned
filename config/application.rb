# frozen_string_literal: true
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

unless Rails.env.production?
  Dotenv::Railtie.load
end

module Yebood
  class Application < Rails::Application
    config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_view.field_error_proc = proc { |html_tag, _instance| html_tag }
    config.generators do |g|
      g.stylesheets = false
      g.scaffold_controller 'scaffold_controller'
      g.test_framework :rspec, fixture: true, fixture_replacement: :factory_girl, helper_specs: false, view_specs: false, routing_specs: false, controller_specs: false
    end
  end
end
