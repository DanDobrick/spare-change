class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :donor_id, null: false
      t.decimal :amount, null: false
      t.string :merchant, null: false
      t.datetime :date, null: false
      t.boolean :pending?, null: false

      t.timestamps null: false
    end
  end
end
