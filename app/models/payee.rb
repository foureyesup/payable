class Payee < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :user
end
