class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_commentable

  validates :title, presence: true, length: { in: 5..500 }
  validates :image, presence: true

  mount_uploader :image, MeetyourstreetUploader

end
