# frozen_string_literal: true

require_relative 'get'

module API
  module V1
    module Organizations
      class Base < Grape::API
        mount Get
      end
    end
  end
end
