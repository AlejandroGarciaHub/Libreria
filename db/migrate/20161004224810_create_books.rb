class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :titulo
      t.text :descripcion
      t.decimal :precio_compra
      t.decimal :precio_venta

      t.timestamps null: false
    end
  end
end
