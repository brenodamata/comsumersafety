json.array!(@recalls) do |recall|
  json.extract! recall, :id, :number, :date, :description, :url, :title, :consumer_contact, :last_publish_date, :number_of_units, :injuries, :hazards, :remedies, :retailers, :country, :recallable_id, :recallable_type
  json.url recall_url(recall, format: :json)
end
