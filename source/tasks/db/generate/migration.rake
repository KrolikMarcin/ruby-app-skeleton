# frozen_string_literal: true

require "pathname"
require "fileutils"

namespace :db do
  namespace :generate do
    desc "Create a migration (parameters: NAME, VERSION)"
    task :migration do
      unless ENV["NAME"]
        puts "No NAME specified. Example usage: `rake db:generate:migration NAME=create_user`"
        exit
      end

      name = ENV["NAME"]
      version = ENV["VERSION"] || Time.now.utc.strftime("%Y%m%d%H%M%S")
      dirname = File.join("db", "migrations")
      path = File.join(dirname, "#{version}_#{name}.rb")

      Dir.entries(dirname).each do |file|
        next unless file.sub(/([0-9]+_)/, "") == "#{name}.rb"

        puts "Another migration is already named {version}_#{name}.rb"
        exit
      end

      File.write path, <<~MIGRATION
                   # frozen_string_literal: true

                   Sequel.migration do
                     change do
                     end
                   end
                 MIGRATION

      puts path
    end
  end
end
