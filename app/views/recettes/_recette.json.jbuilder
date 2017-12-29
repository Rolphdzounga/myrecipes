json.extract! recette, :id, :name, :description, :created_at, :updated_at
json.url recette_url(recette, format: :json)
