module Orders
  module Mutations
    class CreateOrder < ::Mutations::BaseMutation
      description 'Create Order'

      ALLOWED_ACCESS = :only_for_customers
      allow_mutation_access ALLOWED_ACCESS

      argument :address, String, required: true
      argument :city, String, required: true
      argument :state, String, required: true
      argument :zip_code, Integer, required: true
      argument :shoe_id, Integer, required: true

      type ::Orders::Types::BaseOrdersType

      def resolve(**params)
        params[:user_id] = current_resource.id

        validate_order(params)

        orders = Order.new(**params)

        raise GraphQL::ExecutionError, orders.errors.full_messages.join(', ') unless orders.save

        orders.reload
      end

      def validate_order(params)
        shoe = Shoe.find_by(id: params[:shoe_id])

        raise GraphQL::ExecutionError, I18n.t('errors.orders.shoes_is_not_present' ) unless shoe.present?

        return if shoe.amount.to_i > Shoe::MINIMAL_AMOUNT_FOR_ORDER

        raise GraphQL::ExecutionError, I18n.t('errors.orders.shoes_is_out_of_stock')
      end
    end
  end
end
