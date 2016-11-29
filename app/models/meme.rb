class Meme < ApplicationRecord
  belongs_to :template
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  attr_accessor :user_vote

  has_attached_file :image
  validates_attachment :image, presence: true, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"]  }

  def root_comments
    comments.where parent_id: nil
  end

  def user_vote(current_user)
    v = self.votes.find_by(user: current_user)
    v ? v.value : nil
  end
end
