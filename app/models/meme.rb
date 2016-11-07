class Meme < ApplicationRecord
  belongs_to :template
  belongs_to :user
  self.per_page = 50
  has_many :votes

  has_attached_file :image
  validates_attachment :image, presence: true, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"]  }
end
