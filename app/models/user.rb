# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
  has_many :articles, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :bloggers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar
  accepts_nested_attributes_for :address
end
