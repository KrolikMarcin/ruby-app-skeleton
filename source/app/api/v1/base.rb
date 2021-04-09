# frozen_string_literal: true

require_relative 'users/base'
require_relative 'organizations/base'

module API
  module V1
    class Base < Grape::API
      resources :users do
        mount Users::Base 
      end

      resources :organizations do
        mount Organizations::Base 
      end
    end
  end
end
