# frozen_string_literal: true

Application::Container.boot :persistence, namespace: true do |app|
  init do
    require "sequel"
    require "rom"
    require "rom/sql"

    ROM::SQL.load_extensions :postgres
    Sequel.database_timezone = :utc
    Sequel.application_timezone = :local

    use :logger
    use :settings

    gateways = { 
      default: [
        :sql,
        {
          adapter: :postgres,
          user: app[:settings].rds_user,
          password: app[:settings].rds_password,
          host: app[:settings].rds_host,
          port: app[:settings].rds_port,
          database: app[:settings].rds_database,
          max_connections: app[:settings].sequel_pool,
          logger: app[:logger],
          extensions: [:pg_json],
        }
      ],
      github: [:http, uri: "https://api.github.com", handlers: :json]
    }
    rom_config = ROM::Configuration.new(gateways)

    register :config, rom_config
    register :db, rom_config.gateways[:default].connection
  end

  start do
    config = container['persistence.config']
    config.auto_registration(app.root + "lib/persistence")
    register :container, ROM.container(config)
  end
end