# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    def self.query(name, mutation, authenticate: true)
      field(name, mutation:, authenticate:)
    end

    # Shoes
    query :create_shoes, ::Shoes::Mutations::CreateShoes
    query :update_shoes, ::Shoes::Mutations::UpdateShoes

    # Orders
    query :create_order, ::Orders::Mutations::CreateOrder
    query :update_order, ::Orders::Mutations::UpdateOrder
  end
end
