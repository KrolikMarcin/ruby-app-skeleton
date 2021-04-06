# frozen_string_literal: true

App.boot(:database) do |app|
  init do
    require "sequel"
  end

  start do
    use :logger
    use :settings
    opts = {
      adapter: :postgres,
      user: app[:settings].rds_user,
      password: app[:settings].rds_password,
      host: app[:settings].rds_host,
      port: app[:settings].rds_port,
      database: app[:settings].rds_database,
      max_connections: app[:settings].sequel_pool,
      logger: app[:logger],
    }
    register(:database, Sequel.connect(opts))
  end
end