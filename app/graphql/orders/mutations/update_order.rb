module Orders
  module Mutations
    class UpdateOrder < ::Mutations::BaseMutation
      description 'Update Order'

      ALLOWED_ACCESS = :only_for_managers
      allow_mutation_access ALLOWED_ACCESS

      argument :id, Integer, required: true

      # Make required later
      argument :status, Enum::StatusEnumType, required: false

      type ::Orders::Types::BaseOrdersType

      def resolve(id:, status:)
        order = Order.find_by(id:)

        raise GraphQL::ExecutionError, I18n.t('errors.entity_is_blank', entity: 'Order' ) if order.blank?
        raise GraphQL::ExecutionError, shoes.errors.full_messages.join(', ') unless order.send(status)

        order.reload
      end
    end
  end
end
