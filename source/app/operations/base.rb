# frozen_string_literal: true

require "dry/monads"
require 'application/import'
require_relative '../entities/err'

module Operations
  class Base
    include Dry::Monads[:do, :result, :maybe]

    def validate_params!(schema: self.class::Schema, **input)
      schema
        .call(input)
        .to_monad
        .fmap(&:to_h)
        .or do |validaton_result|
          build_failure(message:"Invalid params", status: 400, details: { **validaton_result.errors.to_hash })
        end
    end

    def build_failure(message:, status: nil, details: {})
      Entities::Err
        .new(message: message, klass: String(self.class), status: status, details: details)
        .then(&method(:Failure))
    end
  end
end
