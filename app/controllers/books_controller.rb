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
         @book.user_id = current_user.id #他人のページでは保存できないように？
    	if @book.save
    	   redirect_to book_path
    	   flash[:notice] = "You have creatad book successfully."
    	else
    	   @books = Book.all #mesiterroはここがない、meshoterroではrender先が画像投稿ページだから、いらない。今回は一覧に戻りたいからいると思う。
    	   flash[:notice]
    	   render :index
    	end
  end

  def edit
    	@book = Book.find(params[:id]) #meshiterroにはeditない
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
