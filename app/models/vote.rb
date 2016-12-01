class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :meme, touch: true
end
