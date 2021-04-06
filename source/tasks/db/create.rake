# frozen_string_literal: true
require_relative '../../system/app'

namespace :db do
  desc "Create database"
  task :create do
    db = App.start(:database)
    db.execute("CREATE DATABASE \"#{App[:settings].rds_database}\"")
    db.disconnect
  rescue Sequel::DatabaseError
    puts("Database already exists!")
  end
end
