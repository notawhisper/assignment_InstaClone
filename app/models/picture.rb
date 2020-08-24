class Picture < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy 
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
