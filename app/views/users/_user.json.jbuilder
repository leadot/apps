json.extract! user, :id, :first_name, :last_name, :city, :state, :address, :neighborhood_id, :street, :latitude, :longitude, :created_at, :updated_at
json.url user(user, format: :json)
