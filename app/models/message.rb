class Message < ApplicationRecord

  validates :message, length: {maximum: 140}, presence: true
  belongs_to :user
  belongs_to :room

end
