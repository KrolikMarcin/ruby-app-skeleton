# frozen_string_literal: true

require_relative '../entities/user'

module Repos
  class User < Local
    option :data_entity, default: -> { ::Entities::User }
    option :relation_name, default: -> { :users }

    private

    def initial_metadata
      { created_at: Time.current, updated_at: Time.current, uid: SecureRandom.uuid }
    end

    def update_metadata
      { updated_at: Time.current }
    end
  end
end
