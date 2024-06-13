# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  address    :string
#  city       :string
#  state      :string
#  status     :string
#  zip_code   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shoe_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_orders_on_shoe_id  (shoe_id)
#  index_orders_on_user_id  (user_id)
#
class Order < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :shoe

  validates :address, :city, :state, :zip_code, presence: true

  STATES = CS.states(:us).keys.map(&:to_s)

  enumerize :state, in: STATES

  # add state machine for status
end
