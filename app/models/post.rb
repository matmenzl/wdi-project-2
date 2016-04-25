class Post < ActiveRecord::Base
  belongs_to :user

  default_scope { order('created_at DESC') }
  
  acts_as_commentable

  validates :title, presence: true, length: { in: 5..500 }
  validates :image, presence: true

  mount_uploader :image, MeetyourstreetUploader

  geocoded_by :user
  after_validation :geocode
  after_update :geocode

end
