class UsersController < ApplicationController

  	def index
  		@users = User.all
  		@user = User.new
  	end

    def show
  		@user = User.find(params[:id])
      @books = @user.books.page(params[:page]).reverse_order#合ってるか分からない。そのユーザーの投稿のみ表示、pageメソッドで、すべての投稿が表示されない
  end

  	def create
  		@user = User.new(user_params)
  		if @user.save
  		   redirect_to books_path
  		   flash[:notice] = "You have creatad book successfully."
  		else
  	   	   @users = User.all
  	       flash[:notice]
  	       render "books/index" #同じコントローラ内の移動ならアクション名だけ。今回は違うコントローラのページに行きたいから、コントローラ名/アクション名
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
    	params.require(:user).permit(:name, :introduction, :profile_image)
  	end

end




    #def destroy
     # PostComment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
      #redirect_to post_image_path(params[:post_image_id])
    #end