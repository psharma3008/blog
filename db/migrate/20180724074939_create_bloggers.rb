# frozen_string_literal: true

class CreateBloggers < ActiveRecord::Migration[5.2]
  def change
    create_table :bloggers do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
