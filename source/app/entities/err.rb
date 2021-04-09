# frozen_string_literal: true

module Entities
  class Err < Dry::Struct
    transform_keys(&:to_sym)

    attribute :message, Types::String
    attribute :klass, Types::String
    attribute? :status, Types::Integer.optional
    attribute :details, Types::Hash.default { {} }
  end
end
