json.(@comment, :id, :text, :post_id, :building_id, :created_at, :updated_at)
json.building_user do
  json.partial! 'building_users/building_user', "@building_user": @comment.building_user
end