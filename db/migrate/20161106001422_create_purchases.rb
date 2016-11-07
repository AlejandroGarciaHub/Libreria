class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.date :fecha
      t.string :pago

      t.timestamps null: false
    end
  end
end
