# frozen_string_literal: true

require "sequel/core"

namespace :db do
  desc "Run migrations"
  task :migrate, [:version] => [:environment] do |_t, args|

    logger = Application::Container['logger']
    logger.info("Migrating #{Application::Container[:settings].rds_database} database...")

    version = args[:version].nil? ? nil : Integer(args[:version])
    db = Application::Container['persistence.db']

    Sequel.extension :migration

    if File.directory?("/app/db/migrations")
      Sequel::Migrator.run(db, "db/migrations", target: version)
      logger.info("Migrated!")
    else
      logger.info("No migrations yet! Put them to /db/migrations dir")
    end

    db.disconnect
  end
end
