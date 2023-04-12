class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @article.comments.create(comment_params)
    @comment.user = current_user
    if !@comment.save
      flash[:alert] = @comment.errors.full_messages.to_sentence
    end
      redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comment.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @article = Article.find(params[:article_id])
  end
end
