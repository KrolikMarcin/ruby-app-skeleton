# frozen_string_literal: true

require "dry/system/components"
require "dry-types"

App.boot(:settings, from: :system) do
  settings do
    key :rack_env, Dry.Types::String.default('development')
    key :rds_user, Dry.Types::Strict::String
    key :rds_database, Dry.Types::Strict::String
    key :rds_host, Dry.Types::Strict::String
    key :rds_port, Dry.Types::Coercible::Integer
    key :rds_password, Dry.Types::Strict::String
    key :sequel_pool, Dry.Types::Coercible::Integer
  end
end