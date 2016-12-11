# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
n1 = Neighborhood.create([{ name: 'Bushwick' }, { city:'New York' }, { state:'NY' }, { latitude: 40.6944282 }, { longitude: -73.9212857}])
      Incident.create(description: 'Robbery', neighborhood_id: 1)
      Incident.create(description: 'Destruction of Property', neighborhood_id: 1)
      Incident.create(description: 'Assault', neighborhood_id: 1)

n2 = Neighborhood.create([{ name: 'Wagener Terrace' }, { city:'Charleston' }, { state:'SC' }, { latitude: 32.8161928 }, { longitude: -79.95144640000001}])
      Incident.create(description: 'Theft', neighborhood_id: 2)
      Incident.create(description: 'Car damage', neighborhood_id: 2)
      Incident.create(description: 'Broken window on front door', neighborhood_id: 2)


n3 = Neighborhood.create([{ name: 'Garden District' }, { city:'New Orleans' }, { state:'LA' }, { latitude: 29.9292146 }, { longitude: -90.08285330000001}])
      Incident.create(description: 'House fire', neighborhood_id: 3)
      Incident.create(description: 'Stolen Property', neighborhood_id: 3)
      Incident.create(description: 'Car theft', neighborhood_id: 3)

n4 = Neighborhood.create([{ name: 'Noe Valley' }, { city:'San Francisco' }, { state:'CA' }, { latitude: 37.7502378 }, { longitude: -122.43370290000001}])
      Incident.create(description: 'Property Damage', neighborhood_id: 4)
      Incident.create(description: 'Break In', neighborhood_id: 4)
      Incident.create(description: 'Got jumped', neighborhood_id: 4)
