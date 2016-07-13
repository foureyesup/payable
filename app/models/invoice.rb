class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  accepts_nested_attributes_for :customer
  has_many :lines
  accepts_nested_attributes_for :lines, allow_destroy: true
end
