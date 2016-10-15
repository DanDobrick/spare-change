class UpdateUsersBucket < ActiveRecord::Migration
  def up
    remove_column :users, :last_purchase
  end

  def change
    change_table :users do |t|
      t.string :rounded_transactions, array: true, default: []
    end
  end
end
