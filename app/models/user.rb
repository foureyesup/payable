class User < ActiveRecord::Base
  has_many :customers
  has_many :invoices
  has_many :payees, through: :customers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
