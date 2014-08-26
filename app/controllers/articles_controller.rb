#all of the methods in Articles Controller should be the same name
#as the methods in Controller#Action from rake route
class ArticlesController < ApplicationController
  include ArticlesHelper
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    #use 'fail' to check out contents of params
    #backend
    @article = Article.new(article_params)
    @article.save
    
    flash.notice = "Article '#{@article.title}' Created!"
    #redirect after doing backend
    redirect_to article_path(@article)
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def destroy
    article = Article.find(params[:id])
    article.destroy
    
    flash.notice = "Article '#{article.title}' Destroyed!"
    redirect_to articles_path #uses prefix + _path from rake routes  
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    
    flash.notice = "Article '#{@article.title}' Updated!"
    
    redirect_to article_path(@article)
  end
  
  
end
