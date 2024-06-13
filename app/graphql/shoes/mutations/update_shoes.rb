module Shoes
  module Mutations
    class UpdateShoes < ::Mutations::BaseMutation
      description 'Create Shoes'

      ALLOWED_ACCESS = :only_for_managers
      allow_mutation_access ALLOWED_ACCESS

      argument :id, ID, required: true
      argument :brand_name, String, required: false
      argument :category, String, required: false
      argument :color, String, required: false
      argument :model, String, required: false
      argument :size, String, required: false
      argument :price, Integer, required: false
      argument :amount, Integer, required: false

      type ::Shoes::Types::BaseShoesType

      def resolve(id:, **params)
        shoes = Shoe.find_by(id:)

        raise GraphQL::ExecutionError, I18n.t('errors.entity_is_blank', entity: 'Shoes' ) if shoes.blank?
        raise GraphQL::ExecutionError, shoes.errors.full_messages.join(', ') unless shoes.update(**params)

        shoes.reload
      end
    end
  end
end
