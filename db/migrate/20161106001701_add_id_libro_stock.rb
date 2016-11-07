class AddIdLibroStock < ActiveRecord::Migration
  def change
  	add_reference :stocks, :book, index: true, foreign_key: true
  end
end
