class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    #params hash => params method which returns hash
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  # def create
  #   @article = Article.new
  #   @article.title = params[:article][:title]
  #   @article.body = params[:article][:body]
  #   @article.save
  #   redirect_to article_path(@article)
  # end

  def create
    # @article = Article.new(
    #   title: params[:article][:title],
    #   body: params[:article][:body])
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article '#{@article.title}' created!"

    redirect_to article_path(@article)
  end

  def destroy
    # @article = Article.find(params[:id]).destroy
    flash.notice = "Article '#{@article.title}' deleted!"
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end
end
