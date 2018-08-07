# frozen_string_literal: true

class AddBloggerToArticle < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :blogger, foreign_key: true
  end
end
