class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :customer_id
      t.string :invoice_number
      t.datetime :invoice_date
      t.datetime :due_date
      t.string :terms
      t.text :message

      t.timestamps null: false
    end
  end
end
