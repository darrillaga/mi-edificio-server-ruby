json.(@post, :id, :text, :building_id, :created_at, :updated_at)
json.building_user do
  json.partial! 'building_users/building_user', "@building_user": @post.building_user
end