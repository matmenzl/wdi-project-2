class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { in: 5..500 }
  validates :image, presence: true
end
