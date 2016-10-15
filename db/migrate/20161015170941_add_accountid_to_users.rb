class AddAccountidToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :account_id
    end
  end
end
