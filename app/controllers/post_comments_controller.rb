class PostCommentsController < ApplicationController

    def destroy
        @book = Book.find(params[:book_id])
        @comment = PostComment.find_by(book_id: params[:book_id])
        @comment.destroy
        redirect_to book_post_comments_path(@book), notice: "コメント「#{@comment.comment}」を削除しました"
    end

	def show
        @new_book = Book.new
	    @book = Book.find(params[:book_id])
		@user_profile = current_user
	end

    def confirm_new
        @book = Book.find_by(params[:book_id])
	    @comment = PostComment.new(post_comment_params)
            # render用の記述
            @user_profile = current_user
            @new_book = Book.new
            @user = @book.user
        @comment.user_id = current_user.id
        @comment.book_id = @book.id
        render 'books/show' if @comment.invalid?
    end

    def create
        @user_profile = current_user
        #@user = Book.find(params[:id]).user
    	@book = Book.find_by(params[:book_id])
	    @comment = @book.post_comments.new(post_comment_params)
        @comment.user_id = current_user.id
    	if params[:back].present?
            @new_book = Book.new
            @user = @book.user
    		render 'books/show'
            # render。redirect_toを複数回使う時はreturunで
            return
    	end
    	if  @comment.save
    		redirect_to book_path(@book), notice: "コメント「#{@comment.comment}」を登録しました"
    	else
            @new_book = Book.new
            @user = @book.user
            render 'books/show'
    	end
    end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end