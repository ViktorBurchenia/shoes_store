# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  account_type :string
#  first_name   :string
#  last_name    :string
#  phone        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# class User < ApplicationRecord
#   has_many :orders
# end
