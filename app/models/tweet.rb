class Tweet < ApplicationRecord
  has_many :replies, dependent: :destroy
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :content, presence: true, length: { maximum: 140 }
  # Shouldn't this be 250? jk...

  default_scope { order("created_at ASC") }
end
