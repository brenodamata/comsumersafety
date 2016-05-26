json.array!(@medical_devices) do |medical_device|
  json.extract! medical_device, :id, :name, :brand, :specialty, :manufacturer, :category_id
  json.url medical_device_url(medical_device, format: :json)
end
