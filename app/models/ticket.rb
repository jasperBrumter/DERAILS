class Ticket < ApplicationRecord
  belongs_to :user
  has_many :responses
  validates :city, presence: true
  validates :description, presence: true
end
