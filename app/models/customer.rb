class Customer < ActiveRecord::Base
  has_many :invoices
  belongs_to :user
  has_many :payees
  accepts_nested_attributes_for :payees
end
