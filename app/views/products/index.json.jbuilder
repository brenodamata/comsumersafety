json.array!(@products) do |product|
  json.extract! product, :id, :name, :manufacturer, :manufacturer_countries, :description, :model, :type, :category_id
  json.url product_url(product, format: :json)
end
