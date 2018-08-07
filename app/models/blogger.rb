# frozen_string_literal: true

class Blogger < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy
  has_one_attached :avatar
end
