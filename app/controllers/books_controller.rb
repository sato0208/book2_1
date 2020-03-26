class BooksController < ApplicationController


# ※カレントユーザー以外は直接リンクを入力しても編集ページにいけないようにする
def ensure_correct_user
  @book = Book.find(params[:id])
  # ※カレントユーザーIDがbook.user_idと同じでない場合はbooks_pathへ飛ばす !=はif notと同じ
  if current_user.id != @book.user_id
    flash[:notice] = "ページにアクセスする権限がありません"
    redirect_to(books_path)
  end
end

  def top
  end

  def about
  end
  # 画像の投稿を表示させる
  def new
    @book = Book.new
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path, notice:'You have updated book successfully.'
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @user_profile = current_user
    # 今ログインしているユーザのIDをuser_idへ代入する。この項目を入力しないとviewへ送れない
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path(@book.id), notice:'You have updated book successfully.'
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user_profile = current_user
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = Book.find(params[:id]).user
    @user_profile = current_user
    # コメントを表示する
    @post_comment = PostComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
