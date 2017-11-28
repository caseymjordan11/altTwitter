class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/default_image.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :tweets, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :favorites
  has_many :users, through: :favorites

  has_many :follow_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :follow_relationships, source: :followed
  has_many :followers, through: :followed_relationships, source: :follower





  def follow(other)
    follow_relationships.create(followed_id: other.id)
  end

  def unfollow(other)
    follow_relationships.find_by(followed_id: other.id).destroy
  end

  def following?(other)
    following.include?(other)
  end


end
