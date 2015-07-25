class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    params = comment_params.merge(:user_id => current_user.id)
    @comment = @article.comments.create(params)
    redirect_to article_path(@article)
  end
 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  def new
  	@comment = Comment.find(params[:comment_id])
  	@article = @comment.article
  end
    private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :parent_id, :user_id)
    end
end
