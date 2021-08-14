class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.all
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render action: :edit
    else
      redirect_to user_path(current_user.id) 
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice:"You have updated user successfully."
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:introduction, :image)
  end
  
end
