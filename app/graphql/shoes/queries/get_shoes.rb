module Shoes
  module Queries
    class GetShoes < ::Queries::BaseQuery
      description 'Get shoes'

      # Base field
      argument :id, ID, 'ID of shoes to retrieve', required: false
      argument :brand_name, String, 'Brand name to retrieve', required: false
      argument :category, String, 'Category of shoes to retrieve', required: false
      argument :color, String, 'Color of shoes to retrieve', required: false
      argument :model, String, 'Model of shoes to retrieve', required: false
      argument :size, String, 'Size of shoes to retrieve', required: false
      argument :price, Integer, 'Price of shoes to retrieve', required: false
      argument :amount, Integer, 'Amount of shoes to retrieve', required: false

      # Search
      argument :search_input, String,
               'Search by fields with custom text', required: false

      # Pagination
      argument :pagination, ::Inputs::Pagination, required: false, default_value: {}, replace_null_with_default: true

      # Ordering
      argument :sort_by, Enum::ShoesSortFieldsEnumType, required: false, default_value: nil

      type ::Shoes::Types::BaseShoesType.collection_type, null: true

      def resolve(pagination:, sort_by:, **params)
        filtered_shoes = ShoesServices::Filter.new(params).call
        RecordsSliceService.slice(filtered_shoes, sort_by, pagination)
      end
    end
  end
end
