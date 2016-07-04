class CreatePayees < ActiveRecord::Migration
  def change
    create_table :payees do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
      t.integer :user_id
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
