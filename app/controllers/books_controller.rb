class BooksController < ApplicationController

	def index
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

	def new
		@book=Book.new
	end

	def create
		@book= Book.new(titulo: params[:book][:titulo],
			descripcion: params[:book][:descripcion],
			autor: params[:book][:autor],
			fecha_lanzamiento: params[:book][:fecha_lanzamiento],
			editorial: params[:book][:editorial],
			num_paginas: params[:book][:num_paginas],
			precio_compra: params[:book][:precio_compra],
			precio_venta: params[:book][:precio_venta])

		if @book.save
			redirect_to @book
		else
			render :new
		end		
	end

	def update
		
	end
end
