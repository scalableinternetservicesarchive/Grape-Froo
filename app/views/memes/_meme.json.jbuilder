json.extract! meme, :id, :url, :top_caption, :middle_caption, :bottom_caption, :template_id, :user_id, :created_at, :updated_at
json.url meme_url(meme, format: :json)