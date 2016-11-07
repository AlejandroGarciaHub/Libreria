class BooksController < ApplicationController

	def index
		@books = Book.all
	end

	def generos
		@categories=Category.all
		@books= Book.all
	end
	def show
		@book = Book.find(params[:id])
	end

	def new
		@book=Book.new
	end

	def edit
		@book = Book.find(params[:id])		
	end

	def create
		@book= Book.new(book_params)

		if @book.save
			redirect_to @book
		else
			render :new
		end		
	end

	def destroy
		@book=Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def update
		@book=Book.find(params[:id])		
		if @book.update(book_params)
			redirect_to @book
		else 
			render :edit
		end
	end

	private

	def book_params
		params.require(:book).permit(:titulo,:descripcion,:autor,:fecha_lanzamiento,:editorial,:num_paginas,
			:precio_compra,:precio_venta,:isbn, :category_id,:cover,:stock)
	end
end
