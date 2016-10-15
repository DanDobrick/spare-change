class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :user_id, null: false
      t.string :current_charity_ein, null: false
      t.decimal :user_bucket, null: false, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
