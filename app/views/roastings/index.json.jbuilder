json.array!(@roastings) do |roasting|
  json.extract! roasting, :id, :name, :description, :price
  json.url roasting_url(roasting, format: :json)
end
