class AddMaxToUser < ActiveRecord::Migration
  def change
    add_column :users, :max_donation, :decimal
  end
end
