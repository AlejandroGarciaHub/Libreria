class Purchase < ActiveRecord::Base

	belongs_to :user
	has_many :purchase_details

	accepts_nested_attributes_for :purchase_details
end
