# frozen_string_literal: true

class CreateAddress < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
