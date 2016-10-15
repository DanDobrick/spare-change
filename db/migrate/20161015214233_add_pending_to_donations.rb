class AddPendingToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :pending, :boolean, default: true
  end
end
