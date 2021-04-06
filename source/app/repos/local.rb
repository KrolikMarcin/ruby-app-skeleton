# frozen_string_literal: true

require "import"

module Repos
  class Local < Base
    option :relation_name, types: App['types']::Symbol
    include Import[:database]

    def create(**attributes)
      Try[Sequel::Error, Dry::Struct::Error] do
        entity = data_entity.new(**attributes.to_h, **initial_metadata)
        pk = storage.insert(entity.attributes)
        entity.assign(id: pk)
      end.to_result
    end

    def find_by(args)
      record = storage.where(args).first
      wrap_in_data_object(record)
    end

    def find_by!(args)
      Maybe(yield find_by(args)).to_result { :entity_does_not_exist }
    end

    private

    def storage
      database[relation_name]
    end

    def initial_metadata
      fail NotImplementedError
    end

    def update_metadata
      fail NotImplementedError
    end

    def wrap_in_data_object(record)
      return Success(nil) unless record

      Success(data_entity.new(record))
    end

    def wrap_in_data_collection(records)
      Success(records.map { |record| data_entity.new(record) })
    end
  end
end
