class Tweet < ApplicationRecord
  has_many :replies, dependent: :destroy
end
