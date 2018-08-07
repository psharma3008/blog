class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  scope :published, -> {where( :published => true) }
  belongs_to :user
  belongs_to :blogger
  has_one_attached :avatar
end
