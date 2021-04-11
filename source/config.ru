# frozen_string_literal: true

require_relative "system/application/container"
require_relative "app/server"

Application::Container.finalize!
run Server.run
