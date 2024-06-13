module Orders
  module Queries
    class GetOrders < ::Queries::BaseQuery
      description 'Get orders'

      argument :id, ID, required: false
      argument :address, String, required: false
      argument :city, String, required: false
      argument :state, String, required: false
      argument :status, String, required: false
      argument :size, String, required: false
      argument :zip_code, Integer, required: false
      argument :shoe_id, Integer, required: false
      argument :user_id, Integer, required: false

      # Pagination
      argument :pagination, ::Inputs::Pagination, required: false, default_value: {}, replace_null_with_default: true

      # Ordering
      argument :sort_by, ::Orders::Enum::OrdersSortFieldsEnumType, required: false, default_value: nil

      type ::Orders::Types::BaseOrdersType.collection_type, null: true

      def resolve(pagination:, sort_by:, **params)

        filtered_orders = OrdersServices::Filter.new(params, orders_scope).call
        RecordsSliceService.slice(filtered_orders, sort_by, pagination)
      end

      def orders_scope
        current_resource.manager? ? Order.all : current_resource.orders
      end
    end
  end
end
