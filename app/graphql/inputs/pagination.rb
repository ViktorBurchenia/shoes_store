module Inputs
  class Pagination < ::Types::BaseInputObject
    description 'Pagination input'

    argument :limit, Integer, 'Amount of items per page for pagination', required: false, default_value: nil
    argument :page, Integer, 'Set needed page for pagination', required: false, default_value: nil
  end
end
