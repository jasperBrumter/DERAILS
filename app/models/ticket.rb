class Ticket < ApplicationRecord
  belongs_to :user
  has_many :responses

  mount_uploader :photo_1, PhotoUploader
  mount_uploader :photo_2, PhotoUploader
  mount_uploader :photo_3, PhotoUploader


  validates :city, presence: true
  validates :description, presence: true
end
