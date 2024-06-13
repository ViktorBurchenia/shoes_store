# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    def self.query(name, mutation)
      field(name, mutation:)
    end

    query :create_shoes, ::Shoes::Mutations::CreateShoes
    query :update_shoes, ::Shoes::Mutations::UpdateShoes
  end
end
