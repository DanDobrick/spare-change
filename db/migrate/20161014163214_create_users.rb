class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :plaid_id
      t.string :stripe_account
      t.decimal :bucket, null: false, default: 0.00, precision: 10, scale: 2
      t.string :current_charity_ein
      t.string :current_charity_name
      t.string :last_purchase

      t.timestamps null: false
    end
  end
end