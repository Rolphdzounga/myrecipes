json.extract! chef, :id, :chefname, :email, :password, :password_confirmation, :created_at, :updated_at
json.url chef_url(chef, format: :json)
