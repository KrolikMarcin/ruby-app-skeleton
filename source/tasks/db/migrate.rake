# frozen_string_literal: true

require "sequel/core"
require_relative '../../system/app'

namespace :db do
  desc "Run migrations"
  task :migrate, [:version] do |_t, args|
    App.start(:database)
    App.start(:logger)

    logger = App['logger']
    logger.info("Migrating #{App[:settings].rds_database} database...")

    version = args[:version].nil? ? nil : Integer(args[:version])
    db = App['database']

    Sequel.extension :migration

    if File.directory?("/app/db/migrations")
      Sequel::Migrator.run(db, "db/migrations", target: version)
      logger.info("Migrated!")

      logger.info("Dumping schema...")
      db.extension :schema_dumper
      schema_dump = db.dump_schema_migration(same_db: true)
      File.open("/app/db/schema.rb", "w") { |file| file.write(schema_dump) }
      db.extension :schema_caching
      db.dump_schema_cache("/app/db/schema.dump")
      logger.info("Schema dumped!")
    else
      logger.info("No migrations yet! Put them to /db/migrations dir")
    end

    db.disconnect
  end
end
