# frozen_string_literal: true

class AddVerifyToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :verify, :integer
  end
end
