# frozen_string_literal: true

require "dry/system/components"
require "types"

Application::Container.boot(:settings, from: :system) do
  settings do
    key :rack_env, Types::String.default('development')
    key :rds_user, Types::Strict::String
    key :rds_database, Types::Strict::String
    key :rds_host, Types::Strict::String
    key :rds_port, Types::Coercible::Integer
    key :rds_password, Types::Strict::String
    key :sequel_pool, Types::Coercible::Integer
    key :started_at, Types::Time.default { Time.now }
  end
end