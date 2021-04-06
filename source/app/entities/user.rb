# frozen_string_literal: true

require_relative 'base'

module Entities
  class User < Base
    attribute? :id, App['types']::Integer
    attribute :uid, App['types']::String
    attribute :name, App['types']::String
    attribute :created_at, App['types']::Time
    attribute :updated_at, App['types']::Time
  end
end