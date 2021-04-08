# frozen_string_literal: true

module Repos 
  class Organization < ROM::Repository[:orgs]
    include Import["persistence.container"]
    include Local

    def find_dry_rb!
      root.by_name('dry-rb').one!
    end
  end
end
