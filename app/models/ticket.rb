class Ticket < ApplicationRecord
  belongs_to :user
  has_many :responses, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo_1, PhotoUploader
  mount_uploader :photo_2, PhotoUploader
  mount_uploader :photo_3, PhotoUploader


end
