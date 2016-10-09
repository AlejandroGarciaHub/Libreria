class Book < ActiveRecord::Base

	validates :titulo,presence: true 
	validates :descripcion, presence: true
	validates :fecha_lanzamiento, presence: true 
	validates :precio_compra, presence: true
	validates :precio_venta, presence: true
	validates :autor, presence: true
	validates :num_paginas, presence: true
	validates :editorial, presence: true
end
