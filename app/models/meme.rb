class Meme < ApplicationRecord
  belongs_to :template
  belongs_to :user
  self.per_page = 50
end
