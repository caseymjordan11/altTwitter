class Tweet < ApplicationRecord
  has_many :replies, dependent: :destroy
  belongs_to :user

  has_many :favorites
  has_many :users, through: :favorites

  validates :content, presence: true, length: { maximum: 140 }

end
