class Template < ApplicationRecord
  validates :name, presence: true, length: { in: 4..255 }
end
