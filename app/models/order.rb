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
  STATUSES = %w[in_progress accepted cancelled delivered refund finished]

  enumerize :state, in: STATES
  enumerize :status, in: STATUSES, predicates: true

  state_machine :status, initial: :in_progress do
    event :accept do
      transition :in_progress => :accepted
    end

    event :cancel do
      transition :in_progress => :cancelled
    end

    event :deliver do
      transition :accepted => :delivered
    end

    event :initiate_refund do
      transition [:accepted, :delivered] => :refund
    end

    event :process_refund do
      transition [:refund, :delivered] => :finished
    end
  end
end
