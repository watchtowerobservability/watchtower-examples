# Single-file Rails app wired with Watchtower. Run: bundle exec rackup -p 3000
require 'bundler/setup'
require 'rails'
require 'action_controller/railtie'
require 'watchtower'

Watchtower.init(Watchtower::Config.from_env(service: ENV.fetch('WT_SERVICE', 'rails-example')))

class ExampleApp < Rails::Application
  config.root = __dir__
  config.eager_load = false
  config.secret_key_base = SecureRandom.hex(32)
  config.consider_all_requests_local = true
  config.logger = Logger.new($stdout)
  routes.append do
    get '/hello', to: 'example#hello'
    get '/boom', to: 'example#boom'
  end
end

class ExampleController < ActionController::Base
  def hello = render(json: { hello: 'watchtower' })
  def boom = raise('boom from the Rails example')
end

ExampleApp.initialize!
run ExampleApp
