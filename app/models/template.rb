class Template < ApplicationRecord
  attr_accessor :url
  has_attached_file :image
  validates_attachment :image, presence: true, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"]  }, size: { in: 0..5.megabytes  }
  validates :name, uniqueness: true, presence: true, length: { in: 4..255 }
  belongs_to :user
  has_many :meme
  self.per_page = 25

  def url=(url_value)
    self.image = URI.escape(url_value)
    @url = url_value
  end

  def to_s
    self.name
  end
end
