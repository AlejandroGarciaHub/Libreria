class CreatePurchaseDetails < ActiveRecord::Migration
  def change
    create_table :purchase_details do |t|
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
