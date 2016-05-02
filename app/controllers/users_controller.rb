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
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    render 'edit'
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  # get users/:id/edit
  def edit
  end

  # post users/:id
  def put
    redirect_to user_path
  end

  def patch
    redirect_to user_path
  end

  # delete users/:id
  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

end
