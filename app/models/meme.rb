class Meme < ApplicationRecord
  belongs_to :template
  belongs_to :user

  has_attached_file :image
  validates_attachment :image, presence: true
end
