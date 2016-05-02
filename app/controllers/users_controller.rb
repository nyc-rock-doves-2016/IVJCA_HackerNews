class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(params.require(:user).permit(:email,:password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  # post users/:id
  def update
    redirect_to user_path
  end

  # delete users/:id
  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to articles_path
  end

end
