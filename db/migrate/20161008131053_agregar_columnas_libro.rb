class AgregarColumnasLibro < ActiveRecord::Migration
  def change
  	add_column :books, :autor, :string
  	add_column :books, :fecha_lanzamiento, :date
  	add_column :books, :num_paginas, :integer
  	add_column :books, :editorial, :string
  end
end
