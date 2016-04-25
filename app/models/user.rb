class User < ActiveRecord::Base
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
  mount_uploader :user_image, MeetyourstreetUploader

  geocoded_by :street
  after_validation :geocode
  after_update :geocode

end
