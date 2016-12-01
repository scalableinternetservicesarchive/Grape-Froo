class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :meme, touch: true
  belongs_to :parent, class_name: 'Comment', optional: true, touch: true
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy

  validates :user, presence: true
  validates :meme, presence: true
  validates :message, length: { minimum: 1, maximum: 8000 }
  validates_presence_of :parent, if: 'parent_id.present?'
end
