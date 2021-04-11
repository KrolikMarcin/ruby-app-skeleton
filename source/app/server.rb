# frozen_string_literal: true

require_relative 'api/base'

module Server
  extend self

  def run
    Rack::Builder.app do
      use Rack::CommonLogger, Application::Container[:logger]
      run API::Base
    end
  end
end
