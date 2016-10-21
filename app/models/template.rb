class UrlValidator < ActiveModel::Validator
  # Potentially slow!!
  def validate(record)
    url = URI.parse(record.url)
    if url.host.blank? || url.port.blank?
      record.errors[:base] << "Invalid image URL"
      return
    end
    request = Net::HTTP.new(url.host, url.port)
    request.use_ssl = (url.scheme == "https")
    response = request.head(url.path.presence || "/")
    if !(response.code == "200" && response['Content-Type'].starts_with?("image"))
      record.errors[:base] << "Invalid image URL"
    end
  end
end

class Template < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: { in: 4..255 }
  validates_with UrlValidator, fields: [:url]
end
