class PostCommentsController < ApplicationController
	# create避難
    before_action :confirm_new, only: [:post_comment]

	def show
        @new_book = Book.new
	    @book = Book.find(params[:book_id])
		@user_profile = current_user
	end

    def confirm_new
    	@book = Book.find(params[:book_id])
	    @comment = current_user.post_comments.new(post_comment_params)
        # # 明日メンターさんに聞いてみる
            # # render用の記述
            # @user_profile = current_user
            # @new_book = Book.new
            # @user = @book.user
        # # 確認画面に行く前にバリデーションしたいが
        # #model_namefor nil:NilClassとでて上手くいかない。空白のときにbook/showには飛べている
        # render 'books/show' if @book.valid?
    end

    def create
        @user_profile = current_user
        #@user = Book.find(params[:id]).user
    	@book = Book.find(params[:book_id])
	    @post_comment = current_user.post_comments.new(post_comment_params)
        @post_comment.book_id = @book.id
    	if params[:back].present?
            @new_book = Book.new
            @user = @book.user
    		render 'books/show'
    		return
    	end
    	if  @post_comment.save
    		redirect_to book_path(@book), notice: "コメント「#{@post_comment.comment}」を登録しました"
    	else
            @new_book = Book.new
            @user = @book.user
            render 'books/show',notice: "空白では投稿できません"
    	end
    end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end