class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates_presence_of :title
end
