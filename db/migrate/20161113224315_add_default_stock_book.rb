class AddDefaultStockBook < ActiveRecord::Migration
  def up
  change_column :books, :stock, :integer, default: 0
end

def down
  change_column :books, :stock, :integer, default: nil
end
end
