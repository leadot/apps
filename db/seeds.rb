# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
neighborhoods = Neighborhood.create([{ name: 'Brooklyn' }, { city:'NY' }, { state:'NY' }])
Incident.create(description: 'Robbery', neighborhood_id: neighborhoods.first)
