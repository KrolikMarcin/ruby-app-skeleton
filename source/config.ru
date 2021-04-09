# frozen_string_literal: true

require_relative "system/application/container"
require_relative "app/api/server"

Application::Container.finalize!
run API::Server.run
