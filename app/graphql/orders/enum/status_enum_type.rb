module Orders
  module Enum
    class StatusEnumType < ::Types::BaseEnum
      description 'Order sort available values'

      value 'accept', value: 'accept'
      value 'cancel', value: 'cancel'
      value 'deliver', value: 'deliver'
      value 'initiate_refund', value: 'initiate_refund'
      value 'process_refund', value: 'initiate_refund'
    end
  end
end
