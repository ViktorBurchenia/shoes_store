module Shoes
  module Mutations
    class CreateShoes < ::Mutations::BaseMutation
      description 'Create Shoes'

      argument :brand_name, String, required: true
      argument :category, String, required: true
      argument :color, String, required: true
      argument :model, String, required: true
      argument :size, String, required: true
      argument :price, Integer, required: true
      argument :amount, Integer, required: true

      type ::Shoes::Types::BaseType

      def resolve(**params)
        shoes = Shoe.new(**params)

        raise GraphQL::ExecutionError, shoes.errors.full_messages.join(', ') unless shoes.save

        shoes.reload
      end
    end
  end
end
