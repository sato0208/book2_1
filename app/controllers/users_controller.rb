class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def show
	  @user = User.find(params[:id])
	  # Userテーブルからユーザデータを取り出してそれに紐づく内容をbooksとして表示する
	  @user_books = User.find(params[:id]).books
	  @book = Book.new
	  @user_profile = current_user
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path
	end

	def edit
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to books_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
