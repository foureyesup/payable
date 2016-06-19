class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :user_id
      t.text :given_name
      t.text :family_name
      t.text :company
      t.text :email
      t.text :address_line1
      t.text :address_line2
      t.string :city
      t.text :region
      t.text :zip
      t.text :country
      t.text :phone
      t.text :vat_number
      t.text :payment_terms
      t.text :vat

      t.timestamps null: false
    end
  end
end
