# frozen_string_literal: true

require 'dry/struct'

module Entities
  class Base < Dry::Struct
    transform_keys(&:to_sym)

    def assign(**new_attributes)
      self.new(**attributes.merge(new_attributes))
    end
  end
end
