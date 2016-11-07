class Book < ActiveRecord::Base

	belongs_to :category
	has_one :stock
	has_many :purchase_details

	has_attached_file :cover, styles: {medium: "600x400", thumb:"300x200", mini:"150x100"}
	validates_attachment :cover, content_type: { content_type: /\Aimage\/.*\Z/ }

	validates :titulo,presence: true, uniqueness: true 
	validates :descripcion, presence: true,length: {minimum: 20}
	validates :fecha_lanzamiento, presence: true 
	validates :precio_compra, presence: true
	validates :precio_venta, presence: true
	validates :autor, presence: true
	validates :num_paginas, presence: true
	validates :editorial, presence: true
	validates :isbn, presence: true, uniqueness:true, length: {minimum: 10, maximum: 13}
	#validates :isbn, presence: true, uniqueness:true, length: {is: 10, is: 13}
end
