json.extract! incident, :id, :date, :description, :neighborhood_id, :address, :latitude, :longtitude, :created_at, :updated_at
json.url incident_url(incident, format: :json)
