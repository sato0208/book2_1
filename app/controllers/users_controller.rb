class UsersController < ApplicationController
	  # ※カレントユーザー以外は直接リンクを入力しても編集ページにいけないようにする
	def ensure_correct_user
	  @user = User.find(params[:id])
	  # ※カレントユーザーIDがbook.user_idと同じでない場合はbooks_pathへ飛ばす
	  @user_profire = current_user
	  if current_user.id != @user.id
	    redirect_to user_path(@user_profire)
	  end
	end

	def new
		@user = User.new
	end

	def index
		@users = User.all
		@user_profile = current_user
		@book = Book.new
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
		if @user.update(user_params)
		   redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def destroy
		reset_session
  		redirect_to root_path, alert: "Signed out successfully."
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
