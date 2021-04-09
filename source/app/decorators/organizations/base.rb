# frozen_string_literal: true

require 'grape-entity'

module Decorators
  module Organizations
    class Base < Grape::Entity
      expose :id, documentation: { type: Integer }
      expose :name, documentation: { type: String }
    end
  end
end
