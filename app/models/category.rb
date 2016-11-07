class Category < ActiveRecord::Base
	has_many :books

	validates :nombre, presence: :true, uniqueness: true
end
