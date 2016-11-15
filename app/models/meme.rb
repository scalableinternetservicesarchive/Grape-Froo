class Meme < ApplicationRecord
  belongs_to :template
  belongs_to :user
  has_many :votes
  has_many :comments, dependent: :destroy

  has_attached_file :image
  validates_attachment :image, presence: true, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"]  }

  def root_comments
    comments.where parent_id: nil
  end
end
