# frozen_string_literal: true

require "dry/monads"
require 'application/import'

module Services
  class Base
    include Dry::Monads[:do, :result, :maybe]

    def validate_params!(schema: self.class::Schema, **input)
      schema
        .(input)
        .to_monad
        .fmap(&:to_h)
        .or { |validaton_result| Dry::Monads::Failure(validaton_result.errors.to_h) }
    end
  end
end
