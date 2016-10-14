class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :devise_user, null: false
      t.string :plaid_id
      t.string :stripe_account
      t.decimal :bucket, null: false, default: 0
      t.string :current_charity

      t.timestamps null: false
    end
  end
end
