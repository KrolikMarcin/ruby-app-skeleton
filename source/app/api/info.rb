# frozen_string_literal: true

module API
  class Info < Grape::API
    get :info do
      db = Application::Container['persistence.db']
      unless db.valid_connection?(db)
        error!({ request_id: request_id, title: "Database connection failed", status: 503 }, 503)
      end

      {
        service: "App skeleton",
        db_connection: true,
        started_at: Application::Container[:settings].started_at,
      }
    end
  end
end
