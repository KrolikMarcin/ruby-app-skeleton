# frozen_string_literal: true

App.boot(:types) do
  init { require 'dry-types' }
  start { register(:types, Dry.Types) }
end
