class CreatePayees < ActiveRecord::Migration
  def change
    create_table :payees do |t|
      t.text :first_name
      t.string :last_name
      t.string :email
      t.integer :user_id
      t.integer :invoice_id

      t.timestamps null: false
    end
  end
end
