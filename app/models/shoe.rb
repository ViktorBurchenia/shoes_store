# == Schema Information
#
# Table name: shoes
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  brand_name :string
#  category   :string
#  color      :string
#  images     :string           default([]), is an Array
#  model      :string
#  price      :integer
#  size       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Shoe < ApplicationRecord
  extend Enumerize

  has_many :orders

  validates :brand_name, :category, :color, :price, :size, :amount, presence: true
  validates :brand_name, uniqueness: { scope: [:category, :color, :model, :price, :size] }

  CATEGORIES = %w[Sneakers Boots Loafers Sandals]
  SIZES = %w[36 36.5 37 37.5 38 38.5 39 39.5 40 40.5 41 41.5 42 42.5 43 43.5 44]
  BRAND_NAMES = %w[Adidas Nike Reebok Timberland Clarks Dr.Martens Sorel]
  MINIMAL_AMOUNT_FOR_ORDER = 1

  enumerize :category, in: CATEGORIES
  enumerize :size, in: SIZES
  enumerize :brand_name, in: BRAND_NAMES

  scope :by_query, lambda { |str|
    where(
      "brand_name ILIKE :search_input OR " \
      "category ILIKE :search_input OR " \
      "color ILIKE :search_input OR " \
      "model ILIKE :search_input",search_input: "%#{str.squish}%"
    )
  }
end
