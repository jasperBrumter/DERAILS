class Response < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validates :content, presence: true
  validates :contact, presence: true
  validates :price, presence: true
end
