require 'dry/system/container'
require "bundler/setup"
require "active_support/all"
require 'dry/schema'

class App < Dry::System::Container
  use :env, inferrer: -> { ENV }

  configure do |config|
    config.auto_register = %w[app/services app/repos]
  end

  load_paths!('app')

  Dry::Schema.load_extensions(:monads)
end