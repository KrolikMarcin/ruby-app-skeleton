# frozen_string_literal: true

module Persistence
  module Relations
    class Users < ROM::Relation[:sql]
      schema(:users) do
        attribute :id, Types::Strict::Integer
        attribute :uid, Types::Strict::String
        attribute :name, Types::Strict::String
        attribute :created_at, Types::Strict::Time
        attribute :updated_at, Types::Strict::Time
      end

      dataset { order(:created_at) }
    end
  end
end
