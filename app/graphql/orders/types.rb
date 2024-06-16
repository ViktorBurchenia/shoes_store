module Orders
  module Types
    class BaseOrdersType < ::Types::BaseObject
      description 'Base orders type'

      field :id, Integer, null: false
      field :user_id, Integer, null: false
      field :zip_code, Integer, null: false
      field :address, String, null: false
      field :city, String, null: false
      field :state, String, null: false
      field :status, String, null: false
      field :shoe, ::Shoes::Types::BaseShoesType, null: false
    end
  end
end
