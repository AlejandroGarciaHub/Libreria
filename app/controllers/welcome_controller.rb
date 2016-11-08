class WelcomeController < ApplicationController
  def index
  	@books = Book.order(:created_at)
  end
end
