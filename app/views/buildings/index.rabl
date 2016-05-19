object @buildings
attributes :id, :name
child(:building_users) { attributes :name }