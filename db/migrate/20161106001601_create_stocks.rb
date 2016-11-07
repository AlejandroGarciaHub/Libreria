class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.boolean :en_stock
      t.integer :stockActual
      t.date :fechaIngreso

      t.timestamps null: false
    end
  end
end
