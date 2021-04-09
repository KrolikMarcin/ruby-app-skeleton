# frozen_string_literal: true

module Operations
  module Users
    class Create < Base
      include ::Import[user_repo: 'repos.user']

      Schema = Dry::Schema.Params { required(:name).filled(:string) }

      def call(**params)
        yield validate_params!(**params)
        yield validate_unique_name!(**params)
        
        user_repo
          .create(**params)
          .then(&method(:Success))
      end

      private

      def validate_unique_name!(name:)
        user_repo
          .find_by(name: name.capitalize)
          .then(&method(:Maybe))
          .to_result
          .either(
            ->_ { build_failure(message: "Name is not uniqe", status: 412, details: { name: name }) },
            ->_ { Success(:unique_name) }
          )
      end
    end
  end
end


