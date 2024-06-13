# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    def self.query(name, resolver, **options)
      field(name, resolver:, **options)
    end

    query :get_shoes, ::Shoes::Queries::GetShoes
  end
end
