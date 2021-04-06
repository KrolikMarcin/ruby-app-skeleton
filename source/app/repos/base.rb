# frozen_string_literal: true

require "dry/monads"
require "dry/initializer"

module Repos
  class Base
    include Dry::Monads[:do, :try, :result, :maybe]
    extend Dry::Initializer

    option :data_entity, types: App['types'].Interface(:new)
  end
end
