json.array!(@images) do |image|
  json.extract! image, :id, :label, :caption
  json.url image_url(image, format: :json)
end
