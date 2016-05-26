json.array!(@drugs) do |drug|
  json.extract! drug, :id, :name, :generic_name, :brand_name, :substance_name, :active_substance_name, :indication, :manufacturer, :category_id
  json.url drug_url(drug, format: :json)
end
