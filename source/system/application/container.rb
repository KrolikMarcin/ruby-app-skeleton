# frozen_string_literal: true

require 'dry/system/container'
require "bundler/setup"
require 'dry/schema'

module Application
  class Container < Dry::System::Container
    use :env, inferrer: -> { ENV }

    configure do |config|
      config.auto_register = %w[app/services app/repos]
    end

    load_paths!('app', 'lib')

    Dry::Schema.load_extensions(:monads)
  end
end