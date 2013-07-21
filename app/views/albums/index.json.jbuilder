json.array!(@albums) do |album|
  json.extract! album, :title, :author, :rating, :text, :user_id
  json.url album_url(album, format: :json)
end
