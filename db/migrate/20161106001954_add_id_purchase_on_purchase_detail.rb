class AddIdPurchaseOnPurchaseDetail < ActiveRecord::Migration
  def change
  	add_reference :purchase_details, :purchase, index: true, foreign_key: true
  	add_reference :purchase_details, :book, index: true, foreign_key: true
  end
end
