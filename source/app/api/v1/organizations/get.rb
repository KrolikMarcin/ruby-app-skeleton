# frozen_string_literal: true

require 'decorators/organizations/base'

module API
  module V1
    module Organizations
      class Get < Grape::API
        DECORATOR = ::Decorators::Organizations::Base

        get do
          Application::Container['operations.organizations.fetch']
            .call(**declared_params)
            .value_or(&method(:handle_failure))
            .then { |organization| present organization, with: DECORATOR }
        end
      end
    end
  end
end
