class Picture < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorites, dependent: :destroy

  mount_uploader :image, ImageUploader
  validates :image, presence: true

end
