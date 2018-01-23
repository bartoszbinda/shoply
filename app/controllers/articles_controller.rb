# frozen_string_literal: true

class ArticlesController < ApplicationController
  def new
    @article = Article.new
    @user = current_user
  end

  def index
    @articles = Article.all
    @user = current_user
  end

  def show
    @article = Article.find(params[:id])
    @user = current_user
  end

  def edit
    @article = Article.find(params[:id])
    @user = current_user
  end

  def update
    @article = Article.find(params[:id])
    @user = current_user

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def create
    @article = Article.new(article_params)
    @user = current_user
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    @user = current_user
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, :video)
  end
end
