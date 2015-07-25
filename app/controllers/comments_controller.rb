class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)


    #if params[:comment][:parent_id].to_i > 0
    #	parent = Comment.find_by_id(params[:comment].delete(:parent_id))
    # 	@comment = parent.children.build(comment_params)
	#else
   #	@comment = Comment.new(comment_params)
  	#end
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
      params.require(:comment).permit(:commenter, :body, :parent_id)
    end
end
