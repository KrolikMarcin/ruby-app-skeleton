# frozen_string_literal: true

module API
  module Helpers
    module Failure
      private

      def handle_failure(failure)
        return error_500! unless failure.is_a?(::Entities::Err) && failure.status.present?
        
        error!(
          { errors: [{ status: failure.status, title: failure.message, details: failure.details }] },
          failure.status
        )
      end

      def error_500!
        error!(
          { errors: [{ status: 500, title: "Unhandled exception occurred" }] },
          500
        )
      end
    end
  end
end
