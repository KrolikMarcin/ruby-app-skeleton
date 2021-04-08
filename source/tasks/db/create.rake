# frozen_string_literal: true

namespace :db do
  desc "Create database"
  task create: :environment do
    db = Application::Container['persistence.db']
    db.execute("CREATE DATABASE \"#{Application::Container[:settings].rds_database}\"")
    db.disconnect
  rescue Sequel::DatabaseError
    puts("Database already exists!")
  end
end
