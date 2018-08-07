# frozen_string_literal: true

class AddVerifyToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :published, :boolean, default: false
  end
end
