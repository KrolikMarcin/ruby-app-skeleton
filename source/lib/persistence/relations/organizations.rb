# frozen_string_literal: true

module Persistence
  module Relations
    class Organizations < ROM::Relation[:http]
      gateway :github

      schema(:orgs) do
        attribute :id, Types::Integer
        attribute :name, Types::String
        attribute :created_at, Types::JSON::Time
        attribute :updated_at, Types::JSON::Time
      end

      def by_name(name)
        append_path(name)
      end
    end
  end
end
