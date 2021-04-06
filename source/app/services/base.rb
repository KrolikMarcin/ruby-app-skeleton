# frozen_string_literal: true

require "dry/monads"
require 'import'

module Services
  class Base
    include Dry::Monads[:do, :result]

    def validate_params(schema, input)
      schema
        .(input)
        .to_monad
        .fmap(&:to_h)
        .or { |validaton_result| Dry::Monads::Failure(validaton_result.errors.to_h) }
    end
  end
end
