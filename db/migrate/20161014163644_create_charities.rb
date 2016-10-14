class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name, null: false
      t.string :bank_info, null: false

      t.timestamps null: false
    end
  end
end
