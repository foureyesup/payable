class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  has_one :payee, through: :customer
  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :payee
end
