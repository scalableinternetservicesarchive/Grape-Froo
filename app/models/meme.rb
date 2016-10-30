class Meme < ApplicationRecord
  belongs_to :template
  belongs_to :user

  has_many :votes

end
