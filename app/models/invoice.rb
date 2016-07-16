class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  accepts_nested_attributes_for :customer
  has_many :lines
  accepts_nested_attributes_for :lines, allow_destroy: true
  has_one :payee
  accepts_nested_attributes_for :payee
  
  def autosave_associated_records_for_customer
    new_customer = Customer.find_or_create_by(company: customer.company, given_name: customer.given_name, 
      family_name: customer.family_name, email: customer.email, address_line1: customer.address_line1, 
      address_line2: customer.address_line2, city: customer.city, region: customer.region, 
      zip: customer.zip, country: customer.country, phone: customer.phone, 
      vat_number: customer.vat_number, payment_terms: customer.payment_terms, vat: customer.vat )
    self.customer = new_customer
  end
  
end
