# frozen_string_literal: true

require 'grape-entity'

module Decorators
  module Users
    class Base < Grape::Entity
      expose :uid, documentation: { type: String }
      expose :name, documentation: { type: String }
    end
  end
end
