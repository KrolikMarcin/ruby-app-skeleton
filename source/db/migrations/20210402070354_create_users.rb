# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :users do
      primary_key :id, type: :Bignum
      String :uid, null: false, unique: true
      String :name, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end
