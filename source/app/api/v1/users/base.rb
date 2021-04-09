# frozen_string_literal: true

require_relative 'create'

module API
  module V1
    module Users
      class Base < Grape::API
        mount Create
      end
    end
  end
end
