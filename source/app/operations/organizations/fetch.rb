# frozen_string_literal: true

module Operations
  module Organizations
    class Fetch < Base
      include ::Import[organization_repo: 'repos.organization']

      def call
        organization_repo
          .find_dry_rb!
          .then(&method(:Success))
      end
    end
  end
end


