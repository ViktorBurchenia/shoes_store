# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  account_type           :string
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  phone                  :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#
class User < ApplicationRecord
  extend Enumerize

  include GraphqlDevise::Authenticatable
  include Rollable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :orders

  ACCOUNT_TYPES = [CUSTOMER = 'customer'.freeze, MANAGER = 'manager'.freeze]

  enumerize :account_type, in: ACCOUNT_TYPES, predicates: true
end
