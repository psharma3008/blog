# frozen_string_literal: true

class BloggerController < ApplicationController
  before_action :blog_id, only: %i[show destroy update edit]
  def index
    @blogger = Blogger.all
  end

  def new
    @user = current_user
    @blogger = Blogger.create
  end

  def create
    @user = current_user
    @blogger = Blogger.create(blogger_params)
    @blogger.user_id = @user.id
    if @blogger.save
      redirect_to action: 'index'
    else
      redirect_to action: 'new'
    end
  end

  def show
    @articles = @blogger.articles
  end

  def destroy
    @blogger.destroy
    redirect_to blogger_index_path
  end

  def update
    if @blogger.update(blogger_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def edit; end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :avatar)
  end

  def blog_id
    @blogger = Blogger.find(params[:id])
  end
end
