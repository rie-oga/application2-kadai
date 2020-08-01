class UsersController < ApplicationController

  	def index
  		@users = User.all
  		@user = User.new
  	end

    def show
  		@user = User.find(params[:id])
  end

  	def create
  		@user = User.new(user_params)
  		if @user.save
  		   redirect_to books_path
  		   flash[:notice] = "You have creatad book successfully."
  		else
  	   	   @users = User.all
  	       flash[:notice] = "errors prohibited this obj from being saved:"
  	       render "books/index"
  	    end
  	end

  	def edit
  		@user = User.find(params[:id])
  	end

  	 def update
  		@user = User.find(params[:id])
  		@user.update(user_params)
 	    redirect_to user_path(@user.id)
    end


  	private
  	def user_params
    	params.require(:user).permit(:title, :body)
  	end

end

