class Payee < ActiveRecord::Base
  belongs_to :customer
end
