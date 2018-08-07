# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview
  def post_create
    @blog = Blogger.last
    @post = Article.last
    @user = User.last
    PostMailer.post_create(@user, @blog, @post)
  end

  def post_verify
    @blog = Blogger.last
    @post = Article.last
    @user = User.last
    PostMailer.post_create(@user, @blog, @post)
  end

  def post_comment
    @blog = Blogger.last
    @post = Article.last
    @user = User.last
    PostMailer.post_comment(@user, @blog, @post)
    
  end
end
