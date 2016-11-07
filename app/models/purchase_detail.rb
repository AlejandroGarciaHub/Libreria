class PurchaseDetail < ActiveRecord::Base

	belongs_to :purchase
	belongs_to :book
end
