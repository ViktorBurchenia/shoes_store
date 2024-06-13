module Shoes
  module Types
    class BaseShoesType < ::Types::BaseObject
      description 'Base shoes type'

      field :brand_name, String, null: false
      field :category, String, null: false
      field :color, String, null: false
      field :model, String, null: false
      field :size, String, null: false
      field :price, Integer, null: false
      field :amount, Integer, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
