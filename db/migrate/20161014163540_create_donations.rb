class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :donor_id, null: false
      t.integer :charity_id, null: false
      t.decimal :user_bucket, null: false

      t.timestamps null: false
    end
  end
end
