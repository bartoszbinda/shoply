# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @user = current_user
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @user = current_user
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comment_path }
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
