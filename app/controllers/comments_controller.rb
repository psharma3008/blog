# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :get_blog, :get_post
  before_action :get_blog_create, only: [:create]
  before_action :get_comment, only: %i[edit update destroy]
  def new
    @comment = @article.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comments = @post.comments
    if @comment.save
      PostMailer.post_comment(@post.user.email, @post.blogger.name, @post).deliver
      byebug
      respond_to do |format|
        format.html
        format.js
      end
    else
      render ‘new’
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      @comments = @post.comments
      respond_to do |format|
        format.html
        format.js
      end
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    @comments = @post.comments
    respond_to do |format|
      # format.html
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

  def get_blog
    @blog = Blogger.find(params[:blogger_id])
  end

  def get_post
    @post = Article.find(params[:article_id])
  end

  def get_comment
    @comment = Comment.find(params[:id])
  end

  def get_blog_create
    @post = @blog.articles.find(params[:article_id])
  end
end
