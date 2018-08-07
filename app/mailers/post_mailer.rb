# frozen_string_literal: true

class PostMailer < ApplicationMailer
  def post_create(user, blog, post)
    @user = user
    @blog = blog
    @post = post
    mail(to: @user.email, subject: 'post create by you', body: "a post  #{@post.title}  on  #{@blog.name} is created by you")
  end

  def post_verify(user, blog, post)
    @user = user
    @blog = blog
    @post = post
    mail(to: @user, subject: 'post create by you', body: "a post  #{@post.title}  is verified by admin")
  end

  def post_comment(user, blog, post)
    @user = user
    @blog = blog
    @post = post
    mail(to: @user, subject: 'post create by you', body: "a comment is create on your post  #{@post.title}  ")
  end
end
