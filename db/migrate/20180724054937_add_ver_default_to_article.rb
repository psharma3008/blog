# frozen_string_literal: true

class AddVerDefaultToArticle < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :verify, :integer, default: '0'
  end
end
