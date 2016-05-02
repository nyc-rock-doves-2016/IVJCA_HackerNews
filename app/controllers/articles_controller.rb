class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end


  def new
    redirect_to login_path unless current_user
    @article = Article.new()
    @article.user = current_user

  end

  def create
    redirect_to login_path unless current_user
    @article = Article.new(params.require(:article).permit(:title, :body))
    @article.user = current_user

    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    redirect_to login_path unless current_user
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.user
  end

  def update
    redirect_to login_path unless current_user
    redirect_to article_path
  end

  def delete
    redirect_to login_path unless current_user
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end
