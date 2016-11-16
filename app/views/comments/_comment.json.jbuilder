json.extract! comment, :id, :message, :user_id, :meme_id, :parent_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)