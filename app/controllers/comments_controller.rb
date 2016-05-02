class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new()
  end

  def create
    redirect_to login_path unless current_user
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.user = current_user
    @comment.article = Article.find(params[:article_id])

    if @comment.save
      redirect_to article_path(@comment.article)
    else
      render "article/#{params[:article_id]}"
    end
  end
end
