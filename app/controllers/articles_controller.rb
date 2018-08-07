# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :get_blod_articles
  before_action :get_article, except: %i[new create show index]
  def index
    @blog = Blogger.find(params[:blogger_id])
    @blog_id = @blog.id
    @articles = @blog.articles
  end

  def new
    @article = Article.new
  end

  def show
    @post = @blog.articles.find(params[:id])
    @comment =  @post.comments.new
    @comments = @post.comments
  end

  def create
    @article = @blog.articles.create(article_params)
    @article.user = current_user
    if @article.save
      PostMailer.post_create(current_user, @blog, @article).deliver_now
      redirect_to action: 'index'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to action: 'index'
    else
      render 'edit'
      end
  end

  def edit; end

  def destroy
    @article.destroy
    # redirect_to action: 'index'
  end

  def verify
    @article.update_columns(published: true)
    PostMailer.post_verify(@blog.user.email, @blog, @article).deliver_now
    redirect_to action: 'index'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :avatar)
  end

  def get_blod_articles
    @blog = Blogger.find(params[:blogger_id])
  end

  def get_article
    @article = Article.find(params[:id])
  end
end
