module Orders
  module Types
    class BaseOrdersType < ::Types::BaseObject
      description 'Base orders type'

      field :address, String, null: false
      field :city, String, null: false
      field :state, String, null: false
      field :status, String, null: false
      field :zip_code, Integer, null: false
      field :shoe, ::Shoes::Types::BaseShoesType, null: false
      field :user_id, Integer, null: false
    end
  end
end
