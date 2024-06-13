module Orders
  module Enum
    class OrdersSortFieldsEnumType < ::Types::BaseEnum
      description 'Order sort available values'

      value 'address_asc', value: { address: :asc }
      value 'address_desc', value: { address: :desc }
      value 'city_asc', value: { city: :asc }
      value 'city_desc', value: { city: :desc }
      value 'state_asc', value: { state: :asc }
      value 'state_desc', value: { state: :desc }
      value 'status_asc', value: { status: :asc }
      value 'status_desc', value: { status: :desc }
      value 'size_asc', value: { size: :asc }
      value 'size_desc', value: { size: :desc }
      value 'zip_code_asc', value: { zip_code: :asc }
      value 'zip_code_desc', value: { zip_code: :desc }
    end
  end
end
