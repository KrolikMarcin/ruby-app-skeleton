# frozen_string_literal: true

module Changesets
  module Users
    class New < ROM::Changeset::Create
      map { |tuple| { **tuple, name: tuple.fetch(:name).capitalize } }
    end
  end
end