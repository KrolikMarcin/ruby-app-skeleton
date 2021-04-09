# frozen_string_literal: true

require 'decorators/users/base'

module API
  module V1
    module Users
      class Create < Grape::API
        DECORATOR = ::Decorators::Users::Base

        params do
          requires :name, type: String, allow_blank: false
        end

        post do
          Application::Container['operations.users.create']
            .call(**declared_params)
            .value_or(&method(:handle_failure))
            .then { |created_user| present created_user, with: DECORATOR }
        end
      end
    end
  end
end
