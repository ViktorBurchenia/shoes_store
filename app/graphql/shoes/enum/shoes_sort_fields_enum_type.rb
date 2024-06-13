module Shoes
  module Enum
    class ShoesSortFieldsEnumType < ::Types::BaseEnum
      description 'Shoes sort available values'

      value 'brand_name_asc', value: { brand_name: :asc }
      value 'brand_name_desc', value: { brand_name: :desc }
      value 'amount_asc', value: { amount: :asc }
      value 'amount_desc', value: { amount: :desc }
      value 'category_asc', value: { category: :asc }
      value 'category_desc', value: { category: :desc }
      value 'color_asc', value: { color: :asc }
      value 'color_desc', value: { color: :desc }
      value 'model_asc', value: { model: :asc }
      value 'model_desc', value: { model: :desc }
      value 'price_asc', value: { price: :asc }
      value 'price_desc', value: { price: :desc }
      value 'size_asc', value: { size: :asc }
      value 'size_desc', value: { size: :desc }
      value 'created_at_asc', value: { created_at: :asc }
      value 'created_at_desc', value: { created_at: :desc }
    end
  end
end
