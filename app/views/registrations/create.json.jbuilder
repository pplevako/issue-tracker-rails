json.(@user, :id, :email, :created_at, :updated_at)
json.roles do
  json.array! user_roles(@user)
end
