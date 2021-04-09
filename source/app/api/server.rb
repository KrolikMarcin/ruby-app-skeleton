# frozen_string_literal: true

require_relative 'base'

module API
  module Server
    extend self

    def run
      Rack::Builder.app { run Base }
    end
  end
end
