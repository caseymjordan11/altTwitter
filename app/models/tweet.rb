class Tweet < ApplicationRecord
  has_many :replies, dependent: :destroy
  belongs_to :user

  has_many :favorites
  has_many :users, through: :favorites

end
