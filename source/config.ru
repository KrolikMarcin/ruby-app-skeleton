# frozen_string_literal: true

# require ::File.expand_path("../config/environment.rb", __FILE__)
require_relative "system/application/container"
require_relative "app/api/server"

Application::Container.finalize!
run API::Server.run
