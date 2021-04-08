# frozen_string_literal: true

require 'securerandom'
require_relative '../changesets/users/new'

module Repos 
  class User < ROM::Repository[:users]
    include Import["persistence.container"]
    include Local

    def create(**params)
      super(changeset: ::Changesets::Users::New, uid: SecureRandom.uuid, **params)
    end
  end
end
