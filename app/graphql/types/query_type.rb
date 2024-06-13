# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    def self.query(name, resolver, authenticate: true, **options)
      field(name, resolver:, authenticate:, **options)
    end

    # Shoes
    query :get_shoes, ::Shoes::Queries::GetShoes

    # Orders
    query :get_orders, ::Orders::Queries::GetOrders
  end
end
