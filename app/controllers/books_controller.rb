class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(@book.user.id)
  end

  def index
    @user = User.find(params[:current_user_id])
    @book = Book.new
    @books = Books.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end
  
  def destroy
    @book = Book.find(params[:id])
  end
  
  def book_params
    params.require(:book).permit(:title,:opinion)
  end
end
