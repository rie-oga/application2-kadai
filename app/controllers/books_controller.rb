class BooksController < ApplicationController

	def index
		@books = Book.all
		@book = Book.new
  	end

 	def show
 		@book = Book.find(params[:id])
  	end

  	def create
  		@book = Book.new(book_params)
    	if @book.save
    	   redirect_to books_path
    	   flash[:notice] = "You have creatad book successfully."
    	else
    	   @books = Book.all
    	   flash[:notice] = "errors prohibited this obj from being saved:"
    	   render :index
    	end
  	end

  	def edit
    	@book = Book.find(params[:id])
  	end

  	def update
  		@book = Book.find(params[:id])
  		if @book.update(user_params)
  		   redirect_to books_path
  		   flash[:notice] = "You have creatad book successfully."
  		else
  		   flash[:notice] = "errors prohibited this obj from being saved:"
    	   render :index
	end

	def destroy
  		@book = Book.find(params[:id])
  		@book.destroy
  		redirect_to books_path
  end


  	private
  	def book_params
    	params.require(:book).permit(:title, :body)
  	end

end
