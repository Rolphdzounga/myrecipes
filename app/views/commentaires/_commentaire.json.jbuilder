json.extract! commentaire, :id, :description, :chef_id, :recette_id, :created_at, :updated_at
json.url commentaire_url(commentaire, format: :json)
