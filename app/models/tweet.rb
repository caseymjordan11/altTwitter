class Tweet < ApplicationRecord
  has_many :replies, dependent: :destroy
  belongs_to :user
end
