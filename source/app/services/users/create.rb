# frozen_string_literal: true

module Services
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
            ->_ { Failure(:name_is_not_unique) },
            ->_ { Success(:unique_name) }
          )
      end
    end
  end
end
