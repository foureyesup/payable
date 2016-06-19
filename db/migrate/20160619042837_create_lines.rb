class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :invoice_id
      t.text :description
      t.datetime :date
      t.integer :quantity
      t.text :unit
      t.decimal :unit_price
      t.decimal :vat
      t.decimal :total

      t.timestamps null: false
    end
  end
end
