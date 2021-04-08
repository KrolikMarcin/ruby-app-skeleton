# frozen_string_literal: true

Application::Container.boot(:logger) do
  init { require 'logger' }
  start { register(:logger, Logger.new($stdout)) }
end