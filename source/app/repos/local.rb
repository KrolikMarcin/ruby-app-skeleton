# frozen_string_literal: true

module Repos
  module Local
    def find_by(**params)
      root.where(**params).one
    end

    def create(changeset: :create, **params)
      root.changeset(changeset, **params).map(:add_timestamps).commit
    end

    def update(changeset: :update, **params)
      root.changeset(changeset, **params).map(:touch).commit
    end
  end
end
