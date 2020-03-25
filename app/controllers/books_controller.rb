# これはbooksコントローラー

class BooksController < ApplicationController

# authenticate_user！でログイン認証されてない場合home画面へリダイレクトとする
  before_action :authenticate_user!
  # カレントユーザーだけしかedit,update,destroyアクションは使えない。
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}


# ※カレントユーザー以外は直接リンクを入力しても編集ページにいけないようにする
def ensure_correct_user
  @book = Book.find(params[:id])
  # ※カレントユーザーIDがbook.user_idと同じでない場合はbooks_pathへ飛ばす
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
    redirect_to books_path
  end

  def create
    @book = Book.new(book_params)
    # 今ログインしているユーザのIDをuser_idへ代入する。この項目を入力しないとviewへ送れない
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
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
