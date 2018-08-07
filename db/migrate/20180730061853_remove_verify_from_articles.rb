# frozen_string_literal: true

class RemoveVerifyFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :verify, :integer
  end
end
