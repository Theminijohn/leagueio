json.array!(@updates) do |update|
  json.extract! update, :title, :body
  json.url update_url(update, format: :json)
end
